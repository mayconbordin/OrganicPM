<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class EntrevistaCandidato extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $fase;
		
		private $data;
		private $comentario;
		private $entrevistador;
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
		 * @return the $data
		 */
		public function getData() {
			return $this->data;
		}
	
			/**
		 * @return the $comentario
		 */
		public function getComentario() {
			return $this->comentario;
		}
	
			/**
		 * @return the $entrevistador
		 */
		public function getEntrevistador() {
			return $this->entrevistador;
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
		 * @param $data the $data to set
		 */
		public function setData($data) {
			$this->data = $data;
		}
	
			/**
		 * @param $comentario the $comentario to set
		 */
		public function setComentario($comentario) {
			$this->comentario = $comentario;
		}
	
			/**
		 * @param $entrevistador the $entrevistador to set
		 */
		public function setEntrevistador($entrevistador) {
			$this->entrevistador = $entrevistador;
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
							->{TBL_ENTREVISTAS_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->fase_cod()
								->data()
								->comentario()
								->entrevistador()
								->status()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->fase->getCodigo())
							->string($this->data)
							->string($this->comentario)
							->string($this->entrevistador)
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