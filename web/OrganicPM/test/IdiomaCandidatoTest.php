<?php

include_once '../config/config.inc.php';
include_once '../lib/IdiomaCandidato.class.php';
include_once '../lib/Pessoa.class.php';

class IdiomaCandidatoTest {
	
	private $idiomaCand;
	
	function __construct(){
		$this->idiomaCand = new IdiomaCandidato();
		$this->pessoa = new Pessoa();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(10);
		
		$this->idiomaCand->setPessoa($this->pessoa);
		$data = $this->idiomaCand->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->idiomaCand->sql->getSql();
	}
}

$test= new IdiomaCandidatoTest();
$test->getDataByPessoa();