<?php

include_once ROOT.'lib/ProcessoSeletivo.class.php';
include_once ROOT.'lib/Fases.class.php';
include_once ROOT.'lib/TipoFase.class.php';
include_once ROOT.'lib/CandidatoProcessoSeletivo.class.php';
include_once ROOT.'lib/Pessoa.class.php';
include_once ROOT.'lib/TesteCandidato.class.php';
include_once ROOT.'lib/Notas.class.php';
include_once ROOT.'lib/EntrevistaCandidato.class.php';

class fasesExpiradas
	{
		private $processoSeletivo;
		private $fase;
		
		function __construct()
			{
				$this->processoSeletivo = new ProcessoSeletivo();
				$this->fase = new Fases();
				
				$this->check();
			}
			
		public function check()
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
						$faseObj = new Fases();
						$faseObj->setProcessoSeletivo($proSelObj);
						$fases = $faseObj->listFasesFinalizadasByProcSel();
												
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
										$pessoaObj = new Pessoa();
										$pessoaObj->setCodigo($candidato['PESSOA_COD']);
										
										//Teste
										if ($faseObj->getTipoFase()->getCodigo() == 1)
											{
												$testeCand = new TesteCandidato();
												$testeCand->setPessoa($pessoaObj);
												$testeCand->setFase($faseObj);
												$testeCand->setProcessoSeletivo($proSelObj);
												
												//Verifica se o candidato realizou o teste
												if (!$testeCand->searchByPessoaAndProcSelAndFase())
													{
														//Nota do candidato
														$nota = new Notas();
														$nota->setNota(0);
														
														//Reprova o candidato no teste
														$testeCand->setNota($nota);
														$testeCand->setStatus("Reprovado");
														$testeCand->record();
														
														//Desclassifica do processo seletivo
														$candProcSelObj = new CandidatoProcessoSeletivo();
														$candProcSelObj->setPessoa($pessoaObj);
														$candProcSelObj->setProcessoSeletivo($proSelObj);
														$candProcSelObj->setStatus("Desclassificado");
														$candProcSelObj->updateStatus();
													}
											}
										//Entrevista
										elseif ($faseObj->getTipoFase()->getCodigo() == 3)
											{
												$entrevCand = new EntrevistaCandidato();
												$entrevCand->setPessoa($pessoaObj);
												$entrevCand->setFase($faseObj);
												$entrevCand->setProcessoSeletivo($proSelObj);
												
												//Verifica se a entrevista foi avaliada
												if (!$entrevCand->searchByPessoaAndProcSelAndFase())
													{
														$entrevCand->setStatus("desclassificado");
														$entrevCand->setComentario("Prazo Expirado.");
														$entrevCand->recordProblema();
														
														//Desclassifica do processo seletivo
														$candProcSelObj = new CandidatoProcessoSeletivo();
														$candProcSelObj->setPessoa($pessoaObj);
														$candProcSelObj->setProcessoSeletivo($proSelObj);
														$candProcSelObj->setStatus("Desclassificado");
														$candProcSelObj->updateStatus();
													}
											}
											
									}
							}
						
					}
			}
	}