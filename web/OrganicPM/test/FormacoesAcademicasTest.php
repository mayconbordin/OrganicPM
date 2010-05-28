<?php

include_once '../config/config.inc.php';
include_once '../lib/FormacaoAcademica.class.php';
include_once '../lib/Pessoa.class.php';

class FormacoesAcademicasTest {
	
	private $formAcad;
	
	function __construct(){
		$this->formAcad = new FormacaoAcademica();
		$this->pessoa = new Pessoa();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(11);
		
		$this->formAcad->setPessoa($this->pessoa);
		$data = $this->formAcad->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->formAcad->sql->getSql();
	}
}

$test= new FormacoesAcademicasTest();
$test->getDataByPessoa();