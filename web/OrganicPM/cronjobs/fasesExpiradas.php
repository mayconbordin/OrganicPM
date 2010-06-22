<?php

include_once '../config/config.inc.php';
include_once ROOT.'lib/ProcessoSeletivo.class.php';
include_once ROOT.'lib/Fases.class.php';
include_once ROOT.'lib/TipoFase.class.php';
include_once ROOT.'lib/CandidatoProcessoSeletivo.class.php';
include_once ROOT.'lib/Pessoa.class.php';

class fasesExpiradas
	{
		private $processoSeletivo;
		private $fase;
		
		function __construct()
			{
				$this->processoSeletivo = new ProcessoSeletivo();
				$this->fase = new Fases();
				
				$this->generateArray();
			}
			
		public function generateArray()
			{
				$data = array();
				
				//Lista de processos seletivos ativos
				$data = $this->processoSeletivo->listProcSelAtivos();
				
				foreach ($data as $procSel)
					{
						//Processo seletivo
						$proSelObj = new ProcessoSeletivo();
						$proSelObj->setCodigo($procSel['PRO_SEL_COD']);
						
						//Lista as fases de cada processo seletivo
						
						//Deveria listar apenas as fases que terminaram
						$faseObj = new Fases();
						$faseObj->setProcessoSeletivo($proSelObj);
						$fases = $faseObj->listFasesFinalizadasByProcSel();
						
						print_r($fases);
						
						//Tipo de Fase: código 1 e 3 (teste e entrevista, respectivamente)
						foreach ($fases as $fase)
							{
								$faseObj = new Fases();
								$faseObj->setCodigo($fase['FASE_COD']);
								
								$tipFase = new TipoFase();
								$tipFase->setCodigo($fase['TIP_FAS_COD']);
								
								$faseObj->setTipoFase($tipFase);
								
								//Lista de pessoas cadastradas no processe seletivo
								$candProcSel = new CandidatoProcessoSeletivo();
								$candProcSel->setProcessoSeletivo($proSelObj);
								$candidatos = $candProcSel->listCandidatosAtivosByProcSel();
								
								foreach ($candidatos as $candidato)
									{
										$pessoa = new Pessoa();
										$pessoa->setCodigo($candidato['PESSOA_COD']);
										
										//Teste
										if ($faseObj->getTipoFase()->getCodigo() == 1)
											{
												
											}
										//Entrevista
										elseif ($faseObj->getTipoFase()->getCodigo() == 3)
											{
												
											}
											
									}
							}
						
					}
				
				print_r($data);
			}
	}
	
$fExp = new fasesExpiradas();