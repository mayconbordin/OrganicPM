<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TipoTelefone extends Transactions
	{
		private $tipo;
		
		/**
		 * @return the $tipo
		 */
		public function getTipo() {
			return $this->tipo;
		}
	
			/**
		 * @param $tipo the $tipo to set
		 */
		public function setTipo($tipo) {
			$this->tipo = $tipo;
		}
		
		public function searchByTipo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TIPO_TELEFONE}()
					->where()
						->tip_tel_tipo()->equ()->string($this->tipo);
						
				$this->run();
								
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
								
			}

		public function listTiposTelefone()
			{
				$this
					->select()
					->from()
						->{TBL_TIPO_TELEFONE}()
					->orderBy()
						->tip_tel_tipo();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
	}