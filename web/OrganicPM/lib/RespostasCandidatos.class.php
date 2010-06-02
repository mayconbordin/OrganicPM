<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class RespostasCandidatos extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $teste;
		private $questao;
		private $alternativaQuestao;
		
		private $resposta;
	
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
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
		 * @return the $alternativaQuestao
		 */
		public function getAlternativaQuestao() {
			return $this->alternativaQuestao;
		}
	
			/**
		 * @return the $resposta
		 */
		public function getResposta() {
			return $this->resposta;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
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
		 * @param $alternativaQuestao the $alternativaQuestao to set
		 */
		public function setAlternativaQuestao($alternativaQuestao) {
			$this->alternativaQuestao = $alternativaQuestao;
		}
	
			/**
		 * @param $resposta the $resposta to set
		 */
		public function setResposta($resposta) {
			$this->resposta = $resposta;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_RESPOSTAS_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->teste_cod()
								->questao_cod()
								->alt_que_cod()
								->resposta()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->teste->getCodigo())
							->number($this->questao->getCodigo())
							->number($this->alternativaQuestao->getCodigo())
							->string($this->resposta);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}

		
	}