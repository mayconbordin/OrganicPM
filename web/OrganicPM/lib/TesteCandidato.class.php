<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class TesteCandidato extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $fase;
		private $nota;
		
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

		/**
		 * @return the $nota
		 */
		public function getNota() {
			return $this->nota;
		}
	
			/**
		 * @param $nota the $nota to set
		 */
		public function setNota($nota) {
			$this->nota = $nota;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TESTES_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->fase_cod()
								->status()
								->nota()
								->data()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->fase->getCodigo())
							->string($this->status)
							->number($this->nota->getNota())
							->string(date('d/m/Y'));
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
	}