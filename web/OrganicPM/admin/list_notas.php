<?php

include_once '../config/config.inc.php';
include_once '../lib/Notas.class.php';

$nota = new Notas();
$lista = $nota->listNotas();

$html = '<option value="">Escolha uma nota</option>'."\n";

foreach ($lista as $nota)
	{
		$html .= '<option value="'.$nota['NOTA'].'">'.$nota['NOTA'].'</option>'."\n";
	}
	
echo $html;