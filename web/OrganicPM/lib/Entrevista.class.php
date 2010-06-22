<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Entrevista extends Transactions
	{
		private $fase;
	
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
							->{TBL_FASE_ENTREVISTAS}()
								->fase_cod()
							->number($this->fase->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
	}