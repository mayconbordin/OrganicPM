<?php

include_once '../config/config.inc.php';
include_once '../lib/Teste.class.php';

$teste = new Teste();
$lista = $teste->listTestes();

$html = '<option value="">Escolha um teste</option>'."\n";

foreach ($lista as $test)
	{
		$html .= '<option value="'.$test['TESTE_COD'].'">'.$test['DESCRICAO'].'</option>'."\n";
	}
	
echo $html;