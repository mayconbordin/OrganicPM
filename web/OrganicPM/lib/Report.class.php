<?php 

include_once ROOT.'config/config.inc.php';
include_once ROOT.'lib/LoginSystem/Visit.class.php';
include_once ROOT.'lib/LoginSystem/User.class.php';
include_once ROOT.'lib/CandidatoProcessoSeletivo.class.php';

include_once ROOT.'plugins/getLastDayOfMonth.function.php';
include_once ROOT.'plugins/getDateInterval.function.php';

/**
 * Relatório de comparação
 * Retorna as datas e frequências em determinado período de tempo
 * Também retorna arrays com os intervalos de datas por anos, meses, e dias
 * 
 * Cria o array de período com a data completa no seguinte formato: YYYY-MM-DD
 * Depois cruza com os dados de visitas, cadastros, etc.
 * 
 * @author _Opeth_
 *
 */
class Report
	{
		private $startYear;
		private $startMonth;
		private $startDay;
		private $endYear;
		private $endMonth;
		private $endDay;
		
		private $visitas = array();
		private $cadastros = array();
		private $candProcSel = array();
		
		/**
		 * Pode ser: days, months, years
		 * @var string
		 */
		private $format;
		
		private $period = array();
		
		private $days = array();
		private $months = array();
		private $years = array();
		
		
		
		/**
		 * @return the $format
		 */
		public function getFormat() {
			return $this->format;
		}
	
			/**
		 * @param $format the $format to set
		 */
		public function setFormat($format) {
			$this->format = $format;
		}
		
		/**
		 * @return the $period
		 */
		public function getPeriod() {
			return $this->period;
		}
	
			/**
		 * @param $period the $period to set
		 */
		public function setPeriod($period) {
			$this->period = $period;
		}
		
		/**
		 * @return the $days
		 */
		public function getDays() {
			return $this->days;
		}
	
			/**
		 * @return the $months
		 */
		public function getMonths() {
			return $this->months;
		}
	
			/**
		 * @return the $years
		 */
		public function getYears() {
			return $this->years;
		}
	
			/**
		 * @param $days the $days to set
		 */
		public function setDays($days) {
			$this->days = $days;
		}
	
			/**
		 * @param $months the $months to set
		 */
		public function setMonths($months) {
			$this->months = $months;
		}
	
			/**
		 * @param $years the $years to set
		 */
		public function setYears($years) {
			$this->years = $years;
		}
			
		
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
		 * @return the $visitas
		 */
		public function getVisitas() {
			return $this->visitas;
		}
	
			/**
		 * @return the $cadastros
		 */
		public function getCadastros() {
			return $this->cadastros;
		}
	
			/**
		 * @return the $candProcSel
		 */
		public function getCandProcSel() {
			return $this->candProcSel;
		}
	
			/**
		 * @param $visitas the $visitas to set
		 */
		public function setVisitas($visitas) {
			$this->visitas = $visitas;
		}
	
			/**
		 * @param $cadastros the $cadastros to set
		 */
		public function setCadastros($cadastros) {
			$this->cadastros = $cadastros;
		}
	
		/**
		 * @param $candProcSel the $candProcSel to set
		 */
		public function setCandProcSel($candProcSel) {
			$this->candProcSel = $candProcSel;
		}
	
		public function generateReport()
			{
				$this->getPeriodArray();
				
				$this->getVisitsPerPeriod();
				$this->getCadastrosPerPeriod();
				$this->getCandidatosProcSelPerPeriod();
			}
		
		public function getVisitsPerPeriod()
			{
				$visit = new Visit();
				
				if ($this->format == "days")
					$data = $visit->listVisitsPerDay();
				elseif ($this->format == "months")
					$data = $visit->listVisitsPerMonth();
				
				foreach ($this->visitas as $index => $date)
					{
						if (isset($data[$index]))
							$this->visitas[$index] = $data[$index];
					}					
			}
			
		public function getCadastrosPerPeriod()
			{
				$user = new User();
				
				if ($this->format == "days")
					$data = $user->listCadastrosPerDay();
				elseif ($this->format == "months")
					$data = $user->listCadastrosPerMonth();
					
				foreach ($this->cadastros as $index => $date)
					{
						if (isset($data[$index]))
							$this->cadastros[$index] = $data[$index];
					}
			}
			
		public function getCandidatosProcSelPerPeriod()
			{
				$procSel = new CandidatoProcessoSeletivo();
				
				if ($this->format == "days")
					$data = $procSel->listCandidatosProcSelPerDay();
				elseif ($this->format == "months")
					$data = $procSel->listCandidatosProcSelPerMonth();

				foreach ($this->candProcSel as $index => $date)
					{
						if (isset($data[$index]))
							$this->candProcSel[$index] = $data[$index];
					}
			}

		public function getPeriodArray()
			{
				$array = getDateInterval($this->startYear, $this->startMonth, $this->startDay, $this->endYear, $this->endMonth, $this->endDay);
				
				foreach ($array as $date)
					{
						if ($this->format == "days")
							{
								if ($date['MONTH'] < 10)
									$month = "0".$date['MONTH'];
								else
									$month = $date['MONTH'];
									
								if ($date['DAY'] < 10)
									$day = "0".$date['DAY'];
								else
									$day = $date['DAY'];
									
								$this->visitas[$date['YEAR']."-".$month."-".$day] = 0;
								$this->candProcSel[$date['YEAR']."-".$month."-".$day] = 0;
								$this->cadastros[$date['YEAR']."-".$month."-".$day] = 0;
								
								$this->period[] = $date['YEAR']."-".$month."-".$day;
								
								$this->years[] = $date['YEAR'];
								$this->months[] = $date['MONTH'];
								$this->days[] = $date['DAY'];
							}
						elseif ($this->format == "months")
							{
								if ($date['MONTH'] < 10)
									$month = "0".$date['MONTH'];
								else
									$month = $date['MONTH'];
									
								$this->visitas[$date['YEAR']."-".$month] = 0;
								$this->candProcSel[$date['YEAR']."-".$month] = 0;
								$this->cadastros[$date['YEAR']."-".$month] = 0;
								
								$this->period[] = $date['YEAR']."-".$month;
								
								$this->years[] = $date['YEAR'];
								$this->months[] = $date['MONTH'];
							}
					}
					
				$this->months = array_unique($this->months);
				$this->years = array_unique($this->years);
			
			}
	}