<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Conhecimento extends Transactions
	{
		private $grupo;
		private $conhecimento;
		private $proficiencia;
		private $codigo;
		private $pessoa;
		
		

		/**
		 * @return the $grupo
		 */
		public function getGrupo() {
			return $this->grupo;
		}
	
			/**
		 * @return the $conhecimento
		 */
		public function getConhecimento() {
			return $this->conhecimento;
		}
	
			/**
		 * @return the $proficiencia
		 */
		public function getProficiencia() {
			return $this->proficiencia;
		}
	
			/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $grupo the $grupo to set
		 */
		public function setGrupo($grupo) {
			$this->grupo = $grupo;
		}
	
			/**
		 * @param $conhecimento the $conhecimento to set
		 */
		public function setConhecimento($conhecimento) {
			$this->conhecimento = $conhecimento;
		}
	
			/**
		 * @param $proficiencia the $proficiencia to set
		 */
		public function setProficiencia($proficiencia) {
			$this->proficiencia = $proficiencia;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
		
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
		/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_CONHECIMENTOS}()
								->pessoa_cod()
								->grupo()
								->descricao()
								->proficiencia()
							->number($this->pessoa->getCodigo())
							->string($this->grupo)
							->string($this->conhecimento)
							->string($this->proficiencia);
							
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
				$seq = "conhecimento_cod_seq.currval";
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
						->c()->conhecimento_cod()
						->c()->grupo()
						->c()->descricao()
						->c()->proficiencia()
					->from()
						->{TBL_CONHECIMENTOS}('c')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->c()->pessoa_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo());
						
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
						->grupo()
						->descricao()
						->proficiencia()
					->from()
						->{TBL_CONHECIMENTOS}()
					->where()
						->conhecimento_cod()->equ()->number($this->codigo);
						
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
						->{TBL_CONHECIMENTOS}()
					->set()
						->grupo()->equ()->string($this->grupo)
						->descricao()->equ()->string($this->conhecimento)
						->proficiencia()->equ()->string($this->proficiencia)
					->where()
						->conhecimento_cod()->equ()->number($this->codigo);
							
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listConhecimentoByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT conhecimento_cod, grupo, descricao, proficiencia,".
							" row_number() OVER (ORDER BY conhecimento_cod) rn".
							" FROM ".TBL_CONHECIMENTOS.
							" WHERE pessoa_cod = ".$this->pessoa->getCodigo().")"}()
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