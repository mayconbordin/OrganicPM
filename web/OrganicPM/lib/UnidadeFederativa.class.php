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
				$seq = "unidade_federativa_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->numUF()
					->from()
						->{TBL_UNIDADES_FEDERATIVAS}()
					->where()
						->uni_fed_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$numUF = $this->db->fetchField("NUMUF");
								
				if ($numUF !== false && $numUF > 0)
					return true;
				else
					return false;
								
			}
			
		public function listUnidadesFederativas()
			{
				$this
					->select()
					->from()
						->{TBL_UNIDADES_FEDERATIVAS}()
					->orderBy()
						->nome();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
	}