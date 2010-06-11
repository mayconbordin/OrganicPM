<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Notas extends Transactions
	{
		private $nota;
	
		/**
		 * @return the $nota
		 */
		public function getNota() {
			return $this->nota;
		}
	
		/**
		 * @param $nota the $nota to set
		 */
		public function setNota($nota) {
			$this->nota = $nota;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_NOTAS}()
								->nota()
							->number($this->nota);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function searchByNota()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_NOTAS}()
					->where()
						->nota()->equ()->number($this->nota);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
								
			}
			
		public function listNotas()
			{
				$this
					->select()
					->from()
						->{TBL_NOTAS}();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
		
	}