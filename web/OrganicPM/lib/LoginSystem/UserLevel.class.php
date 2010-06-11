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