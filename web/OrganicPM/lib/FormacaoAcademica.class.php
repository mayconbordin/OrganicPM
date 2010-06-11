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
						->{"to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(f.data_fim, 'DD/MM/YYYY') as data_fim"}()
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
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_FORMACOES_ACADEMICAS}()
					->where()
						->for_aca_cod()->equ()->number($this->codigo);
						
				$this->run();
								
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;
								
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->{"to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(f.data_fim, 'DD/MM/YYYY') as data_fim"}()
						->f()->cur_for_cod()
						->f()->ins_ens_cod()
						->f()->niv_for_cod()
						->f()->and_cur_cod()
					->from()
						->{TBL_FORMACOES_ACADEMICAS}('f')
						->{TBL_CURSOS_FORMACOES}('c')
						->{TBL_INSTITUICOES_ENSINO}('i')
						->{TBL_ANDAMENTO_CURSO}('a')
						->{TBL_NIVEIS_FORMACOES}('n')
					->where()
						->f()->for_aca_cod()->equ()->number($this->codigo)
					->and()
						->f()->niv_for_cod()->equ()->n()->niv_for_cod()
					->and()
						->f()->and_cur_cod()->equ()->a()->and_cur_cod()
					->and()
						->f()->ins_ens_cod()->equ()->i()->ins_ens_cod()
					->and()
						->f()->cur_for_cod()->equ()->c()->cur_for_cod();
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
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
			
		public function listFormAcadByPage($min, $max)
			{								
				$this
					->select()
						->from()
							->{"(SELECT f.for_aca_cod, to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio,".
							" to_char(f.data_fim, 'DD/MM/YYYY') as data_fim, i.nome as instituicao, ".
							"n.nivel, a.status, c.nome,".
							" row_number() OVER (ORDER BY f.for_aca_cod) rn".
							" FROM ".TBL_FORMACOES_ACADEMICAS." f, ".
							TBL_CURSOS_FORMACOES." c, ".TBL_INSTITUICOES_ENSINO." i, ".
							TBL_ANDAMENTO_CURSO." a, ".TBL_NIVEIS_FORMACOES." n".
							" WHERE f.pessoa_cod = ".$this->pessoa->getCodigo().
							" AND f.niv_for_cod = n.niv_for_cod".
							" AND f.and_cur_cod = a.and_cur_cod".
							" AND f.ins_ens_cod = i.ins_ens_cod".
							" AND f.cur_for_cod = c.cur_for_cod)"}()
						->where()
							->rn()->gtr()->number($min)
						->and()
							->rn()->leq()->number($max)
						->orderBy()
							->rn();
						
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
						->{TBL_FORMACOES_ACADEMICAS}();
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
			
		public function remove()
			{
				$this
					->delete()
						->from()
							->{TBL_FORMACOES_ACADEMICAS}()
						->where()
							->for_aca_cod()->equ()->number($this->codigo);
							
				$result = $this->run();
																
				if ($result !== false)
					return $result;
				else
					return false;		
			}

	}