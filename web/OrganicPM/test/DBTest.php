<?php

include_once '../config/config.inc.php';
include_once '../lib/Database/Transactions.class.php';


class DBTest extends Transactions
	{
		public function executeQuery()
			{
				
				$this
					->update()
						->{TBL_PESSOAS}()
					->set()
						->cpf()->equ()->string('00506703020')
					->where()
						->cpf()->equ()->string('0666666');
							
				$this->run();
				
				echo $this->sql->getSql();

			}
	}

$test = new DBTest();

$test->executeQuery();