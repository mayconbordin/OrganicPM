<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class ValorGabarito extends Transactions
	{
		private $codigo;
		private $valor;
		
		private $tipoGabarito;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $valor
		 */
		public function getValor() {
			return $this->valor;
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
		 * @param $valor the $valor to set
		 */
		public function setValor($valor) {
			$this->valor = $valor;
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
							->{TBL_VALORES_GABARITO}()
								->valor()
								->tip_gab_cod()
							->string($this->valor)
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
				$seq = "valor_gabarito_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listValorGabaritoByTipoGabarito()
			{
				$this
					->select()
						->val_gab_cod()
						->valor()
					->from()
						->{TBL_VALORES_GABARITO}()
					->where()
						->tip_gab_cod()->equ()->number($this->tipoGabarito->getCodigo())
					->orderBy()
						->valor();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
		
	}