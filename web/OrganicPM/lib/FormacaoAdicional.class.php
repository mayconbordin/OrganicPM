<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class FormacaoAdicional extends Transactions
	{
		private $codigo;
		private $tipo;
		private $nome;
		private $dataInicio;
		private $dataFim;
		private $cargaHoraria;
		
		private $pessoa;
		private $instituicao;
	
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $tipo
		 */
		public function getTipo() {
			return $this->tipo;
		}
	
			/**
		 * @return the $nome
		 */
		public function getNome() {
			return $this->nome;
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
		 * @return the $cargaHoraria
		 */
		public function getCargaHoraria() {
			return $this->cargaHoraria;
		}
	
			/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @return the $instituicao
		 */
		public function getInstituicao() {
			return $this->instituicao;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $tipo the $tipo to set
		 */
		public function setTipo($tipo) {
			$this->tipo = $tipo;
		}
	
			/**
		 * @param $nome the $nome to set
		 */
		public function setNome($nome) {
			$this->nome = $nome;
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
		 * @param $cargaHoraria the $cargaHoraria to set
		 */
		public function setCargaHoraria($cargaHoraria) {
			$this->cargaHoraria = $cargaHoraria;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	
			/**
		 * @param $instituicao the $instituicao to set
		 */
		public function setInstituicao($instituicao) {
			$this->instituicao = $instituicao;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FORMACOES_ADICIONAIS}()
								->pessoa_cod()
								->ins_ens_cod()
								->tipo()
								->nome()
								->data_inicio()
								->data_fim()
								->carga_horaria()
							->number($this->pessoa->getCodigo())
							->number($this->instituicao->getCodigo())
							->string($this->tipo)
							->string($this->nome)
							->string($this->dataInicio)
							->string($this->dataFim)
							->string($this->cargaHoraria);
							
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
				$seq = "formacao_adicional_cod_seq.currval";
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
						->f()->for_adi_cod()
						->f()->ins_ens_cod()
						->f()->tipo()
						->f()->nome()
						->{"to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(f.data_fim, 'DD/MM/YYYY') as data_fim"}()
						->f()->carga_horaria()
						->i()->{"nome as instituicao"}()
					->from()
						->{TBL_FORMACOES_ADICIONAIS}('f')
						->{TBL_INSTITUICOES_ENSINO}('i')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->f()->pessoa_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->f()->ins_ens_cod()->equ()->i()->ins_ens_cod();
						
				$this->run();
									
				$data = $this->db->fetchAll();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->ins_ens_cod()
						->tipo()
						->nome()
						->{"to_char(data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(data_fim, 'DD/MM/YYYY') as data_fim"}()
						->carga_horaria()
					->from()
						->{TBL_FORMACOES_ADICIONAIS}()
					->where()
						->for_adi_cod()->equ()->number($this->codigo);
						
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
						->{TBL_FORMACOES_ADICIONAIS}()
					->set()
						->ins_ens_cod()->equ()->number($this->instituicao->getCodigo())
						->tipo()->equ()->string($this->tipo)
						->nome()->equ()->string($this->nome)
						->data_inicio()->equ()->string($this->dataInicio)
						->data_fim()->equ()->string($this->dataFim)
						->carga_horaria()->equ()->string($this->cargaHoraria)
					->where()
						->for_adi_cod()->equ()->number($this->codigo);

				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listFormAdicByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT f.for_adi_cod, i.nome as instituicao, f.tipo, f.nome,".
							" to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio,".
							" to_char(f.data_fim, 'DD/MM/YYYY') as data_fim, f.carga_horaria,".
							" row_number() OVER (ORDER BY f.for_adi_cod) rn".
							" FROM ".TBL_FORMACOES_ADICIONAIS." f, ".
							TBL_INSTITUICOES_ENSINO." i".
							" WHERE f.pessoa_cod = ".$this->pessoa->getCodigo().
							" AND f.ins_ens_cod = i.ins_ens_cod)"}()
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
						->{TBL_EXPERIENCIAS}();
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
		
	}