<?php

include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'lib/Teste.class.php';
include_once ROOT.'lib/Notas.class.php';

class FaseTeste extends Transactions
	{
		private $teste;
		private $fase;
		private $nota;
		
		/**
		 * @return the $nota
		 */
		public function getNota() {
			return $this->nota;
		}
	
			/**
		 * @param $nota the $nota to set
		 */
		public function setNota($nota) {
			$this->nota = $nota;
		}
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @param $teste the $teste to set
		 */
		public function setTeste($teste) {
			$this->teste = $teste;
		}
	
		/**
		 * @return the $fase
		 */
		public function getFase() {
			return $this->fase;
		}
	
		/**
		 * @param $fase the $fase to set
		 */
		public function setFase($fase) {
			$this->fase = $fase;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_FASE_TESTES}()
								->fase_cod()
								->teste_cod()
								->nota()
							->number($this->fase->getCodigo())
							->number($this->teste->getCodigo())
							->number($this->nota);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function deleteList($ids)
			{
				$this
					->delete()
					->from()
						->{TBL_FASE_TESTES}()
					->where()
						->fase_cod()->in()->vals($ids);
					 
				return $this->run();				
			} 
			
		public function alter()
			{
				$this
					->update()
						->{TBL_FASE_TESTES}()
					->set()
						->teste_cod()->equ()->number($this->teste->getCodigo())
						->nota()->equ()->number($this->nota->getNota())
					->where()
						->fase_cod()->equ()->number($this->fase->getCodigo());
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function getDataByFase()
			{
				$this
					->select()
						->teste_cod()
						->nota()
					->from()
						->{TBL_FASE_TESTES}()
					->where()
						->fase_cod()->equ()->number($this->fase->getCodigo());
						
				$this->run();
									
				$data = $this->db->fetchRow();
								
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function getTesteByFase()
			{
				$this
					->select()
						->teste_cod()
					->from()
						->{TBL_FASE_TESTES}()
					->where()
						->fase_cod()->equ()->number($this->fase->getCodigo());
						
				$this->run();
																
				$cod = $this->db->fetchField("TESTE_COD");
				
				$this->teste = new Teste();
				$this->teste->setCodigo($cod);
				
				if ($cod !== false)
					return true;
				else
					return false;
			}
			
		public function searchByTeste()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_FASE_TESTES}()
					->where()
						->teste_cod()->equ()->number($this->teste->getCodigo());
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getNotaMinimaByFase()
			{
				$this
					->select()
						->nota()
					->from()
						->{TBL_FASE_TESTES}()
					->where()
						->fase_cod()->equ()->number($this->fase->getCodigo());
						
				$this->run();
				
				$nota = $this->db->fetchField("NOTA");
				
				$this->nota = new Notas();
				$this->nota->setNota($nota);
				
				if ($nota !== false)
					return $nota;
				else
					return false;
			}
		
	}