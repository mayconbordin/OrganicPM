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
						//Insert new visit
						$this
							->insert()
								->into()
									->{TBL_VISITS}()
								->values("null", $this->ip, $this->date, $this->session->loggedIn, 0, $browserID, $osID);
							 
						$this->run();
						
						$this->id = $this->db->getID();
						
						//Still add the pageview to record the visited page
						$this->addPageview($pageID);
					}
					
				//Update counters
				$this->browser->updateCount();
				$this->browser->updateVersionCount();
				$this->os->updateCount();
				$this->page->updateCount();
			}
			
		public function addPageview($pageID)
			{
				//Insert pageview
				$this
					->insert()
						->into()
							->{TBL_PAGEVIEWS}()
						->values(null, $this->date, $this->id, $pageID);
	 
	   			$this->run();
	   			
	   			//Update visits count
				$this
					->update()
						->{TBL_VISITS}()
					->set()
						->contador()->equ()->eq('contador + 1')
						->logado()->equ()->val($this->session->loggedIn)
						->data()->equ()->val($this->date)
					->where()
						->visita_cod()->equ()->val($this->id);
	   					 
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
						->ip()->equ()->val($this->ip)
					->and()
						->eq('('.$this->date.' - data)')->equ()->val(USER_VISIT_INTERVAL)
					->and()
						->sis_ope_cod()->equ()->val($osID)
					->and()
						->ver_bro_cod()->equ()->val($browserID);
	   				
				$this->run();
													
	      		if (!$this->db->hasResults())
	      			return false;
	      		else
	      			{
	      				$this->id = $this->db->fetchField("visita_cod");
	      				return true;
	      			}
			}
			
		public function getTotalVisits()
			{
				$this
					->select()
						->count()->as()->totalVisits()
					->from()
						->{TBL_VISITS}();

				$this->run();
				
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField('totalVisits');
				
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
				
				//echo $this->sql->getSqlQuery();

				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField('totalVisits');
				
			}
			
		public function getNumOnlineVisitors()
			{
				$this
					->select()
						->count()->as()->numOnlineVisitors()
					->from()
						->{TBL_VISITS}()
					->where()
						->logado()->equ()->val(0)
					->and()
						->eq('('.$this->date.' - data)')->leq()->val(GUEST_TIMEOUT);

				$this->run();
								
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField('numOnlineVisitors');
			}
			
		public function getNumOnlineUsers()
			{
				$this
					->select()
						->count()->as()->numOnlineUsers()
					->from()
						->{TBL_VISITS}()
					->where()
						->logado()->equ()->val(1)
					->and()
						->eq('('.$this->date.' - data)')->leq()->val(USER_TIMEOUT);

				$this->run();
												
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField('numOnlineUsers');
			}
	}

/**
 * Track the visit
 * 
 * @var object
 */
$visit = new Visit();