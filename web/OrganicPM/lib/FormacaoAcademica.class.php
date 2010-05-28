<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class FormacaoAcademica extends Transactions
	{
		private $codigo;
		private $dataInicio;
		private $dataFim;
		
		private $curso;
		private $instituicao;
		private $nivel;
		private $andamento;
		private $pessoa;
		
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
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
		 * @return the $curso
		 */
		public function getCurso() {
			return $this->curso;
		}
	
			/**
		 * @return the $instituicao
		 */
		public function getInstituicao() {
			return $this->instituicao;
		}
	
			/**
		 * @return the $nivel
		 */
		public function getNivel() {
			return $this->nivel;
		}
	
			/**
		 * @return the $andamento
		 */
		public function getAndamento() {
			return $this->andamento;
		}
	
			/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
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
		 * @param $curso the $curso to set
		 */
		public function setCurso($curso) {
			$this->curso = $curso;
		}
	
			/**
		 * @param $instituicao the $instituicao to set
		 */
		public function setInstituicao($instituicao) {
			$this->instituicao = $instituicao;
		}
	
			/**
		 * @param $nivel the $nivel to set
		 */
		public function setNivel($nivel) {
			$this->nivel = $nivel;
		}
	
			/**
		 * @param $andamento the $andamento to set
		 */
		public function setAndamento($andamento) {
			$this->andamento = $andamento;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FORMACOES_ACADEMICAS}()
								->pessoa_cod()
								->cur_for_cod()
								->data_inicio()
								->data_fim()
								->ins_ens_cod()
								->niv_for_cod()
								->and_cur_cod()
							->number($this->pessoa->getCodigo())
							->number($this->curso->getCodigo())
							->string($this->dataInicio)
							->string($this->dataFim)
							->number($this->instituicao->getCodigo())
							->number($this->nivel->getCodigo())
							->number($this->andamento->getCodigo());
							
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
				$seq = "formacao_academica_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
		
		public function getDataByPessoa()
			{				
				$this
					->select()
						->f()->for_aca_cod()
						->f()->cur_for_cod()
						->f()->data_inicio()
						->f()->data_fim()
						->f()->ins_ens_cod()
						->f()->niv_for_cod()
						->f()->and_cur_cod()
						->{"c.nome as curso"}()
						->i()->nome()
						->n()->nivel()
						->a()->status()
					->from()
						->{TBL_FORMACOES_ACADEMICAS}('f')
						->{TBL_CURSOS_FORMACOES}('c')
						->{TBL_INSTITUICOES_ENSINO}('i')
						->{TBL_ANDAMENTO_CURSO}('a')
						->{TBL_NIVEIS_FORMACOES}('n')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->f()->pessoa_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->f()->niv_for_cod()->equ()->n()->niv_for_cod()
					->and()
						->f()->and_cur_cod()->equ()->a()->and_cur_cod()
					->and()
						->f()->ins_ens_cod()->equ()->i()->ins_ens_cod()
					->and()
						->f()->cur_for_cod()->equ()->c()->cur_for_cod();
						
				$this->run();
									
				$data = $this->db->fetchAll();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function alter()
			{
				$this
					->update()
						->{TBL_FORMACOES_ACADEMICAS}()
					->set()
						->cur_for_cod()->equ()->number($this->curso->getCodigo())
						->data_inicio()->equ()->string($this->dataInicio)
						->data_fim()->equ()->string($this->dataFim)
						->ins_ens_cod()->equ()->number($this->instituicao->getCodigo())
						->niv_for_cod()->equ()->number($this->nivel->getCodigo())
						->and_cur_cod()->equ()->number($this->andamento->getCodigo())
					->where()
						->for_aca_cod()->equ()->number($this->codigo);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}

	}