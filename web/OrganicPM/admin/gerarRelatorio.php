<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Cargo.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/TesteCandidato.class.php';
include_once '../lib/EntrevistaCandidato.class.php';
include_once '../lib/TriagemCandidato.class.php';


require_once '../lib/vendor/dompdf/dompdf_config.inc.php';

global $session;

if ($session->loggedIn && $session->isAdmin())
	{
		if (isset($_GET['id']) && is_numeric($_GET['id']))
			{
				$procSel = new ProcessoSeletivo();
				$procSel->setCodigo($_GET['id']);
				$data = $procSel->getDataByCodigo();
				
				$cargo = new Cargo();
				$cargo->setCodigo($data['CARGO_COD']);
				$dataCargo = $cargo->getDataByCodigo();
				
				$fases = new Fases();
				$fases->setProcessoSeletivo($procSel);
				$dataFases = $fases->listFasesFullByProcSel();
				
				$html = '
					<table border="1" width="100%">
						<!-- MSTableType="layout" -->
						<tr>
							<td width="50%">
							<p align="center"><b>Processo Seletivo</b></p></td>
							<td width="50%">
							<p align="center"><b>Cargo</b></p></td>
						</tr>
					</table>
					<table border="1" width="100%">
						<tr>
							<td width="20%">CÓDIGO:</td>
							<td width="30%">'.$procSel->getCodigo().'</td>
							<td width="20%">CÓDIGO:</td>
							<td>'.$dataCargo['CARGO_COD'].'</td>
						</tr>
						<tr>
							<td width="20%">DESCRIÇÃO:</td>
							<td width="30%">'.$data['DESCRICAO'].'</td>
							<td width="20%">DESCRIÇÃO:</td>
							<td>'.$dataCargo['DESCRICAO'].'</td>
						</tr>
						<tr>
							<td width="20%">DATA DE INÍCIO:</td>
							<td width="30%">'.$data['DATA_INICIO'].'</td>
							<td width="20%">DEPARTAMENTO:</td>
							<td>'.$dataCargo['DEPARTAMENTO'].'</td>
						</tr>
						<tr>
							<td width="20%">DATA DE FIM:</td>
							<td width="30%">'.$data['DATA_FIM'].'</td>
							<td width="20%">SALÁRIO MÍNIMO:</td>
							<td>R$ '.$dataCargo['SALARIO_MINIMO'].'</td>
						</tr>
						<tr>
							<td width="20%">INCRIÇÕES ATÉ:</td>
							<td width="30%">'.$data['INSCRICOES_ATE'].'</td>
							<td width="20%">SALÁRIO MÉDIO:</td>
							<td>R$ '.$dataCargo['SALARIO_MEDIO'].'</td>
						</tr>
						<tr>
							<td width="20%">VAGAS:</td>
							<td width="30%">'.$data['VAGAS'].'</td>
							<td width="20%">SALÁRIO MÁXIMO:</td>
							<td>R$ '.$dataCargo['SALARIO_MAXIMO'].'</td>
						</tr>
						<tr>
							<td width="20%">STATUS:</td>
							<td width="30%">'.$data['STATUS'].'</td>
							<td width="20%">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					<p>&nbsp;</p>
					<p>&nbsp;</p>';
				
				foreach ($dataFases as $fase)
					{
						$html .= '
							<table border="1" width="100%">
								<tr>
									<td>
									<p align="center"><b>FASE '.$fase['ORDEM'].'</b></p></td>
								</tr>
							</table>
							<table border="1" width="100%">
								<tr>
									<td width="15%">CÓDIGO:</td>
									<td align="center">'.$fase['FASE_COD'].'</td>
								</tr>
								<tr>
									<td width="15%">TIPO:</td>
									<td align="center">'.$fase['FASE'].'</td>
								</tr>
								<tr>
									<td width="15%">DATA DE INÍCIO:</td>
									<td align="center">'.$fase['DATA_INICIO'].'</td>
								</tr>
								<tr>
									<td width="15%">DATA DE FIM:</td>
									<td align="center">'.$fase['DATA_FIM'].'</td>
								</tr>
								<tr>
									<td width="15%">STATUS:</td>
									<td align="center">'.$fase['STATUS'].'</td>
								</tr>
							</table>';
						
						$faseObj = new Fases();
						$faseObj->setCodigo($fase['FASE_COD']);
						
						//Listagem dos candidatos concorrendo a fase
						if ($fase['TIP_FAS_COD'] == 1) //Teste
							{
								$candTeste = new TesteCandidato();
								$candTeste->setFase($faseObj);
								$candidatos = $candTeste->listTestesByFase();
							}
						elseif ($fase['TIP_FAS_COD'] == 2) //Triagem
							{
								$candTriag = new TriagemCandidato();
								$candTriag->setFase($faseObj);
								$candidatos = $candTriag->listTriagensByFase();
							}
						elseif ($fase['TIP_FAS_COD'] == 3) //Entrevista
							{
								$candEntrev = new EntrevistaCandidato();
								$candEntrev->setFase($faseObj);
								$candidatos = $candEntrev->listEntrevistasByFase();
							}
							
						$html .= '
							<table border="1" width="100%">
								<tr>
									<td>
									<p align="center"><b>CANDIDATOS CONCORRENDO</b></p></td>
								</tr>
							</table>
							<table border="1" width="100%">
								<tr>
									<td width="10%">
									<p align="center"><b>CÓDIGO</b></p></td>
									<td>
									<p align="center"><b>NOME</b></p></td>
									<td width="10%">
									<p align="center"><b>STATUS</b></p></td>
								</tr>';
							
						foreach ($candidatos as $candidato)
							{
								$html .= '
										<tr>
											<td width="10%">'.$candidato['PESSOA_COD'].'</td>
											<td>'.$candidato['NOME'].'</td>
											<td>'.$candidato['STATUS'].'</td>
										</tr>';
							}
							
						$html .= '</table>';
					}

				//Gera o PDF
				$dompdf = new DOMPDF();
				$dompdf->load_html($html);
				$dompdf->set_paper('letter', 'landscape');
				$dompdf->render();
				$dompdf->stream("relatorio.pdf");
			}
	}
else
	header("location: /OrganicPM/admin/");