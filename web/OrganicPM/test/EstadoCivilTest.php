<?php

include_once '../config/config.inc.php';
include_once '../lib/EstadoCivil.class.php';

class EstadoCivilTest {
	
	private $estadoCivil;
	
	function __construct() {
		$this->estadoCivil = new EstadoCivil();
	}
	
	public function searchByCodigoTest()
		{
			$this->estadoCivil->setCodigo(2);
			
			if ($this->estadoCivil->searchByCodigo())
				echo "Existe";
			else
				echo "Não existe";
		}
}

$test = new EstadoCivilTest();

$test->searchByCodigoTest();