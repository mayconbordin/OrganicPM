<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Instituicao extends Transactions
	{
		private $codigo;
		private $nome;
	
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

		
		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_INSTITUICOES_ENSINO}()
								->nome()
							->string($this->nome);
							
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
				$seq = "instituicao_cod_seq.currval";
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
						->count()->as()->num()
					->from()
						->{TBL_INSTITUICOES_ENSINO}()
					->where()
						->ins_ens_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getNomeByCodigo()
			{
				$this
					->select()
						->nome()
					->from()
						->{TBL_INSTITUICOES_ENSINO}()
					->where()
						->ins_ens_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$nome = $this->db->fetchField("NOME");
								
				if ($nome !== false && $nome != '')
					$this->nome = $nome;
				else
					return false;
			}
		
		public function listInstituicoes()
			{
				$this
					->select()
					->from()
						->{TBL_INSTITUICOES_ENSINO}()
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