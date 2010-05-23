<?php

/**
 * Include Files
 */
include_once ROOT.'lib/SQL Generator/SQLGenerator.class.php';
include_once ROOT.'lib/Database/DB.class.php';

/**
 * Transactions.class.php
 * 
 * This class aims to make easy the process
 * of run sql scripts to get data.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class Transactions
	{
		
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
		/**
		 * SQL Object
		 * 
		 * @var object
		 */
		public $sql;
		
		/**
		 * Database Object
		 * 
		 * @var object
		 */
		public $db;
	      			
		
		//==================================================================
   		// Methods =========================================================
   		//==================================================================
		
		/**
		 * Run the query
		 */
		public function run()
			{
				//Database Connection
    			global $db;
      			$this->db = $db;
				
				//Constrói a query
				$this->sql->build();
								
				//echo $this->sql->getSql()."<br />";
								
				//Seta no banco a query
				$this->db->setSql($this->sql);
								
				//Executa a query
				return $this->db->run();
			}
		
		/**
   		 * Insert
   		 */
   		public function insert()
   			{
   				$this->sql = new SQL();
   				$this->sql->insert();
   				
   				return $this->sql;
   			}
   			
		/**
   		 * Update
   		 */
   		public function update()
   			{
   				$this->sql = new SQL();
   				$this->sql->update();
   				
   				return $this->sql;
   			}
   			
		/**
   		 * Select
   		 */
   		public function select()
   			{
   				$this->sql = new SQL();
   				$this->sql->select();
   				
   				return $this->sql;
   			}
   			
		/**
   		 * Delete
   		 */
   		public function delete()
   			{
   				$this->sql = new SQL();
   				$this->sql->delete();
   				
   				return $this->sql;
   			}
	}