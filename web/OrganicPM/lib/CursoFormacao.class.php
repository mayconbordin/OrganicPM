<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class CursoFormacao extends Transactions
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
							->{TBL_CURSOS_FORMACOES}()
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
			
		public function getNomeByCodigo()
			{
				$this
					->select()
						->nome()
					->from()
						->{TBL_CURSOS_FORMACOES}()
					->where()
						->cur_for_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$nome = $this->db->fetchField("NOME");
								
				if ($nome !== false && $nome != '')
					$this->nome = $nome;
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_CURSOS_FORMACOES}()
					->where()
						->cur_for_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getInsertedCodigo()
			{
				$seq = "curso_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
		
		public function listCursos()
			{
				$this
					->select()
					->from()
						->{TBL_CURSOS_FORMACOES}()
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