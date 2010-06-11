<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Experiencia extends Transactions
	{
		private $codigo;
		private $empresa;
		private $funcao;
		private $atribuicoes;
		private $dataInicio;
		private $dataFim;
		
		private $setor;
		private $pessoa;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $empresa
		 */
		public function getEmpresa() {
			return $this->empresa;
		}
	
			/**
		 * @return the $funcao
		 */
		public function getFuncao() {
			return $this->funcao;
		}
	
			/**
		 * @return the $atribuicoes
		 */
		public function getAtribuicoes() {
			return $this->atribuicoes;
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
		 * @return the $setor
		 */
		public function getSetor() {
			return $this->setor;
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
		 * @param $empresa the $empresa to set
		 */
		public function setEmpresa($empresa) {
			$this->empresa = $empresa;
		}
	
			/**
		 * @param $funcao the $funcao to set
		 */
		public function setFuncao($funcao) {
			$this->funcao = $funcao;
		}
	
			/**
		 * @param $atribuicoes the $atribuicoes to set
		 */
		public function setAtribuicoes($atribuicoes) {
			$this->atribuicoes = $atribuicoes;
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
		 * @param $setor the $setor to set
		 */
		public function setSetor($setor) {
			$this->setor = $setor;
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
							->{TBL_EXPERIENCIAS}()
								->pessoa_cod()
								->empresa()
								->funcao()
								->atribuicoes()
								->data_inicio()
								->data_fim()
								->exp_set_cod()
							->number($this->pessoa->getCodigo())
							->string($this->empresa)
							->string($this->funcao)
							->string($this->atribuicoes)
							->string($this->dataInicio)
							->string($this->dataFim)
							->number($this->setor->getCodigo());
									
				$result = $this->run();
												
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_EXPERIENCIAS}()
					->where()
						->experiencia_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getInsertedCodigo()
			{
				$seq = "experiencia_cod_seq.currval";
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
						->e()->experiencia_cod()
						->e()->empresa()
						->e()->funcao()
						->e()->atribuicoes()
						->{"to_char(e.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(e.data_fim, 'DD/MM/YYYY') as data_fim"}()
						->e()->exp_set_cod()
						->s()->setor()
					->from()
						->{TBL_EXPERIENCIAS}('e')
						->{TBL_EXPERIENCIAS_SETOR}('s')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->e()->pessoa_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->e()->exp_set_cod()->equ()->s()->exp_set_cod();
						
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
						->empresa()
						->funcao()
						->atribuicoes()
						->{"to_char(data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(data_fim, 'DD/MM/YYYY') as data_fim"}()
						->exp_set_cod()
					->from()
						->{TBL_EXPERIENCIAS}()
					->where()
						->experiencia_cod()->equ()->number($this->codigo);
						
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
						->{TBL_EXPERIENCIAS}()
					->set()
						->empresa()->equ()->string($this->empresa)
						->funcao()->equ()->string($this->funcao)
						->atribuicoes()->equ()->string($this->atribuicoes)
						->data_inicio()->equ()->string($this->dataInicio)
						->data_fim()->equ()->string($this->dataFim)
						->exp_set_cod()->equ()->number($this->setor->getCodigo())
					->where()
						->experiencia_cod()->equ()->number($this->codigo);
									
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listExperienciaByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT e.experiencia_cod, e.empresa, e.funcao, e.atribuicoes,".
							" to_char(e.data_inicio, 'DD/MM/YYYY') as data_inicio,".
							" to_char(e.data_fim, 'DD/MM/YYYY') as data_fim, s.setor,".
							" row_number() OVER (ORDER BY e.experiencia_cod) rn".
							" FROM ".TBL_EXPERIENCIAS." e, ".
							TBL_EXPERIENCIAS_SETOR." s".
							" WHERE e.pessoa_cod = ".$this->pessoa->getCodigo().
							" AND e.exp_set_cod = s.exp_set_cod)"}()
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
			
		public function remove()
			{
				$this
					->delete()
						->from()
							->{TBL_EXPERIENCIAS}()
						->where()
							->experiencia_cod()->equ()->number($this->codigo);
							
				$result = $this->run();
																
				if ($result !== false)
					return $result;
				else
					return false;		
			}
	}