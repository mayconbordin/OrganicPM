<?php

/**
 * Include files
 */
include_once ROOT.'lib/vendor/Browser Detection/BrowserDetection.class.php';
include_once ROOT.'lib/Database/Transactions.class.php';

/**
 * OperationalSystem.class.php
 * 
 * Class to deal with operational systems.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class OperationalSystem extends Transactions
	{
		private $id;
		private $name;
		
		function __construct()
			{
				$browser 		= new BrowserDetection();
				$this->name		= $browser->getPlatform();
			}
			
		public function getID()
			{
				$this->id = $this->search();
				
				if (!$this->id)
					{
						$this->id = $this->add();
					}
					
				return $this->id;
			}
			
		public function add()
			{
				$this
					->insert()
						->into()
							->{TBL_OPERATIONAL_SYSTEMS}()
						->values("null", $this->name, 0);
	      			 
	      		$this->run();
	      		
	      		return $this->db->getID();
			}
			
		public function search()
			{
				$this
					->select()
						->sis_ope_cod()
					->from()
						->{TBL_OPERATIONAL_SYSTEMS}()
					->where()
						->nome()->equ()->val($this->name);
	   				
				$this->run();
				
				if (!$this->db->hasResults())
	      			return false;
	      		else
	      			return $this->db->fetchField("sis_ope_cod");
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_OPERATIONAL_SYSTEMS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->nome()->equ()->val($this->name);
	   					 
	   			return $this->run();
			}
	}