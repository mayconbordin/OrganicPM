<?php

include_once '../config/config.inc.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Cargo.class.php';
include_once '../lib/TipoFase.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/FaseTeste.class.php';
include_once '../lib/Triagem.class.php';
include_once '../lib/Entrevista.class.php';

include_once '../lib/NivelFormacao.class.php';
include_once '../lib/Keywords.class.php';

include_once '../plugins/checkDateFormat.function.php';

class gravarProcSel
	{
		//Vars
		private $codigo;
		private $descricao;
		private $dataInicio;
		private $dataFim;
		private $inscAte;
		private $vagas;
		
		private $nivelForm;
		private $keywords = array();
		
		//Classes
		private $processoSeletivo;
		private $cargo;
		
		private $form;
		
		//Arrays
		private $fases = array();
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->processoSeletivo = new ProcessoSeletivo();
				
				$this->cargo = new Cargo();
				
				$this->nivelForm = new NivelFormacao();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Processo Seletivo ===============================================
		   		//==================================================================
				{
					//Descri��o
					if (isset($_POST['descricao']))
						{
							$this->descricao = $_POST['descricao'];
							
							if ($this->descricao == '')
								{
									$this->form->setError("descricao", "A descri��o n�o pode ser vazia.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("descricao", "A descri��o n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Data de In�cio
					if (isset($_POST['data_inicio']))
						{
							$this->dataInicio = $_POST['data_inicio'];
							
							if ($this->dataInicio == '')
								{
									$this->form->setError("data_inicio", "A data de in�cio n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->dataInicio))
								{
									$this->form->setError("data_inicio", "A data de in�cio n�o � v�lida.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("data_inicio", "A data de in�cio n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Data de Fim
					if (isset($_POST['data_fim']))
						{
							$this->dataFim = $_POST['data_fim'];
							
							if ($this->dataFim == '')
								{
									$this->form->setError("data_fim", "A data de fim n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->dataFim))
								{
									$this->form->setError("data_fim", "A data de fim n�o � v�lida.");
									$this->error = true;
								}
							else
								{
									$dataIni = explode("/", $this->dataInicio);
									$dataIni = $dataIni[1]."/".$dataIni[0]."/".$dataIni[2];
									
									$dataFim = explode("/", $this->dataFim);
									$dataFim = $dataFim[1]."/".$dataFim[0]."/".$dataFim[2];
									
									if (strtotime($dataFim) < strtotime($dataIni))
										{
											$this->form->setError("data_fim", "A data de fim n�o pode ser menor que a data de in�cio.");
											$this->error = true;
										}
								}
						}
					else
						{
							$this->form->setError("data_fim", "A data de fim n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Inscri��es at�
					if (isset($_POST['inscricoes_ate']))
						{
							$this->inscAte = $_POST['inscricoes_ate'];
							
							if ($this->inscAte == '')
								{
									$this->form->setError("inscricoes_ate", "A data limite para inscri��es n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->inscAte))
								{
									$this->form->setError("inscricoes_ate", "A data limite para inscri��es n�o � v�lida.");
									$this->error = true;
								}
							else
								{
									$insc = explode("/", $this->inscAte);
									$insc = $insc[1]."/".$insc[0]."/".$insc[2];
									
									if ( (strtotime($insc) > strtotime($dataFim)) || (strtotime($insc) < strtotime($dataIni)) )
										{
											$this->form->setError("inscricoes_ate", "A data limite para inscri��es n�o pode ser menor que a data de in�cio.");
											$this->error = true;
										}
								}
						}
					else
						{
							$this->form->setError("inscricoes_ate", "A data limite para inscri��es pode ser vazia.");
							$this->error = true;
						}
						
					//Vagas
					if (isset($_POST['vagas']))
						{
							$this->vagas = $_POST['vagas'];
							
							if ($this->vagas == '')
								{
									$this->form->setError("vagas", "O campo de vagas n�o pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->vagas))
								{
									$this->form->setError("vagas", "O valor das vagas n�o � v�lido.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("vagas", "O campo de vagas n�o pode ser vazio.");
							$this->error = true;
						}
						
					//Cargo
					if (isset($_POST['cargo']))
						{
							$cargo = $_POST['cargo'];
							$this->cargo->setCodigo($cargo);
							
							if ($cargo == '')
								{
									$this->form->setError("cargo", "O campo de cargo n�o pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($cargo))
								{
									$this->form->setError("cargo", "O cargo informado n�o � v�lido.");
									$this->error = true;
								}
							elseif (!$this->cargo->searchByCodigo())
								{
									$this->form->setError("cargo", "O cargo informado n�o � v�lido.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("cargo", "O campo de cargo n�o pode ser vazio.");
							$this->error = true;
						}
						
					//N�vel de Forma��o
					if (isset($_POST['nivel_formacao']))
						{
							$this->nivelForm->setCodigo($_POST['nivel_formacao']);
							
							if ($this->nivelForm->getCodigo() != "false")
								{
									if (!is_numeric($this->nivelForm->getCodigo()))
										{
											$this->form->setError("nivel_formacao", "O n�vel de forma��o informado n�o � v�lido.");
											$this->error = true;
										}
									elseif (!$this->nivelForm->searchByCodigo())
										{
											$this->form->setError("nivel_formacao", "O n�vel de forma��o informado n�o � v�lido.");
											$this->error = true;
										}
								}
						}
						
					//Keywords
					if (isset($_POST['keyword']) && is_array($_POST['keyword']))
						{
							$this->keywords = $_POST['keyword'];
						}
				}
				
				//==================================================================
		   		// Fases ===========================================================
		   		//==================================================================
				{
					if (
					(isset($_POST['fase_tipo']) && is_array($_POST['fase_tipo']) && count($_POST['fase_tipo']) > 0) && 
			   		(isset($_POST['fase_data_inicio']) && is_array($_POST['fase_data_inicio']) && count($_POST['fase_data_inicio']) > 0) &&
			   		(isset($_POST['fase_data_fim']) && is_array($_POST['fase_data_fim']) && count($_POST['fase_data_fim']) > 0))
			   			{
			   				if ( count($_POST['fase_tipo']) == count($_POST['fase_data_inicio']) && count($_POST['fase_data_inicio']) == count($_POST['fase_data_fim']))
		   						{
		   							$count = count($_POST['fase_tipo']);
		   						
			   						$tipo 		= $_POST['fase_tipo'];
			   						$dataInicio = $_POST['fase_data_inicio'];
			   						$dataFim 	= $_POST['fase_data_fim'];
			   						$teste		= '';
			   						$nota 		= '';
			   						
			   						//Sempre come�a em um, pois o primeiro valor � vazio
		   							for ($i = 1; $i < $count; $i++)
		   								{
		   									if (strpos($tipo[$i], '-') !== false)
		   										{
		   											$data = explode('-', $tipo[$i]);
		   											$tipo[$i] = $data[0];
		   											$teste = $data[1];
		   											$nota = str_replace(",", ".", $data[2]);
		   											
		   											if (!is_numeric($teste))
			   											{
			   												$this->form->setError("fase", "O teste informado n�o � v�lido.");
															$this->error = true;
			   											}
			   										else
			   											{
				   											$test = new Teste();
				   											$test->setCodigo($teste);
				   											if (!$test->searchByCodigo())
				   												{
				   													$this->form->setError("fase", "O teste informado n�o � v�lido.");
																	$this->error = true;
				   												}
			   											}
		   										}

		   									if ($tipo[$i] == '' || $dataInicio[$i] == '' || $dataFim[$i] == '')
						   						{
													$this->form->setError("fase", "Todos os campos das fases precisam ser preenchidos.");
													$this->error = true;
												}
												
											if (!is_numeric($tipo[$i]))
												{
													$this->form->setError("fase", "O tipo de fase n�o � v�lido.");
													$this->error = true;
												}
											else
												{
													$tipoFase = new TipoFase();
													$tipoFase->setCodigo($tipo[$i]);
													if (!$tipoFase->searchByCodigo())
														{
															$this->form->setError("fase", "A fase informada n�o existe.");
															$this->error = true;
														}
												}
											
											if (!checkDateFormat($dataInicio[$i]))
												{
													$this->form->setError("fase", "A data de in�cio n�o � v�lida.");
													$this->error = true;
												}
		   									if (!checkDateFormat($dataFim[$i]))
												{
													$this->form->setError("fase", "A data de fim n�o � v�lida.");
													$this->error = true;
												}
												
											//Convers�o de datas
											$this->dataInicio = explode("/", $this->dataInicio);
											$this->dataInicio = $this->dataInicio[1]."/".$this->dataInicio[0]."/".$this->dataInicio[2];
											
											$this->dataFim = explode("/", $this->dataFim);
											$this->dataFim = $this->dataFim[1]."/".$this->dataFim[0]."/".$this->dataFim[2];
											
											$this->inscAte = explode("/", $this->inscAte);
											$this->inscAte = $this->inscAte[1]."/".$this->inscAte[0]."/".$this->inscAte[2];
																						
											$dataInicio[$i] = explode("/", $dataInicio[$i]);
											$dataInicio[$i] = $dataInicio[$i][1]."/".$dataInicio[$i][0]."/".$dataInicio[$i][2];
											
											$dataFim[$i] = explode("/", $dataFim[$i]);
											$dataFim[$i] = $dataFim[$i][1]."/".$dataFim[$i][0]."/".$dataFim[$i][2];
											
											//Data inicial n�o pode ser superior a data final
											if (strtotime($dataInicio[$i]) > strtotime($dataFim[$i]))
												{
													$this->form->setError("fase", "A data de fim deve ser maior que a de in�cio.");
													$this->error = true;
												}
											//Data inicial n�o pode ser menor que a data de in�cio do processo seletivo
											elseif (strtotime($dataInicio[$i]) < strtotime($this->dataInicio))
												{
													$this->form->setError("fase", "A data de in�cio deve ser maior que a data inicial do processo seletivo.");
													$this->error = true;
												}
											//Data inicial n�o pode ser maior que a data final do processo seletivo
											elseif (strtotime($dataInicio[$i]) > strtotime($this->dataFim))
		   										{
													$this->form->setError("fase", "A data de in�cio deve ser menor que a data final do processo seletivo.".$this->dataFim);
													$this->error = true;
												}
											//Data final n�o pode ser menor que a data de in�cio do processo seletivo
											elseif (strtotime($dataFim[$i]) < strtotime($this->dataInicio))
		   										{
													$this->form->setError("fase", "A data de fim deve ser maior que a data inicial do processo seletivo.");
													$this->error = true;
												}
		   									//Data final n�o pode ser maior que a data final do processo seletivo
											elseif (strtotime($dataFim[$i]) > strtotime($this->dataFim))
		   										{
													$this->form->setError("fase", "A data de fim deve ser menor que a data final do processo seletivo.");
													$this->error = true;
												}
											//O in�cio da fase deve ocorrer ap�s o fechamento das inscri��es para o processo seletivo
											elseif (strtotime($dataInicio[$i]) < strtotime($this->inscAte))
		   										{
													$this->form->setError("fase", "O in�cio da fase deve ocorrer ap�s o fechamento das inscri��es para o processo seletivo.");
													$this->error = true;
												}
												
											//Convers�o de datas
											$this->dataInicio = explode("/", $this->dataInicio);
											$this->dataInicio = $this->dataInicio[1]."/".$this->dataInicio[0]."/".$this->dataInicio[2];
											
											$this->dataFim = explode("/", $this->dataFim);
											$this->dataFim = $this->dataFim[1]."/".$this->dataFim[0]."/".$this->dataFim[2];
											
											$this->inscAte = explode("/", $this->inscAte);
											$this->inscAte = $this->inscAte[1]."/".$this->inscAte[0]."/".$this->inscAte[2];
											
											$dataInicio[$i] = explode("/", $dataInicio[$i]);
											$dataInicio[$i] = $dataInicio[$i][1]."/".$dataInicio[$i][0]."/".$dataInicio[$i][2];
											
											$dataFim[$i] = explode("/", $dataFim[$i]);
											$dataFim[$i] = $dataFim[$i][1]."/".$dataFim[$i][0]."/".$dataFim[$i][2];
												
											if ($this->error === false)
												{
													$this->fases[$i] = array(
																		'fase_tipo' => $tipoFase,
																		'fase_data_inicio' => $dataInicio[$i],
																		'fase_data_fim' => $dataFim[$i],
																		'teste' => $test,
																		'nota' => $nota
																	);
												}
		   								}
		   						}
				   			else
								{
									$this->form->setError("fase", "Todos os campos das fases precisam ser preenchidos.");
									$this->error = true;
								}
			   			}
					else
						{
							$this->form->setError("fase", "Existem erros em uma das fases.");
							$this->error = true;
						}
				}
				
				if ($this->error === true)
					$this->redirect();
			}
			
		public function redirect()
			{
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
								
				//Redirect
				if ($this->error)
					header("Location: procseletivo.php?action=novo&status=erro");
				else
					header("Location: procseletivo.php?action=novo&status=sucesso");
				die();
			}
			
		public function recordFases()
			{
				foreach ($this->fases as $index => $fase)
					{
						$fas = new Fases();
						$fas->setDataFim($fase['fase_data_fim']);
						$fas->setDataInicio($fase['fase_data_inicio']);
						$fas->setProcessoSeletivo($this->processoSeletivo);
						$fas->setTipoFase($fase['fase_tipo']);
						$fas->setOrdem($index);
						$fas->setStatus("inativo");
						
						if (!$fas->record())
							{
								$this->form->setError("fase", "N�o foi poss�vel gravar os dados das fases.");
								$this->error = true;
							}
							
						$tipoFase = $fase['fase_tipo'];
						$tipoFase->getFaseByCodigo();
						$faseTipo = $tipoFase->getFase();
												
						if (strpos(strtolower($faseTipo), "teste") !== false)
							{
								$faseTeste = new FaseTeste();
						        $faseTeste->setFase($fas);
						        $faseTeste->setTeste($fase['teste']);
						        $faseTeste->setNota($fase['nota']);
						        $faseTeste->record();
							}
						elseif (strpos(strtolower($faseTipo), "triagem") !== false)
							{
								$faseTriagem = new Triagem();
						    	$faseTriagem->setFase($fas);
						    	$faseTriagem->record();
							}
						elseif (strpos(strtolower($faseTipo), "entrevista") !== false)
							{
								$faseEntrev = new Entrevista();
						        $faseEntrev->setFase($fas);
						        $faseEntrev->record();
							}
					}
			}
			
		public function recordKeywords()
			{
				foreach ($this->keywords as $keyword)
					{
						$keyObj = new Keyword();
						$keyObj->setKeyword($keyword);
						$keyObj->setProcessoSeletivo($this->processoSeletivo);
						
						if (!$keyObj->searchByPalavraChave())
							$keyObj->record();
							
						if (!$keyObj->relateProcessoSeletivo())
							{
								$this->form->setError("processo_seletivo", "N�o foi poss�vel gravar os dados das palavras chave.");
								$this->error = true;
							}
					}
			}
			
		public function record()
			{
				$this->processoSeletivo->setCargo($this->cargo);
				$this->processoSeletivo->setDataFim($this->dataFim);
				$this->processoSeletivo->setDataInicio($this->dataInicio);
				$this->processoSeletivo->setInscricoesAte($this->inscAte);
				$this->processoSeletivo->setDescricao($this->descricao);
				$this->processoSeletivo->setVagas($this->vagas);
				
				//Grava os dados do processo seletivo
				if (!$this->processoSeletivo->record())
					{
						$this->form->setError("processo_seletivo", "N�o foi poss�vel gravar os dados do processo seletivo.");
						$this->error = true;
						$this->redirect();
					}
				else
					{
						if ($this->nivelForm->getCodigo() != "false")
							{
								$this->processoSeletivo->setNivelForm($this->nivelForm);
								$this->processoSeletivo->updateNivelFormacao();
							}
					}
					
				//Grava as fases
				$this->recordFases();
				
				if ($this->nivelForm->getCodigo() != "false")
					{
						//Grava as palavras-chave
						$this->recordKeywords();
					}
				
				//Redireciona
				$this->redirect();
			}
	}
	
$procSel = new gravarProcSel();