<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Keyword extends Transactions
	{
		private $keyword;
		private $processoSeletivo;
	
		/**
		 * @return the $keyword
		 */
		public function getKeyword() {
			return $this->keyword;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
			/**
		 * @param $keyword the $keyword to set
		 */
		public function setKeyword($keyword) {
			$this->keyword = $keyword;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_PALAVRAS_CHAVE}()
								->palavra_chave()
							->string($this->keyword);
									
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function relateProcessoSeletivo()
			{
				$this
					->insert()
						->into()
							->{TBL_PROC_SELE_PALA_CHAV}()
								->pro_sel_cod()
								->palavra_chave()
							->number($this->processoSeletivo->getCodigo())
							->string($this->keyword);
									
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function listKeywordsByProcSel()
			{
				$this
					->select()
						->palavra_chave()
					->from()
						->{TBL_PROC_SELE_PALA_CHAV}()
					->where()
						->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo());
						
				$this->run();
								
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function searchByPalavraChave()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_PALAVRAS_CHAVE}()
					->where()
						->palavra_chave()->equ()->string($this->keyword);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
	}