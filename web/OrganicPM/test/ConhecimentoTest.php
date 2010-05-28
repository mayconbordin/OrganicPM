<?php

include_once '../config/config.inc.php';
include_once '../lib/Conhecimento.class.php';
include_once '../lib/Pessoa.class.php';

class ConhecimentoTest {
	
	private $conhec;
	
	function __construct(){
		$this->conhec = new Conhecimento();
		$this->pessoa = new Pessoa();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(10);
		
		$this->conhec->setPessoa($this->pessoa);
		$data = $this->conhec->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->conhec->sql->getSql();
	}
}

$test= new ConhecimentoTest();
$test->getDataByPessoa();