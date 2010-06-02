<?php

include_once '../config/config.inc.php';
include_once '../lib/TipoGabarito.class.php';

class TipoGabaritoTest {
	
	private $tipoGabarito;
	
	function __construct() {
		$this->tipoGabarito = new TipoGabarito();
	}
	
	function record(){
		$this->tipoGabarito->setDescricao("Notas de 0 a 5");
		$this->tipoGabarito->record();
		
		echo "Tipo de gabarito inserido com o código ".$this->tipoGabarito->getCodigo();
	}
}

$test = new TipoGabaritoTest();
$test->record();