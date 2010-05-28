<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/LoginSystem/User.class.php';

class PessoaTest {

	private $pessoa;
	private $usuario;
	
	function __construct(){
		$this->pessoa = new Pessoa();
		$this->usuario = new User();
	}
	
	function getCodigoByUsuario(){
		$this->usuario->setUsername("ronaldo");
		
		$this->pessoa->setUsuario($this->usuario);
		$this->pessoa->getCodigoByUsuario();
		
		echo $this->pessoa->getCodigo();
	}
	
	function getDataByUsuario(){
		$this->usuario->setUsername("ronaldo");
		
		$this->pessoa->setUsuario($this->usuario);
		$data = $this->pessoa->getDataByUsuario();
		
		print_r($data);
		
	}
	
}

$test = new PessoaTest();
$test->getDataByUsuario();