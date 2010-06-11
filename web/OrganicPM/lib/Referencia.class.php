<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Referencia extends Transactions
	{
		private $codigo;
		private $nome;
		private $empresa;
		private $vinculo;
		private $fone;
		private $email;
		
		private $pessoa;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $nome
		 */
		public function getNome() {
			return $this->nome;
		}
	
			/**
		 * @return the $empresa
		 */
		public function getEmpresa() {
			return $this->empresa;
		}
	
			/**
		 * @return the $vinculo
		 */
		public function getVinculo() {
			return $this->vinculo;
		}
	
			/**
		 * @return the $fone
		 */
		public function getFone() {
			return $this->fone;
		}
	
			/**
		 * @return the $email
		 */
		public function getEmail() {
			return $this->email;
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
		 * @param $nome the $nome to set
		 */
		public function setNome($nome) {
			$this->nome = $nome;
		}
	
			/**
		 * @param $empresa the $empresa to set
		 */
		public function setEmpresa($empresa) {
			$this->empresa = $empresa;
		}
	
			/**
		 * @param $vinculo the $vinculo to set
		 */
		public function setVinculo($vinculo) {
			$this->vinculo = $vinculo;
		}
	
			/**
		 * @param $fone the $fone to set
		 */
		public function setFone($fone) {
			$this->fone = $fone;
		}
	
			/**
		 * @param $email the $email to set
		 */
		public function setEmail($email) {
			$this->email = $email;
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
							->{TBL_REFERENCIAS}()
								->pessoa_cod()
								->nome()
								->empresa()
								->vinculo()
								->fone()
								->email()
							->number($this->pessoa->getCodigo())
							->string($this->nome)
							->string($this->empresa)
							->string($this->vinculo)
							->string($this->fone)
							->string($this->email);
							
				$result = $this->run();
																				
				if ($result !== false)
					{
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
						->{TBL_REFERENCIAS}()
					->where()
						->referencia_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
		
		public function getDataByPessoa()
			{
				$this
					->select()
						->r()->referencia_cod()
						->r()->nome()
						->r()->empresa()
						->r()->vinculo()
						->r()->fone()
						->r()->email()
					->from()
						->{TBL_REFERENCIAS}('r')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->p()->pessoa_cod()->equ()->r()->pessoa_cod();
						
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
						->nome()
						->empresa()
						->vinculo()
						->fone()
						->email()
					->from()
						->{TBL_REFERENCIAS}()
					->where()
						->referencia_cod()->equ()->number($this->codigo);
						
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
						->{TBL_REFERENCIAS}()
					->set()
						->nome()->equ()->string($this->nome)
						->empresa()->equ()->string($this->empresa)
						->vinculo()->equ()->string($this->vinculo)
						->fone()->equ()->string($this->fone)
						->email()->equ()->string($this->email)
					->where()
						->referencia_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
																				
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listReferenciaByPage($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT referencia_cod, nome, empresa, vinculo, fone, email,".
							" row_number() OVER (ORDER BY referencia_cod) rn".
							" FROM ".TBL_REFERENCIAS.
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