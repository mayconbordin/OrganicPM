<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Setor extends Transactions
	{
		private $codigo;
		private $setor;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $setor
		 */
		public function getSetor() {
			return $this->setor;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $setor the $setor to set
		 */
		public function setSetor($setor) {
			$this->setor = $setor;
		}
		
		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_EXPERIENCIAS_SETOR}()
								->setor()
							->string($this->setor);
									
				$result = $this->run();
												
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function getSetorByCodigo()
			{
				$this
					->select()
						->setor()
					->from()
						->{TBL_EXPERIENCIAS_SETOR}()
					->where()
						->exp_set_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$setor = $this->db->fetchField("SETOR");
								
				if ($setor !== false && $setor != '')
					$this->setor = $setor;
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_EXPERIENCIAS_SETOR}()
					->where()
						->exp_set_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getInsertedCodigo()
			{
				$seq = "experiencia_setor_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
		
		public function listSetores()
			{
				$this
					->select()
					->from()
						->{TBL_EXPERIENCIAS_SETOR}()
					->orderBy()
						->setor();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}

		
		
	}