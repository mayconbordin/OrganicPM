<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TipoQuestao extends Transactions
	{
		private $codigo;
		private $tipo;
		
		private $tipoGabarito;
	
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
		 * @return the $tipoGabarito
		 */
		public function getTipoGabarito() {
			return $this->tipoGabarito;
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
	
			/**
		 * @param $tipoGabarito the $tipoGabarito to set
		 */
		public function setTipoGabarito($tipoGabarito) {
			$this->tipoGabarito = $tipoGabarito;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TIPOS_QUESTOES}()
								->tipo()
								->tip_gab_cod()
							->string($this->tipo)
							->number($this->tipoGabarito->getCodigo());
							
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
				$seq = "tipo_questao_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function getTipoGabaritoByCodigo()
			{
				$this
					->select()
						->tip_gab_cod()
					->from()
						->{TBL_TIPOS_QUESTOES}()
					->where()
						->tip_que_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$codigo = $this->db->fetchField("TIP_GAB_COD");
				
				$this->tipoGabarito = new TipoGabarito();
				$this->tipoGabarito->setCodigo($codigo);
				
				if ($codigo !== false)
					return false;
				else
					return false;
			}
			
		public function listTiposQuestao()
			{
				$this
					->select()
						->tip_que_cod()
						->tipo()
					->from()
						->{TBL_TIPOS_QUESTOES}()
					->orderBy()
						->tipo();
						
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
						->{TBL_TIPOS_QUESTOES}()
					->where()
						->tip_que_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
		
	}