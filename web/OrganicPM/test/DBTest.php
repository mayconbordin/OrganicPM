<?php

include_once '../config/config.inc.php';
include_once '../lib/Database/Transactions.class.php';


class DBTest extends Transactions
	{
		public function executeQuery()
			{
				
				$this
					->select()
						->from()
							->{TBL_PESSOAS}();
							
				$this->run();
				/*
				echo "Data: ";
				print_r ( $this->db->fetchRow() );
				
				
				if($this->db->hasResults())
					echo "Tem resultados!";
				else
					echo "Não tem resultado!";
				
				//echo "<br />Rows: ".$this->db->getNumRows();
				
				//echo $this->db->getError();
				 * */
				 
				echo $this->db->fetchField('NOME');
				//echo $this->db->getError();
			}
	}

$test = new DBTest();

$test->executeQuery();