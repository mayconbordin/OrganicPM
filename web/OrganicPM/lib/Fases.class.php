<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Fases extends Transactions
	{
		private $codigo;
		private $ordem;
		private $dataInicio;
		private $dataFim;
		private $status;
		
		private $processoSeletivo;
		private $tipoFase;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $ordem
		 */
		public function getOrdem() {
			return $this->ordem;
		}
	
			/**
		 * @return the $dataInicio
		 */
		public function getDataInicio() {
			return $this->dataInicio;
		}
	
			/**
		 * @return the $dataFim
		 */
		public function getDataFim() {
			return $this->dataFim;
		}
	
			/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
			/**
		 * @return the $tipoFase
		 */
		public function getTipoFase() {
			return $this->tipoFase;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $ordem the $ordem to set
		 */
		public function setOrdem($ordem) {
			$this->ordem = $ordem;
		}
	
			/**
		 * @param $dataInicio the $dataInicio to set
		 */
		public function setDataInicio($dataInicio) {
			$this->dataInicio = $dataInicio;
		}
	
			/**
		 * @param $dataFim the $dataFim to set
		 */
		public function setDataFim($dataFim) {
			$this->dataFim = $dataFim;
		}
	
			/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
		}
	
			/**
		 * @param $tipoFase the $tipoFase to set
		 */
		public function setTipoFase($tipoFase) {
			$this->tipoFase = $tipoFase;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FASES}()
								->ordem()
								->data_inicio()
								->data_fim()
								->status()
								->pro_sel_cod()
								->tip_fas_cod()
							->number($this->ordem)
							->string($this->dataInicio)
							->string($this->dataFim)
							->string($this->status)
							->number($this->processoSeletivo->getCodigo())
							->number($this->tipoFase->getCodigo());
							
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
				$seq = "fase_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
	}