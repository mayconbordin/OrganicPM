<?php

include_once '../config/config.inc.php';
include_once '../lib/TipoTeste.class.php';

class TipoTesteTest
	{
		private $tipoTeste;
		
		function __construct(){
			$this->tipoTeste = new TipoTeste();
		}
		
		function record(){
			$this->tipoTeste->setTipo("Conhecimentos");
			$this->tipoTeste->record();
			
			echo "Tipo inserido com código ".$this->tipoTeste->getCodigo()."<br />";
		}
	}
	
$test = new TipoTesteTest();
$test->record();