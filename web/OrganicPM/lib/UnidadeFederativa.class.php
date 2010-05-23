<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class UnidadeFederativa extends Transactions
	{
		
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
		private $codigo;
		private $nome;
		
		
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
		 * @return the $nome
		 */
		public function getNome() {
			return $this->nome;
		}
	
		/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
		/**
		 * @param $nome the $nome to set
		 */
		public function setNome($nome) {
			$this->nome = $nome;
		}
		
		
		//==================================================================
   		// Methods =========================================================
   		//==================================================================

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_UNIDADES_FEDERATIVAS}()
								->nome()
							->values($this->nome);
							
				//Pegar codigo gerado
							
				return $this->run();
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->numUF()
					->from()
						->{TBL_UNIDADES_FEDERATIVAS}()
					->where()
						->uni_fed_cod()->equ()->val($this->codigo);
						
				$this->run();
				
				$numUF = $this->db->fetchField("NUMUF");
								
				if ($numUF !== false && $numUF > 0)
					return true;
				else
					return false;
								
			}
	}