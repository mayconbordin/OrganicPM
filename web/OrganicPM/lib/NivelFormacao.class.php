<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class NivelFormacao extends Transactions
	{
		private $codigo;
		private $nivel;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $nivel
		 */
		public function getNivel() {
			return $this->nivel;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $nivel the $nivel to set
		 */
		public function setNivel($nivel) {
			$this->nivel = $nivel;
		}

		public function listNiveis()
			{
				$this
					->select()
					->from()
						->{TBL_NIVEIS_FORMACOES}()
					->orderBy()
						->nivel();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function getNivelByCodigo()
			{
				$this
					->select()
						->nivel()
					->from()
						->{TBL_NIVEIS_FORMACOES}()
					->where()
						->niv_for_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$nivel = $this->db->fetchField("NIVEL");
								
				if ($nivel !== false && $nivel != '')
					$this->nivel = $nivel;
				else
					return false;
			}
				
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_NIVEIS_FORMACOES}()
					->where()
						->niv_for_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;				
			}
		
		
		
	}