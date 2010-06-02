<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class CandidatoProcessoSeletivo extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
	
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

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_CANDIDATOS_PROCESSOS_SELETI}()
								->pessoa_cod()
								->pro_sel_cod()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
		
	}