<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Idioma extends Transactions
	{
		private $codigo;
		private $idioma;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $idioma
		 */
		public function getIdioma() {
			return $this->idioma;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $idioma the $idioma to set
		 */
		public function setIdioma($idioma) {
			$this->idioma = $idioma;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_IDIOMAS}()
								->idioma()
							->string($this->idioma);
							
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
				$seq = "idioma_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_IDIOMAS}()
					->where()
						->idioma_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
			
		public function getIdiomaByCodigo()
			{
				$this
					->select()
						->idioma()
					->from()
						->{TBL_IDIOMAS}()
					->where()
						->idioma_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$idioma = $this->db->fetchField("IDIOMA");
								
				if ($idioma !== false && $idioma != '')
					$this->idioma = $idioma;
				else
					return false;
			}
		
		public function listIdiomas()
			{
				$this
					->select()
					->from()
						->{TBL_IDIOMAS}()
					->orderBy()
						->idioma();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
		
	}