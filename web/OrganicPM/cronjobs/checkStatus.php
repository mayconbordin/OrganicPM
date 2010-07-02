<?php

include_once ROOT.'lib/ProcessoSeletivo.class.php';
include_once ROOT.'lib/Fases.class.php';
include_once ROOT.'lib/CandidatoProcessoSeletivo.class.php';
include_once ROOT.'lib/TriagemCandidato.class.php';
include_once ROOT.'lib/Pessoa.class.php';
include_once ROOT.'lib/FormacaoAcademica.class.php';
include_once ROOT.'lib/Keywords.class.php';

include_once ROOT.'lib/Conhecimento.class.php';
include_once ROOT.'lib/FormacaoAcademica.class.php';
include_once ROOT.'lib/FormacaoAdicional.class.php';
include_once ROOT.'lib/IdiomaCandidato.class.php';


class checkStatus
	{
		private $processoSeletivo;
		private $fase;
		
		function __construct()
			{
				$this->processoSeletivo = new ProcessoSeletivo();
				$this->fase = new Fases();
				
				$this->checkFases();
				$this->checkProcSel();
				$this->checkTriagens();
			}
			
		public function checkProcSel()
			{
				$this->processoSeletivo->updateStatus();
			}
			
		public function checkFases()
			{
				$this->fase->updateStatus();
			}
			
		public function checkTriagens()
			{
				$fases = $this->fase->listFasesAtivas();

				//Lista as fases ativas
				foreach ($fases as $fase)
					{
						//Seleciona apenas as triagens ativas
						if ($fase['TIP_FAS_COD'] == 2)
							{
								//Fase corrente
								$faseObj = new Fases();
								$faseObj->setCodigo($fase['FASE_COD']);
								
								//Processo seletivo da fase
								$proSelObj = new ProcessoSeletivo();
								$proSelObj->setCodigo($fase['PRO_SEL_COD']);
								
								//Nivel de ensino requerido
								$nivelExigido = $proSelObj->getNivelExigidoByCodigo();
								
								//Palavras_chave
								$keyword = new Keyword();
								$keyword->setProcessoSeletivo($proSelObj);
								$keywords = $keyword->listKeywordsByProcSel();
								
								//Candidatos do processos seletivo
								$canProSelObj = new CandidatoProcessoSeletivo();
								$canProSelObj->setProcessoSeletivo($proSelObj);
								$candidatos = $canProSelObj->listCandidatosAtivosByProcSel();
								
								//Lista os candidatos ativos no processo seletivo
								foreach ($candidatos as $candidato)
									{
										$pessoa = new Pessoa();
										$pessoa->setCodigo($candidato['PESSOA_COD']);
										
										$candTriag = new TriagemCandidato();
										$candTriag->setPessoa($pessoa);
										$candTriag->setFase($faseObj);
										$candTriag->setProcessoSeletivo($proSelObj);
										
										//Verifica se a triagem não foi efetuada
										if (!$candTriag->searchByPessoaAndFase())
											{
												$status = "";
												
												$formAcad = new FormacaoAcademica();
												$formAcad->setPessoa($pessoa);
												$niveis = $formAcad->listNivelByPessoa();
												
												//Verifica se o maior nível da pessoa é maior ou igual ao
												//nível requerido por aquele processo seletivo
												if($niveis[0] >= $nivelExigido->getCodigo())
													{
														//Caso haja palavras-chave, efetua a verificação
														$count = count($keywords);
														if ($count != 0)
															{
																$idioma = new IdiomaCandidato();
																$formAcad = new FormacaoAcademica();
																$formAdic = new FormacaoAdicional();
																$conhec = new Conhecimento();
																
																$true = 0;
																foreach ($keywords as $key)
																	{
																		if ($idioma->searchKeyword($key) 
																		|| $formAcad->searchKeyword($key) 
																		|| $formAdic->searchKeyword($key) 
																		|| $conhec->searchKeyword($key)
																		)
																			$true++;
																	}
																	
																if ($true >= $count)
																	{
																		//classificado
																		$status = "Classificado";
																	}
																else
																	{
																		//desclassificado
																		$status = "Desclassificado";
																	}
															}
														else
															{
																//Candidato classificado
																$status = "Classificado";
															}
													}
												else
													{
														//Candidato desclassificado
														$status = "Desclassificado";
													}
													
												//Grava o resultado da triagem
												$candProcSel = new CandidatoProcessoSeletivo();
												$candProcSel->setPessoa($pessoa);
												$candProcSel->setProcessoSeletivo($proSelObj);
												$candProcSel->setStatus($status);
												
												$candProcSel->updateStatus();
																								
												if ($status == "Classificado")
													{
														$candTriag->setStatus("Aprovado");
													}
												else
													{
														$candTriag->setStatus("Reprovado");
													}
													
												//Grava resultado da triagem
												$candTriag->record();
											}
									}
							}
					}
			}
	}