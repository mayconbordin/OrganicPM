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
include_once '../lib/Logs/ActionLog.class.php';

include_once '../plugins/checkDateFormat.function.php';

class alterProcSel
	{
		//Classes
		private $processoSeletivo;
		private $cargo;
		
		private $form;
		private $log;
		
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
				
				//ActionLog
				$this->log = new ActionLog();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Processo Seletivo ===============================================
		   		//==================================================================
				{
					//Código
					if (isset($_POST['pro_sel_cod']))
						{
							$this->processoSeletivo->setCodigo($_POST['pro_sel_cod']);
							
							if ($this->processoSeletivo->getCodigo() == '')
								{
									$this->form->setError("geral", "O processo seletivo não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->processoSeletivo->getCodigo()))
								{
									$this->form->setError("geral", "Processo seletivo inválido.");
									$this->error = true;
								}
							elseif (!$this->processoSeletivo->searchByCodigo())
								{
									$this->form->setError("geral", "Processo seletivo inexistente.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("geral", "O processo seletivo não pode ser vazio.");
							$this->error = true;
						}
					
					//Descrição
					if (isset($_POST['descricao']))
						{
							$this->processoSeletivo->setDescricao($_POST['descricao']);
							
							if ($this->processoSeletivo->getDescricao() == '')
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
							$this->processoSeletivo->setDataInicio($_POST['data_inicio']);
							
							if ($this->processoSeletivo->getDataInicio() == '')
								{
									$this->form->setError("data_inicio", "A data de início não pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->processoSeletivo->getDataInicio()))
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
							$this->processoSeletivo->setDataFim($_POST['data_fim']);
							
							if ($this->processoSeletivo->getDataFim() == '')
								{
									$this->form->setError("data_fim", "A data de fim não pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->processoSeletivo->getDataFim()))
								{
									$this->form->setError("data_fim", "A data de fim não é válida.");
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
							$this->processoSeletivo->setVagas($_POST['vagas']);
							
							if ($this->processoSeletivo->getVagas() == '')
								{
									$this->form->setError("vagas", "O campo de vagas não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->processoSeletivo->getVagas()))
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
							$this->cargo->setCodigo($_POST['cargo']);
							
							if ($this->cargo->getCodigo() == '')
								{
									$this->form->setError("cargo", "O campo de cargo não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->cargo->getCodigo()))
								{
									$this->form->setError("cargo", "O cargo informado não é válido.");
									$this->error = true;
								}
							elseif (!$this->cargo->searchByCodigo())
								{
									$this->form->setError("cargo", "O cargo informado não é válido.");
									$this->error = true;
								}
								
							$this->processoSeletivo->setCargo($this->cargo);
						}
					else
						{
							$this->form->setError("cargo", "O campo de cargo não pode ser vazio.");
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
         		
         		//ActionLog
         		if ($this->error)
         			$this->log->recordAction("Falha ao modificar dados do processo seletivo");
         		else
         			$this->log->recordAction("Modificou dados do processo seletivo");
								
				//Redirect
				if ($this->error)
					header("Location: procseletivo.php?action=editar&id=".$this->processoSeletivo->getCodigo()."&status=erro");
				else
					header("Location: procseletivo.php?action=editar&id=".$this->processoSeletivo->getCodigo()."&status=sucesso");
				die();
			}
		
		public function record()
			{
				//Grava os dados do processo seletivo
				if (!$this->processoSeletivo->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os dados do processo seletivo.");
						$this->error = true;
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$procSel = new alterProcSel();