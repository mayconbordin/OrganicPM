<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class FaseTeste extends Transactions
	{
		private $teste;
		private $fase;
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @param $teste the $teste to set
		 */
		public function setTeste($teste) {
			$this->teste = $teste;
		}
	
		/**
		 * @return the $fase
		 */
		public function getFase() {
			return $this->fase;
		}
	
		/**
		 * @param $fase the $fase to set
		 */
		public function setFase($fase) {
			$this->fase = $fase;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FASE_TESTES}()
								->fase_cod()
								->teste_cod()
							->number($this->fase->getCodigo())
							->number($this->teste->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
		
	}