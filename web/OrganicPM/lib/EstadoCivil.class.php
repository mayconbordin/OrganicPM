<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class EstadoCivil extends Transactions
	{
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
		private $codigo;
		private $descricao;
		
		
		//==================================================================
   		// Accessors =======================================================
   		//==================================================================
   		
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
		
		//==================================================================
   		// Methods =========================================================
   		//==================================================================

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_ESTADOS_CIVIS}()
								->descricao()
							->values($this->descricao);
							
				$result = $this->run();
				
				//setar código
				
				return $result;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->numEstCiv()
					->from()
						->{TBL_ESTADOS_CIVIS}()
					->where()
						->est_civ_cod()->equ()->val($this->codigo);
						
				$this->run();
				
				$numEstCiv = $this->db->fetchField("NUMESTCIV");
								
				if ($numEstCiv !== false && $numEstCiv > 0)
					return true;
				else
					return false;
								
			}

	}