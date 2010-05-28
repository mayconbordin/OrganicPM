<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class AndamentoCurso extends Transactions
	{
		private $codigo;
		private $status;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
		
		public function listAndamentos()
			{
				$this
					->select()
					->from()
						->{TBL_ANDAMENTO_CURSO}()
					->orderBy()
						->status();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function getStatusByCodigo()
			{
				$this
					->select()
						->status()
					->from()
						->{TBL_ANDAMENTO_CURSO}()
					->where()
						->and_cur_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$status = $this->db->fetchField("STATUS");
								
				if ($status !== false && $status != '')
					$this->status = $status;
				else
					return false;
			}

		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_ANDAMENTO_CURSO}()
					->where()
						->and_cur_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
		
		
		
	}