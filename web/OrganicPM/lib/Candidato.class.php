<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Candidato extends Transactions
	{
		private $pessoa;
	
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
		
		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_CANDIDATOS}()
								->pessoa_cod()
							->number($this->pessoa->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}

		
		

	}