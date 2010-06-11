<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/CandidatoProcessoSeletivo.class.php';

include_once '../plugins/getLastDayOfMonth.function.php';

/*
foreach ($data as $d)
	echo "'".$d['DATA']."',";
	
foreach ($data as $d)
	echo $d['TOTAL'].",";
	
	*/
class Report
	{
		private $startYear;
		private $startMonth;
		private $startDay;
		private $endYear;
		private $endMonth;
		private $endDay;
		
		private $period = array();
		
		/**
		 * @return the $startYear
		 */
		public function getStartYear() {
			return $this->startYear;
		}
	
			/**
		 * @return the $startMonth
		 */
		public function getStartMonth() {
			return $this->startMonth;
		}
	
			/**
		 * @return the $startDay
		 */
		public function getStartDay() {
			return $this->startDay;
		}
	
			/**
		 * @return the $endYear
		 */
		public function getEndYear() {
			return $this->endYear;
		}
	
			/**
		 * @return the $endMonth
		 */
		public function getEndMonth() {
			return $this->endMonth;
		}
	
			/**
		 * @return the $endDay
		 */
		public function getEndDay() {
			return $this->endDay;
		}
	
			/**
		 * @return the $period
		 */
		public function getPeriod() {
			return $this->period;
		}
	
			/**
		 * @param $startYear the $startYear to set
		 */
		public function setStartYear($startYear) {
			$this->startYear = $startYear;
		}
	
			/**
		 * @param $startMonth the $startMonth to set
		 */
		public function setStartMonth($startMonth) {
			$this->startMonth = $startMonth;
		}
	
			/**
		 * @param $startDay the $startDay to set
		 */
		public function setStartDay($startDay) {
			$this->startDay = $startDay;
		}
	
			/**
		 * @param $endYear the $endYear to set
		 */
		public function setEndYear($endYear) {
			$this->endYear = $endYear;
		}
	
			/**
		 * @param $endMonth the $endMonth to set
		 */
		public function setEndMonth($endMonth) {
			$this->endMonth = $endMonth;
		}
	
			/**
		 * @param $endDay the $endDay to set
		 */
		public function setEndDay($endDay) {
			$this->endDay = $endDay;
		}
	
			/**
		 * @param $period the $period to set
		 */
		public function setPeriod($period) {
			$this->period = $period;
		}
		
		public function getVisitsPerPeriod()
			{
				$visit = new Visit();
				$data = $visit->listVisitsPerDay();
				
				$this->getPeriodDateArray();
				
				foreach ($this->period as $index => $p)
					{
						if (isset($data[$index]))
							$this->period[$index] = $data[$index];
					}
			}
			
		public function getCadastrosPerPeriod()
			{
				$user = new User();
				$data = $user->listCadastrosPerDay();
				
				$this->getPeriodDateArray();
				
				foreach ($this->period as $index => $p)
					{
						if (isset($data[$index]))
							$this->period[$index] = $data[$index];
					}
			}
			
		public function getCandidatosProcSelPerPeriod()
			{
				$procSel = new CandidatoProcessoSeletivo();
				$data = $procSel->listCandidatosProcSelPerDay();
				
				$this->getPeriodDateArray();
				
				foreach ($this->period as $index => $p)
					{
						if (isset($data[$index]))
							$this->period[$index] = $data[$index];
					}
			}

		public function getPeriodDateArray() {
			$first = 1;
			$last = getLastDayOfMonth($this->startMonth, $this->startYear);
			
			if ($this->startMonth < 10)
				$this->startMonth = "0".$this->startMonth;
			
			for ($i = $first; $i <= $last; $i++)
				{
					if ($i < 10)
						$day = "0".$i;
					else
						$day = $i;
					
					$this->period[$this->startYear."-".$this->startMonth."-".$day] = 0;
				}
				
			
		}
	}
	
$report = new Report();
$report->setStartMonth(6);
$report->setStartYear(2010);
$report->getVisitsPerPeriod();
$data = $report->getPeriod();

echo implode(",", $data)."<br />";

foreach ($data as $index => $d)
	{
		echo "'".substr($index, 8, 2)."',";
	}
	
echo "<br />";
	
$report = new Report();
$report->setStartMonth(6);
$report->setStartYear(2010);
$report->getCadastrosPerPeriod();
$data = $report->getPeriod();

echo implode(",", $data)."<br />";

foreach ($data as $index => $d)
	{
		echo "'".substr($index, 8, 2)."',";
	}
	
echo "<br />";
	
$report = new Report();
$report->setStartMonth(6);
$report->setStartYear(2010);
$report->getCandidatosProcSelPerPeriod();
$data = $report->getPeriod();

echo implode(",", $data)."<br />";

foreach ($data as $index => $d)
	{
		echo "'".substr($index, 8, 2)."',";
	}