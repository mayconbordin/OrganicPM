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
				$this->version 	= substr($browser->getVersion(), 0, 3);
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
					->where()
						->nome()->equ()->string($this->name);
	   				
				$this->run();
				
				$cod = $this->db->fetchField("BROWSER_COD");
	
	      		if ($cod === false)
	      			return false;
	      		else
	      			return $cod;
			}
			
		private function searchVersion()
			{
				$this
					->select()
						->ver_bro_cod()
					->from()
						->{TBL_BROWSER_VERSIONS}()
					->where()
						->versao()->equ()->string($this->version);
	   				
				$this->run();
				
				$cod = $this->db->fetchField("VER_BRO_COD");
				
				if ($cod === false)
	      			return false;
	      		else
	      			return $cod;
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_BROWSERS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->nome()->equ()->string($this->name);
	   					 
	   			return $this->run();
			}
			
		public function updateVersionCount()
			{
				$this
					->update()
						->{TBL_BROWSER_VERSIONS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->versao()->equ()->string($this->version);
	   					 
	   			return $this->run();
			}
		
		private function add()
			{
				$this
					->insert()
						->into()
							->{TBL_BROWSERS}()
								->nome()
								->contador()
							->string($this->name)
							->number(0);
	      			 
	      		$this->run();
	      		
	      		$this->getInsertedBrowserCodigo();
	      		
	      		return $this->id;
			}
			
		public function getInsertedBrowserCodigo()
			{
				$seq = "browser_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->id = $this->db->fetchField("CURRVAL");
			}
			
		public function getInsertedBrowserVersionCodigo()
			{
				$seq = "versao_browser_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->versionID = $this->db->fetchField("CURRVAL");
			}
			
		private function addVersion()
			{
				$this
					->insert()
						->into()
							->{TBL_BROWSER_VERSIONS}()
								->versao()
								->contador()
								->browser_cod()
							->string($this->version)
							->number(0)
							->number($this->id);
	      			 
	      		$this->run();
	      		
	      		$this->getInsertedBrowserVersionCodigo();
	      		
	      		return $this->versionID;
			}
	}