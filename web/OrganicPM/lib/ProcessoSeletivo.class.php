<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class ProcessoSeletivo extends Transactions
	{
		private $codigo;
		private $descricao;
		private $dataInicio;
		private $dataFim;
		private $vagas;
		private $cargo;
	
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
		 * @return the $vagas
		 */
		public function getVagas() {
			return $this->vagas;
		}
	
			/**
		 * @return the $cargo
		 */
		public function getCargo() {
			return $this->cargo;
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
		 * @param $vagas the $vagas to set
		 */
		public function setVagas($vagas) {
			$this->vagas = $vagas;
		}
	
			/**
		 * @param $cargo the $cargo to set
		 */
		public function setCargo($cargo) {
			$this->cargo = $cargo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_PROCESSOS_SELETIVOS}()
								->descricao()
								->data_inicio()
								->data_fim()
								->vagas()
								->cargo_cod()
							->string($this->descricao)
							->string($this->dataInicio)
							->string($this->dataFim)
							->number($this->vagas)
							->number($this->cargo->getCodigo());
							
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
				$seq = "processo_seletivo_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function listProcSelByPage()
			{
				$this
					->select()
						->p()->pro_sel_cod()
						->p()->descricao()
						->p()->data_inicio()
						->p()->data_fim()
						->p()->vagas()
						->{"c.descricao as cargo"}()
					->from()
						->{TBL_PROCESSOS_SELETIVOS}('p')
						->{TBL_CARGOS}('c')
					->where()
						->p()->cargo_cod()->equ()->c()->cargo_cod()
					->orderBy()
						->p()->descricao();
						
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
						->{TBL_PROCESSOS_SELETIVOS}();
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
		
	}