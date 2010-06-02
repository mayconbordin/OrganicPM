<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TriagemCandidato extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $fase;
		
		private $status;
	
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
		 * @return the $fase
		 */
		public function getFase() {
			return $this->fase;
		}
	
			/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
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
		 * @param $fase the $fase to set
		 */
		public function setFase($fase) {
			$this->fase = $fase;
		}
	
			/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
	
		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TRIAGENS_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->fase_cod()
								->status()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->fase->getCodigo())
							->string($this->status);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
		
	}