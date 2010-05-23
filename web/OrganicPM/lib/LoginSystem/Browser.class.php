<?php

/**
 * Include files
 */
include_once ROOT.'lib/vendor/Browser Detection/BrowserDetection.class.php';
include_once ROOT.'lib/Database/Transactions.class.php';

/**
 * Browser.class.php
 * 
 * Class to deal with browsers and versions.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class Browser extends Transactions
	{
		private $name;
		private $version;
		private $id;
		private $versionID;
		
		function __construct()
			{
				$browser 		= new BrowserDetection();
				$this->name 	= $browser->getBrowser();
				$this->version 	=  substr($browser->getVersion(), 0, 3);
			}
			
		public function getVersionID()
			{
				//Search for the browser id
				$this->versionID = $this->searchVersion();
				
				//If exist, return the id
				if ($this->versionID)
					return $this->versionID;
				//If version doesn't exist
				else
					{
						//Look if the browser is registered
						$this->id = $this->search();
						
						//If it is
						if($this->id)
							{
								$this->versionID = $this->addVersion();
							}
						//If doesn't exist
						else
							{
								$this->id = $this->add();
								$this->versionID = $this->addVersion();
							}
					}
					
				return $this->versionID;
			}
			
		private function search()
			{
				$this
					->select()
						->browser_cod()
					->from()
						->{TBL_BROWSERS}()
					->nome()->equ()->val($this->name);
	   				
				$this->run();
	
	      		if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField("browser_cod");
			}
			
		private function searchVersion()
			{
				$this
					->select()
						->ver_bro_cod()
					->from()
						->{TBL_BROWSER_VERSIONS}()
					->where()
						->versao()->equ()->val($this->version);
	   				
				$this->run();
				
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField("ver_bro_cod");
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_BROWSERS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->nome()->equ()->val($this->name);
	   					 
	   			$this->run();
			}
			
		public function updateVersionCount()
			{
				$this
					->update()
						->{TBL_BROWSER_VERSIONS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->versao()->equ()->val($this->version);
	   					 
	   			$this->run();
			}
		
		private function add()
			{
				$this
					->insert()
						->into()
							->{TBL_BROWSERS}()
						->values("null", $this->name, 0);
	      			 
	      		$this->run();
	      		
	      		return $this->db->getID();
			}
			
		private function addVersion()
			{
				$this
					->insert()
						->into()
							->{TBL_BROWSER_VERSIONS}()
						->values("null", $this->version, 0, $this->id);
	      			 
	      		$this->run();
	      		
	      		return $this->db->getID();
			}
	}