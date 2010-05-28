<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class IdiomaCandidato extends Transactions
	{
		private $idioma;
		private $pessoa;
		
		private $leitura;
		private $escrita;
		private $conversacao;
	
		/**
		 * @return the $idioma
		 */
		public function getIdioma() {
			return $this->idioma;
		}
	
			/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @return the $leitura
		 */
		public function getLeitura() {
			return $this->leitura;
		}
	
			/**
		 * @return the $escrita
		 */
		public function getEscrita() {
			return $this->escrita;
		}
	
			/**
		 * @return the $conversacao
		 */
		public function getConversacao() {
			return $this->conversacao;
		}
	
			/**
		 * @param $idioma the $idioma to set
		 */
		public function setIdioma($idioma) {
			$this->idioma = $idioma;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	
			/**
		 * @param $leitura the $leitura to set
		 */
		public function setLeitura($leitura) {
			$this->leitura = $leitura;
		}
	
			/**
		 * @param $escrita the $escrita to set
		 */
		public function setEscrita($escrita) {
			$this->escrita = $escrita;
		}
	
			/**
		 * @param $conversacao the $conversacao to set
		 */
		public function setConversacao($conversacao) {
			$this->conversacao = $conversacao;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_IDIOMAS_CANDIDATOS}()
								->pessoa_cod()
								->idioma_cod()
								->leitura()
								->conversacao()
								->escrita()
							->number($this->pessoa->getCodigo())
							->number($this->idioma->getCodigo())
							->string($this->leitura)
							->string($this->conversacao)
							->string($this->escrita);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function getDataByPessoa()
			{
				$this
					->select()
						->ic()->idioma_cod()
						->ic()->leitura()
						->ic()->conversacao()
						->ic()->escrita()
						->i()->idioma()
					->from()
						->{TBL_IDIOMAS}('i')
						->{TBL_IDIOMAS_CANDIDATOS}('ic')
						->{TBL_PESSOAS}('p')
					->where()
						->ic()->idioma_cod()->equ()->i()->idioma_cod()
					->and()
						->p()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->p()->pessoa_cod()->equ()->ic()->pessoa_cod();
						
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
						->{TBL_IDIOMAS_CANDIDATOS}()
					->set()
						->leitura()->equ()->string($this->leitura)
						->conversacao()->equ()->string($this->conversacao)
						->escrita()->equ()->string($this->escrita)
					->where()
						->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->idioma_cod()->equ()->number($this->idioma->getCodigo());
	
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
	}