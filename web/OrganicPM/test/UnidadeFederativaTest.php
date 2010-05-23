<?php


include_once '../config/config.inc.php';
include_once '../lib/UnidadeFederativa.class.php';


class UnidadeFederativaTest
	{
		private $uf;
		
		public function __construct()
			{
				$this->uf = new UnidadeFederativa();
			}
			
		public function searchByCodigoTest()
			{
				$this->uf->setCodigo(8);
				
				if ($this->uf->searchByCodigo())
					echo "Existe";
				else
					echo "Não existe";
			}
	}
	
$test = new UnidadeFederativaTest();

$test->searchByCodigoTest();