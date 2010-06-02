<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TipoGabarito extends Transactions
	{
		private $codigo;
		private $descricao;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $descricao
		 */
		public function getDescricao() {
			return $this->descricao;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $descricao the $descricao to set
		 */
		public function setDescricao($descricao) {
			$this->descricao = $descricao;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TIPOS_GABARITOS}()
								->descricao()
							->string($this->descricao);
							
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
				$seq = "tipo_gabarito_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
	}