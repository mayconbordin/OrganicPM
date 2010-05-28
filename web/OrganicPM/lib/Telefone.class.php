<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Telefone extends Transactions
	{
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
   		
		private $codigo;
		private $numero;
		private $area;
		
		private $tipo;
		private $pessoa;
		
		//==================================================================
   		// Accessors =======================================================
   		//==================================================================
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $numero
		 */
		public function getNumero() {
			return $this->numero;
		}
	
			/**
		 * @return the $area
		 */
		public function getArea() {
			return $this->area;
		}
	
			/**
		 * @return the $tipo
		 */
		public function getTipo() {
			return $this->tipo;
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
		 * @param $numero the $numero to set
		 */
		public function setNumero($numero) {
			$this->numero = $numero;
		}
	
			/**
		 * @param $area the $area to set
		 */
		public function setArea($area) {
			$this->area = $area;
		}
	
			/**
		 * @param $tipo the $tipo to set
		 */
		public function setTipo($tipo) {
			$this->tipo = $tipo;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}

		//==================================================================
   		// Methods =========================================================
   		//==================================================================
   		
		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_TELEFONES}()
								->pessoa_cod()
								->numero()
								->area()
								->tip_tel_tipo()
							->number($this->pessoa->getCodigo())
							->string($this->numero)
							->string($this->area)
							->string($this->tipo->getTipo());
							
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
				$seq = "telefone_cod_seq.currval";
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
						->t()->telefone_cod()
						->t()->numero()
						->t()->area()
						->t()->tip_tel_tipo()
					->from()
						->{TBL_TELEFONES}('t')
						->{TBL_PESSOAS}('p')
					->where()
						->p()->pessoa_cod()->equ()->t()->pessoa_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo());
						
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
						->{TBL_TELEFONES}()
					->set()
						->numero()->equ()->string($this->numero)
						->area()->equ()->string($this->area)
						->tip_tel_tipo()->equ()->string($this->tipo->getTipo())
					->where()
						->telefone_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}

	}