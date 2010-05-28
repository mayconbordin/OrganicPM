<?php

include_once '../config/config.inc.php';
include_once '../lib/Referencia.class.php';
include_once '../lib/Pessoa.class.php';

class ReferenciaTest {
	
	private $refer;
	
	function __construct(){
		$this->refer = new Referencia();
		$this->pessoa = new Pessoa();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(10);
		
		$this->refer->setPessoa($this->pessoa);
		$data = $this->refer->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->refer->sql->getSql();
	}
}

$test= new ReferenciaTest();
$test->getDataByPessoa();