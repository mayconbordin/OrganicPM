<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Cargo extends Transactions
	{
		private $codigo;
		private $descricao;
		private $salarioMinimo;
		private $salarioMaximo;
		private $salarioMedio;
		private $departamento;
		private $tipoCargo;
		private $horasTotais;
	
		/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $descricao
		 */
		public function getDescricao() {
			return $this->descricao;
		}
	
			/**
		 * @return the $salarioMinimo
		 */
		public function getSalarioMinimo() {
			return $this->salarioMinimo;
		}
	
			/**
		 * @return the $salarioMaximo
		 */
		public function getSalarioMaximo() {
			return $this->salarioMaximo;
		}
	
			/**
		 * @return the $salarioMedio
		 */
		public function getSalarioMedio() {
			return $this->salarioMedio;
		}
	
			/**
		 * @return the $departamento
		 */
		public function getDepartamento() {
			return $this->departamento;
		}
	
			/**
		 * @return the $tipoCargo
		 */
		public function getTipoCargo() {
			return $this->tipoCargo;
		}
	
			/**
		 * @return the $horasTotais
		 */
		public function getHorasTotais() {
			return $this->horasTotais;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $descricao the $descricao to set
		 */
		public function setDescricao($descricao) {
			$this->descricao = $descricao;
		}
	
			/**
		 * @param $salarioMinimo the $salarioMinimo to set
		 */
		public function setSalarioMinimo($salarioMinimo) {
			$this->salarioMinimo = $salarioMinimo;
		}
	
			/**
		 * @param $salarioMaximo the $salarioMaximo to set
		 */
		public function setSalarioMaximo($salarioMaximo) {
			$this->salarioMaximo = $salarioMaximo;
		}
	
			/**
		 * @param $salarioMedio the $salarioMedio to set
		 */
		public function setSalarioMedio($salarioMedio) {
			$this->salarioMedio = $salarioMedio;
		}
	
			/**
		 * @param $departamento the $departamento to set
		 */
		public function setDepartamento($departamento) {
			$this->departamento = $departamento;
		}
	
			/**
		 * @param $tipoCargo the $tipoCargo to set
		 */
		public function setTipoCargo($tipoCargo) {
			$this->tipoCargo = $tipoCargo;
		}
	
			/**
		 * @param $horasTotais the $horasTotais to set
		 */
		public function setHorasTotais($horasTotais) {
			$this->horasTotais = $horasTotais;
		}
		
		public function listCargos()
			{
				$this
					->select()
						->cargo_cod()
						->descricao()
					->from()
						->{TBL_CARGOS}()
					->orderBy()
						->descricao();
						
				$this->run();
				
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->c()->cargo_cod()
						->c()->descricao()
						->c()->salario_minimo()
						->c()->salario_maximo()
						->c()->salario_medio()
						->{"d.descricao as departamento"}()
					->from()
						->{TBL_CARGOS}("c")
						->{TBL_DEPARTAMENTOS}("d")
					->where()
						->c()->cargo_cod()->equ()->number($this->codigo)
					->and()
						->c()->departamento_cod()->equ()->d()->departamento_cod();
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_CARGOS}()
					->where()
						->cargo_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
		
	}