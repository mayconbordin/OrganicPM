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
		
		
	}