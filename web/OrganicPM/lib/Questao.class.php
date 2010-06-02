<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Questao extends Transactions
	{
		private $teste;
		private $tipoQuestao;
		
		private $codigo;
		private $descricao;
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @return the $tipoQuestao
		 */
		public function getTipoQuestao() {
			return $this->tipoQuestao;
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
		 * @param $tipoQuestao the $tipoQuestao to set
		 */
		public function setTipoQuestao($tipoQuestao) {
			$this->tipoQuestao = $tipoQuestao;
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
							->{TBL_QUESTOES}()
								->teste_cod()
								->descricao()
								->tip_que_cod()
							->number($this->teste->getCodigo())
							->string($this->descricao)
							->number($this->tipoQuestao->getCodigo());
							
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
				$seq = "questao_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
	}