<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/EstadoCivil.class.php';
include_once '../lib/Form/Form.class.php';

include_once '../plugins/validateEmail.function.php';
include_once '../plugins/checkDateFormat.function.php';

class gravarDadosPessoais
	{
		private $form;
		
		private $pessoa;
				
		private $codigo;
		private $nome;
		private $dataNasc;
		private $emailPrimario;
		private $emailSecundario;
		private $naturalidade;
		private $sexo;
		private $estadoCivil;
		
		private $sexoList 	= array("masculino", "feminino");
		
		private $error = false;
		
		public function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Estado Civil
				$this->estadoCivil = new EstadoCivil();
				
				//Pega os dados do post
				$this->getPost();
				
				//Insere o currículo
				$this->novo();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Dados Pessoais ==================================================
		   		//==================================================================
				//Código
				if (isset($_POST['pessoa_cod']))
					{
						$this->codigo = $_POST['pessoa_cod'];
						
						if ($this->codigo == '')
							{
								$this->form->setError("geral", "Erro ao alterar os dados da pessoa.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->codigo))
								{
									$this->form->setError("geral", "Erro ao alterar os dados da pessoa.");
									$this->error = true;
								}
					}
					
				if (isset($_POST['nome']))
					{
						$this->nome = $_POST['nome'];
						
						if ($this->nome == '')
							{
								$this->form->setError("nome", "O nome não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_string($this->nome))
								{
									$this->form->setError("nome", "O nome não é uma string válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("nome", "O nome não pode ser vazio.");
						$this->error = true;
					}
					
				//Email Primário
				if (isset($_POST['email']))
					{
						$this->emailPrimario = $_POST['email'];
						
						if ($this->emailPrimario == '')
							{
								$this->form->setError("email", "O email primário não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!validateEmail($this->emailPrimario))
								{
									$this->form->setError("email", "O email primário não é válido.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("email", "O email primário não pode ser vazio.");
						$this->error = true;
					}
					
				//Email Secundário
				if (isset($_POST['email_sec']))
					{
						$this->emailSecundario = $_POST['email_sec'];
						
						if ($this->emailSecundario == '')
							$this->emailSecundario = "";
						else
							if (!validateEmail($this->emailSecundario))
								{
									$this->form->setError("email_sec", "O email secundário não é válido.");
									$this->error = true;
								}
					}
				else
					$this->emailSecundario = "";
					
				//Data Nascimento
				if (isset($_POST['data_nascimento']))
					{
						$this->dataNasc = $_POST['data_nascimento'];
						
						if ($this->dataNasc == '')
							{
								$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!checkDateFormat($this->dataNasc))
								{
									$this->form->setError("data_nascimento", "A data de nascimento não é válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
						$this->error = true;
					}
					
				//Naturalidade
				if (isset($_POST['naturalidade']))
					{
						$this->naturalidade = $_POST['naturalidade'];
						
						if ($this->naturalidade == '')
							{
								$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!is_string($this->naturalidade))
								{
									$this->form->setError("naturalidade", "A naturalidade não é válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
						$this->error = true;
					}
					
				//Sexo
				if (isset($_POST['sexo']))
					{
						$this->sexo = $_POST['sexo'];
						
						if ($this->sexo == '')
							{
								$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!in_array(strtolower($this->sexo), $this->sexoList))
								{
									$this->form->setError("sexo", "Opção sexo possui valor inválido.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
						$this->error = true;
					}
					
				//Estado Civil
				if (isset($_POST['estado_civil']))
					{
						$estadoCivil = $_POST['estado_civil'];
						
						if ($this->estadoCivil == '')
							{
								$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
								$this->error = true;
							}
						else
							{
								if (is_numeric($estadoCivil))
									{
										$this->estadoCivil->setCodigo($estadoCivil);
										
										if (!$this->estadoCivil->searchByCodigo())
											{
												$this->form->setError("estado_civil", "Estado civil inválido.");
												$this->error = true;
											}
									}
								else
									{
										$this->form->setError("estado_civil", "Estado civil inválido.");
										$this->error = true;
									}
							}
					}
				else
					{
						$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
						$this->error = true;
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
					header("Location: dados_pessoais.php?status=erro");
				else
					header("Location: dados_pessoais.php?status=sucesso");
				die();
			}

		public function novo()
			{
				//Variáveis
				$this->pessoa->setCodigo($this->codigo);
				$this->pessoa->getCpfByCodigo();
				$this->pessoa->setNome($this->nome);
				$this->pessoa->setEmailPrimario($this->emailPrimario);
				$this->pessoa->setEmailSecundario($this->emailSecundario);
				$this->pessoa->setDataNasc($this->dataNasc);
				$this->pessoa->setNaturalidade($this->naturalidade);
				$this->pessoa->setSexo($this->sexo);
								
				//Objetos
				$this->pessoa->setEstadoCivil($this->estadoCivil);
				
				//Grava os dados da pessoa
				if (!$this->pessoa->alterDadosPessoais())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				
				//Redireciona
				$this->redirect();
			}
	}
	
$curriculo = new gravarDadosPessoais();