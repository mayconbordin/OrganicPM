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
								->nome()
								->contador()
							->string($this->name)
							->number(0);
	      			 
	      		$this->run();
	      		
	      		$this->getInsertedCodigo();
	      		
	      		return $this->id;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "sistema_operacional_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->id = $this->db->fetchField("CURRVAL");
			}
			
		public function search()
			{
				$this
					->select()
						->sis_ope_cod()
					->from()
						->{TBL_OPERATIONAL_SYSTEMS}()
					->where()
						->nome()->equ()->string($this->name);
	   				
				$this->run();
				
				$cod = $this->db->fetchField("SIS_OPE_COD");
				
				if ($cod === false)
	      			return false;
	      		else
	      			return $cod;
			}
			
		public function updateCount()
			{
				$this
					->update()
						->{TBL_OPERATIONAL_SYSTEMS}()
					->set()
						->contador()->equ()->eq('contador + 1')
					->where()
						->nome()->equ()->string($this->name);
	   					 
	   			return $this->run();
			}
	}