<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TipoTeste extends Transactions
	{
		private $codigo;
		private $tipo;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $tipo
		 */
		public function getTipo() {
			return $this->tipo;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $tipo the $tipo to set
		 */
		public function setTipo($tipo) {
			$this->tipo = $tipo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TIPOS_TESTES}()
								->tipo()
							->string($this->tipo);
							
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
				$seq = "tipo_teste_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
		public function listTiposTeste()
			{
				$this
					->select()
					->from()
						->{TBL_TIPOS_TESTES}()
					->orderBy()
						->tipo();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listTiposTesteNumIndex()
			{
				$this
					->select()
					->from()
						->{TBL_TIPOS_TESTES}()
					->orderBy()
						->tipo();
						
				$this->run();
				
				$list = $this->db->fetchAll("num");
				
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
						->{TBL_TIPOS_TESTES}()
					->where()
						->tip_tes_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
	}