<?php

include_once '../config/config.inc.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/ValorGabarito.class.php';
include_once '../lib/TipoGabarito.class.php';

if (isset($_GET['cod']) && is_numeric($_GET['cod']))
	{
		$tipoQuestao = new TipoQuestao();
		$tipoQuestao->setCodigo($_GET['cod']);
		$tipoQuestao->getTipoGabaritoByCodigo();
		$tipoGab = $tipoQuestao->getTipoGabarito();
		
		$valGab = new ValorGabarito();
		$valGab->setTipoGabarito($tipoGab);
		$valores = $valGab->listValorGabaritoByTipoGabarito();
		
		$html = '<option value="">Escolha uma resposta</option>'."\n";
		
		foreach ($valores as $valor)
			{
				$html .= '<option value="'.$valor['VAL_GAB_COD'].'">'.$valor['VALOR'].'</option>'."\n";
			}
			
		echo $html;
	}
else
	echo "Erro";