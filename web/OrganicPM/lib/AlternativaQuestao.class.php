<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class AlternativaQuestao extends Transactions
	{
		private $teste;
		private $questao;
		private $valorGabarito;
		
		private $codigo;
		private $descricao;
	
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @return the $questao
		 */
		public function getQuestao() {
			return $this->questao;
		}
	
			/**
		 * @return the $valorGabarito
		 */
		public function getValorGabarito() {
			return $this->valorGabarito;
		}
	
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
		 * @param $teste the $teste to set
		 */
		public function setTeste($teste) {
			$this->teste = $teste;
		}
	
			/**
		 * @param $questao the $questao to set
		 */
		public function setQuestao($questao) {
			$this->questao = $questao;
		}
	
			/**
		 * @param $valorGabarito the $valorGabarito to set
		 */
		public function setValorGabarito($valorGabarito) {
			$this->valorGabarito = $valorGabarito;
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
							->{TBL_ALTERNATIVAS_QUESTOES}()
								->teste_cod()
								->questao_cod()
								->descricao()
								->val_gab_cod()
							->number($this->teste->getCodigo())
							->number($this->questao->getCodigo())
							->string($this->descricao)
							->number($this->valorGabarito->getCodigo());
							
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
				$seq = "alternativa_questao_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
		public function listAlternativasByQuestao()
			{
				$this
					->select()
						->a()->alt_que_cod()
						->a()->descricao()
						->v()->valor()
						->v()->val_gab_cod()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}("a")
						->{TBL_VALORES_GABARITO}("v")
					->where()
						->a()->questao_cod()->equ()->number($this->questao->getCodigo())
					->and()
						->a()->val_gab_cod()->equ()->v()->val_gab_cod();
						
				$this->run();
																
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listAlternativasCorretasByQuestao()
			{
				$this
					->select()
						->alt_que_cod()
						->count()->as()->total()
					->from()
						->{TBL_ALTERNATIVAS_QUESTOES}()
					->where()
						->questao_cod()->equ()->number($this->questao->getCodigo())
					->and()
						->val_gab_cod()->equ()->number($this->valorGabarito->getCodigo())
					->groupBy()
						->alt_que_cod();
						
				$this->run();
																
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
	}