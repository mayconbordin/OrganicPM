<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Triagem extends Transactions
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
							->{TBL_FASE_TRIAGENS}()
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
			
		public function deleteList($ids)
			{
				$this
					->delete()
					->from()
						->{TBL_FASE_TRIAGENS}()
					->where()
						->fase_cod()->in()->vals($ids);
					 
				return $this->run();				
			} 

		
	}