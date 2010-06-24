<?php

require_once '../lib/vendor/dompdf/dompdf_config.inc.php';

if (isset($_GET['id']) && is_numeric($_GET['id']))
	{
		$procSel = new ProcessoSeletivo();
		$procSel->setCodigo($_GET['id']);
		$data = $procSel->getDataByCodigo();
		
		
		$html = "";
		
		$dompdf = new DOMPDF();
		$dompdf->load_html($html);
		$dompdf->set_paper('letter', 'landscape');
		$dompdf->render();
		$dompdf->stream("relatorio.pdf");
	}