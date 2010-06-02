<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TipoFase extends Transactions
	{
		private $codigo;
		private $fase;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $fase
		 */
		public function getFase() {
			return $this->fase;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
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
							->{TBL_TIPOS_FASES}()
								->fase()
							->string($this->fase);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "tip_fas_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listTiposFase()
			{
				$this
					->select()
					->from()
						->{TBL_TIPOS_FASES}()
					->orderBy()
						->fase();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TIPOS_FASES}()
					->where()
						->tip_fas_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
			
		public function getFaseByCodigo()
			{
				$this
					->select()
						->fase()
					->from()
						->{TBL_TIPOS_FASES}()
					->where()
						->tip_fas_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$this->fase = $this->db->fetchField("FASE");
								
				if ($this->fase !== false && $this->fase > 0)
					return true;
				else
					return false;	
			}
		
	}