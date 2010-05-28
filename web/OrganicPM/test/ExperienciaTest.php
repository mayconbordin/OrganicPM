<?php

include_once '../config/config.inc.php';
include_once '../lib/Experiencia.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Setor.class.php';

class ExperienciaTest {
	
	private $exper;
	private $pessoa;
	private $setor;
	
	function __construct(){
		$this->exper = new Experiencia();
		$this->pessoa = new Pessoa();
		$this->setor = new Setor();
	}
	
	function getDataByPessoa(){
		$this->pessoa->setCodigo(11);
		
		$this->exper->setPessoa($this->pessoa);
		$data = $this->exper->getDataByPessoa();
		
		print_r($data);
		
		echo "<br /><br />".$this->exper->sql->getSql();
	}
	
	function alter(){
	
		$this->setor->setCodigo(3);
		
		$this->exper->setEmpresa("ILG Studio");
		$this->exper->setAtribuicoes("Dono");
		$this->exper->setCodigo(3);
		$this->exper->setDataFim('10/10/2009');
		$this->exper->setDataInicio('10/10/2009');
		$this->exper->setFuncao('Dono');
		$this->exper->setSetor($this->setor);
		
		$this->exper->alter();
		
	}
}

$test= new ExperienciaTest();
$test->alter();