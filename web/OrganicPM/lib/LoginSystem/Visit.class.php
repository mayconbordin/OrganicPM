<?php

/**
 * Include files
 */
include_once ROOT.'lib/LoginSystem/Browser.class.php';
include_once ROOT.'lib/LoginSystem/OperationalSystem.class.php';
include_once ROOT.'lib/LoginSystem/VisitedPage.class.php';
include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'plugins/getIPAddress.function.php';

/**
 * Visit.class.php
 * 
 * Class to record each visit in the website.
 * To use this class just include into the page
 * you wish to track, after you include the session class.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class Visit extends Transactions
	{
		private $id;
		private $browser;
		private $ip;
		private $page;
		private $session;
		private $date;
		private $os;
		
		function __construct()
			{
				global $session;
				$this->session	= $session;
				
				//Browser instance
				$this->browser = new Browser();
				
				//OS instance
				$this->os = new OperationalSystem();
				
				//Visited page instance
				$this->page = new VisitedPage();
				
				$this->ip		= getIPAddress();
				$this->date		= time();
				
				//Record the new visit
				$this->record();
			}
			
		private function record()
			{
				$osID 		= $this->os->getID();
				$pageID 	= $this->page->getID();
				$browserID	= $this->browser->getVersionID();
				
				//If the visit data match
				if($this->search($osID, $browserID))
					$this->addPageview($pageID);
				else
					{
						if ($this->session->loggedIn === true)
							$loggedIn = 1;
						else
							$loggedIn = 0;
						
						//Insert new visit
						$this
							->insert()
								->into()
									->{TBL_VISITS}()
										->ip()
										->data()
										->logado()
										->contador()
										->ver_bro_cod()
										->sis_ope_cod()
									->string($this->ip)
									->number($this->date)
									->number($loggedIn)
									->number(0)
									->number($browserID)
									->number($osID);
							 
						$this->run();
						
						$this->getInsertedCodigo();
						
						//Still add the pageview to record the visited page
						$this->addPageview($pageID);
					}
					
				//Update counters
				$this->browser->updateCount();
				$this->browser->updateVersionCount();
				$this->os->updateCount();
				$this->page->updateCount();
			}
			
		public function getInsertedCodigo()
			{
				$seq = "visita_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->id = $this->db->fetchField("CURRVAL");
			}
			
		public function addPageview($pageID)
			{
				//Insert pageview
				$this
					->insert()
						->into()
							->{TBL_PAGEVIEWS}()
								->data()
								->pag_vis_cod()
								->visita_cod()
							->number($this->date)
							->number($pageID)
							->number($this->id);
	 
	   			$this->run();
	   			
	   			//Update visits count
	   			
	   			if ($this->session->loggedIn === true)
					$loggedIn = 1;
				else
					$loggedIn = 0;
				$this
					->update()
						->{TBL_VISITS}()
					->set()
						->contador()->equ()->eq('contador + 1')
						->logado()->equ()->number($loggedIn)
						->data()->equ()->number($this->date)
					->where()
						->visita_cod()->equ()->number($this->id);
	   					 
	   			return $this->run();
			}
			
		private function search($osID, $browserID)
			{
				$this
					->select()
						->visita_cod()
					->from()
						->{TBL_VISITS}()
					->where()
						->ip()->equ()->string($this->ip)
					->and()
						->eq('('.$this->date.' - data)')->leq()->number(USER_VISIT_INTERVAL)
					->and()
						->sis_ope_cod()->equ()->number($osID)
					->and()
						->ver_bro_cod()->equ()->number($browserID);
	   				
				$this->run();
								
				$this->id = $this->db->fetchField("VISITA_COD");
																	
	      		if ($this->id === false)
	      			return false;
	      		else
	      			return true;
			}
			
		public function getTotalVisits()
			{
				$this
					->select()
						->count()->as()->totalVisits()
					->from()
						->{TBL_VISITS}();

				$this->run();
				
				$count = $this->db->fetchField('TOTALVISITS');
				
				if ($count === false)
	      			return false;
	      		else
	      			return $count;
				
			}
			
		public function getVisitsToday()
			{
				//Verificar a função de timestamp
				
				$this
					->select()
						->count()->as()->totalVisits()
					->from()
						->{TBL_VISITS}()
					->where()
						->from_unixtime('data', "'%Y-%d-%m'")->equ()->val(gmdate("Y-d-m"));

				$this->run();
				
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField('TOTALVISITS');
				
			}
			
		public function getNumOnlineVisitors()
			{
				$this
					->select()
						->count()->as()->numOnlineVisitors()
					->from()
						->{TBL_VISITS}()
					->where()
						->logado()->equ()->number(0)
					->and()
						->eq('('.$this->date.' - data)')->leq()->number(GUEST_TIMEOUT);

				$this->run();
				
				$num = $this->db->fetchField('NUMONLINEVISITORS');
								
				if ($num === false)
	      			return false;
	      		else
	      			return $num;
			}
			
		public function getNumOnlineUsers()
			{
				$this
					->select()
						->count()->as()->numOnlineUsers()
					->from()
						->{TBL_VISITS}()
					->where()
						->logado()->equ()->number(1)
					->and()
						->eq('('.$this->date.' - data)')->leq()->number(USER_TIMEOUT);

				$this->run();
				
				$num = $this->db->fetchField('NUMONLINEUSERS');
												
				if ($num === false)
	      			return false;
	      		else
	      			return $num;
			}
			
		public function listVisitsPerDay()
			{
				$sql = "select to_char(to_date('1970-01-01','YYYY-MM-DD') + numtodsinterval(data,'SECOND'),".
				" 'YYYY-MM-DD') as data, count(*) as total".
				" from rs_visitas".
				" group by to_char(to_date('1970-01-01','YYYY-MM-DD') + numtodsinterval(data,'SECOND'), 'YYYY-MM-DD')";
				
				$this->setSql($sql, "select");

				$this->execute();
				
				$list = $this->db->fetchAll();
				
				$data = array();
				
				foreach ($list as $l)
					{
						$data[$l['DATA']] = $l['TOTAL'];
					}
				
				if ($list !== false)
					return $data;
				else
					return false;
			}
			
		/**
		 * Returns an array with date and number of visits
		 * 
		 * If both start and end dates have been given, then 
		 * returns an array with both dates and number of visits
		 * 
		 * If just the start date have been given then return just 
		 * the number of visits.
		 * 
		 * @param array $startDate
		 * @param array $endDate
		 */	
		public function generateReport($startDate, $endDate)
			{
				
			}
	}

/**
 * Track the visit
 * 
 * @var object
 */
$visit = new Visit();