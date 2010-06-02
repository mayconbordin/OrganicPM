<?php

include_once '../config/config.inc.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoGabarito.class.php';

class TipoQuestaoTest {
	
	private $tipoQuestao;
	private $tipoGabarito;
	
	function __construct(){
		$this->tipoQuestao = new TipoQuestao();
		$this->tipoGabarito = new TipoGabarito();
	}
	
	function record(){
		$this->tipoGabarito->setCodigo(1);
		
		$this->tipoQuestao->setTipo("�nica Escolha");
		$this->tipoQuestao->setTipoGabarito($this->tipoGabarito);
		$this->tipoQuestao->record();
		
		echo "Tipo de quest�o inserido com o c�digo ".$this->tipoQuestao->getCodigo();
	}

}

$test = new TipoQuestaoTest();
$test->record();