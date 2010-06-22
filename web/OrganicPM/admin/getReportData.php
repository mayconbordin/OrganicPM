<?php

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Report.class.php';

$types = array("full");

if (isset($_GET['type']))
	{
		if (in_array($_GET['type'], $types))
			$type = $_GET['type'];
	}
else
	$type = "full";
	
if (isset($_GET['inicio']))
	$inicio = $_GET['inicio'];
else
	die("Preencha os dados da data.");
	
if (isset($_GET['fim']))
	$fim = $_GET['fim'];
else
	die("Preencha os dados da data.");
	
$dataInicial = explode("/", $inicio);
$dataFinal = explode("/", $fim);
	
	
$report = new Report();
$report->setStartDay($dataInicial[0]);
$report->setStartMonth($dataInicial[1]);
$report->setStartYear($dataInicial[2]);
$report->setEndDay($dataFinal[0]);
$report->setEndMonth($dataFinal[1]);
$report->setEndYear($dataFinal[2]);

$report->generateReport();

$visitas = implode(",",$report->getVisitas());
$cadastros = implode(",", $report->getCadastros());
$incricoes = implode(",", $report->getCandProcSel());
$periodo = implode(",", $report->getDays());
						
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . "GMT");
header("Cache-Control: no-cache, must-revalidate");
header("Pragma: no-cache");
header("Content-type: text/x-json");

echo json_encode(array("visitas" => $visitas, "cadastros" => $cadastros, "inscricoes" => $incricoes, "periodo" => $periodo));