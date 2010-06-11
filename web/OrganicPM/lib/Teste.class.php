<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Teste extends Transactions
	{
		private $codigo;
		private $descricao;
		
		private $tipoTeste;
	
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
		 * @return the $tipoTeste
		 */
		public function getTipoTeste() {
			return $this->tipoTeste;
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
	
			/**
		 * @param $tipoTeste the $tipoTeste to set
		 */
		public function setTipoTeste($tipoTeste) {
			$this->tipoTeste = $tipoTeste;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TESTES}()
								->descricao()
								->tip_tes_cod()
							->string($this->descricao)
							->number($this->tipoTeste->getCodigo());
							
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
				$seq = "teste_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listTestes()
			{
				$this
					->select()
						->teste_cod()
						->descricao()
					->from()
						->{TBL_TESTES}()
					->orderBy()
						->descricao();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listTestesByPage($min, $max)
			{								
				$this
					->select()
						->from()
							->{"(SELECT teste_cod, descricao, row_number() OVER (ORDER BY teste_cod) rn FROM rs_testes)"}()
						->where()
							->rn()->gtr()->number($min)
						->and()
							->rn()->leq()->number($max)
						->orderBy()
							->rn();
						
				$this->run();
				
				$list = $this->db->fetchAll("num");
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function count()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TESTES}();
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_TESTES}()
					->where()
						->teste_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
		
	}