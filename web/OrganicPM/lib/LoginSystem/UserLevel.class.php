<?php

/**
 * Include Files
 */
include_once ROOT.'lib/Database/Transactions.class.php';

class UserLevel extends Transactions
	{
		private $nivel;
		private $alias;
	
		/**
		 * @return the $nivel
		 */
		public function getNivel() {
			return $this->nivel;
		}
	
			/**
		 * @return the $alias
		 */
		public function getAlias() {
			return $this->alias;
		}
	
			/**
		 * @param $nivel the $nivel to set
		 */
		public function setNivel($nivel) {
			$this->nivel = $nivel;
		}
	
			/**
		 * @param $alias the $alias to set
		 */
		public function setAlias($alias) {
			$this->alias = $alias;
		}
		
		public function searchByLevel()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_NIVEIS_USUARIO}()
					->where()
						->nivel()->equ()->number($this->nivel);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}

		
		public function listNiveis()
			{
				$this
					->select()
					->from()
						->{TBL_NIVEIS_USUARIO}();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
	}