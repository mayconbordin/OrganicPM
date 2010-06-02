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

include_once '../plugins/checkDateFormat.function.php';

class gravarProcSel
	{
		//Vars
		private $codigo;
		private $descricao;
		private $dataInicio;
		private $dataFim;
		private $vagas;
		
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
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Processo Seletivo ===============================================
		   		//==================================================================
				{
					//Descrição
					if (isset($_POST['descricao']))
						{
							$this->descricao = $_POST['descricao'];
							
							if ($this->descricao == '')
								{
									$this->form->setError("descricao", "A descrição não pode ser vazia.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("descricao", "A descrição não pode ser vazia.");
							$this->error = true;
						}
						
					//Data de Início
					if (isset($_POST['data_inicio']))
						{
							$this->dataInicio = $_POST['data_inicio'];
							
							if ($this->dataInicio == '')
								{
									$this->form->setError("data_inicio", "A data de início não pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->dataInicio))
								{
									$this->form->setError("data_inicio", "A data de início não é válida.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("data_inicio", "A data de início não pode ser vazia.");
							$this->error = true;
						}
						
					//Data de Fim
					if (isset($_POST['data_fim']))
						{
							$this->dataFim = $_POST['data_fim'];
							
							if ($this->dataFim == '')
								{
									$this->form->setError("data_fim", "A data de início não pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->dataFim))
								{
									$this->form->setError("data_fim", "A data de início não é válida.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("data_fim", "A data de início não pode ser vazia.");
							$this->error = true;
						}
						
					//Vagas
					if (isset($_POST['vagas']))
						{
							$this->vagas = $_POST['vagas'];
							
							if ($this->vagas == '')
								{
									$this->form->setError("vagas", "O campo de vagas não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->vagas))
								{
									$this->form->setError("vagas", "O valor das vagas não é válido.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("vagas", "O campo de vagas não pode ser vazio.");
							$this->error = true;
						}
						
					//Cargo
					if (isset($_POST['cargo']))
						{
							$cargo = $_POST['cargo'];
							$this->cargo->setCodigo($cargo);
							
							if ($cargo == '')
								{
									$this->form->setError("cargo", "O campo de cargo não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($cargo))
								{
									$this->form->setError("cargo", "O cargo informado não é válido.");
									$this->error = true;
								}
							elseif (!$this->cargo->searchByCodigo())
								{
									$this->form->setError("cargo", "O cargo informado não é válido.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("cargo", "O campo de cargo não pode ser vazio.");
							$this->error = true;
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
			   						
			   						//Sempre começa em um, pois o primeiro valor é vazio
		   							for ($i = 1; $i < $count; $i++)
		   								{
		   									if (strpos($tipo[$i], '-') !== false)
		   										{
		   											$data = explode('-', $tipo[$i]);
		   											$tipo[$i] = $data[0];
		   											$teste = $data[1];
		   											
		   											if (!is_numeric($teste))
			   											{
			   												$this->form->setError("fase", "O teste informado não é válido.");
															$this->error = true;
			   											}
			   										else
			   											{
				   											$test = new Teste();
				   											$test->setCodigo($teste);
				   											if (!$test->searchByCodigo())
				   												{
				   													$this->form->setError("fase", "O teste informado não é válido.");
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
													$this->form->setError("fase", "O tipo de fase não é válido.");
													$this->error = true;
												}
											else
												{
													$tipoFase = new TipoFase();
													$tipoFase->setCodigo($tipo[$i]);
													if (!$tipoFase->searchByCodigo())
														{
															$this->form->setError("fase", "A fase informada não existe.");
															$this->error = true;
														}
												}
											
											if (!checkDateFormat($dataInicio[$i]))
												{
													$this->form->setError("fase", "A data de início não é válida.");
													$this->error = true;
												}
		   									if (!checkDateFormat($dataFim[$i]))
												{
													$this->form->setError("fase", "A data de fim não é válida.");
													$this->error = true;
												}
												
											if ($this->error === false)
												{
													$this->fases[$i] = array(
																		'fase_tipo' => $tipoFase,
																		'fase_data_inicio' => $dataInicio[$i],
																		'fase_data_fim' => $dataFim[$i],
																		'teste' => $test
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
						$fas->setDataFim($fase['fase_data_inicio']);
						$fas->setDataInicio($fase['fase_data_fim']);
						$fas->setProcessoSeletivo($this->processoSeletivo);
						$fas->setTipoFase($fase['fase_tipo']);
						$fas->setOrdem($index);
						
						if (!$fas->record())
							{
								$this->form->setError("fase", "Não foi possível gravar os dados das fases.");
								$this->error = true;
							}
							
						$tipoFase = $fase['fase_tipo'];
						$tipoFase->getFaseByCodigo();
						$fase = $tipoFase->getFase();
												
						if (strpos(strtolower($fase), "teste") !== false)
							{
								$faseTeste = new FaseTeste();
						        $faseTeste->setFase($fas);
						        $faseTeste->setTeste($fase['teste']);
						        $faseTeste->record();
							}
						elseif (strpos(strtolower($fase), "triagem") !== false)
							{
								$faseTriagem = new Triagem();
						    	$faseTriagem->setFase($fas);
						    	$faseTriagem->record();
							}
						elseif (strpos(strtolower($fase), "entrevista") !== false)
							{
								$faseEntrev = new Entrevista();
						        $faseEntrev->setFase($fas);
						        $faseEntrev->record();
							}
					}
			}
			
		public function record()
			{
				$this->processoSeletivo->setCargo($this->cargo);
				$this->processoSeletivo->setDataFim($this->dataFim);
				$this->processoSeletivo->setDataInicio($this->dataInicio);
				$this->processoSeletivo->setDescricao($this->descricao);
				$this->processoSeletivo->setVagas($this->vagas);
				
				//Grava os dados do processo seletivo
				if (!$this->processoSeletivo->record())
					{
						$this->form->setError("processo_seletivo", "Não foi possível gravar os dados do processo seletivo.");
						$this->error = true;
						$this->redirect();
					}
					
				//Grava as fases
				$this->recordFases();
				
				//Redireciona
				$this->redirect();
			}
	}
	
$procSel = new gravarProcSel();