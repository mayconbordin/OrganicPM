<?php

include_once '../config/config.inc.php';
include_once '../lib/FormacaoAdicional.class.php';
include_once '../lib/Pessoa.class.php';

class FormacaoAdicionalTest {
	
	private $formAdic;
	
	function __construct(){
		$this->formAdic = new FormacaoAdicional();
		$this->pessoa = new Pessoa();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(10);
		
		$this->formAdic->setPessoa($this->pessoa);
		$data = $this->formAdic->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->formAdic->sql->getSql();
	}
}

$test= new FormacaoAdicionalTest();
$test->getDataByPessoa();