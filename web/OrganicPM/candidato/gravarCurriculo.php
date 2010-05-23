<?php

include_once '../config/config.inc.php';
include_once '../lib/Candidato.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/EstadoCivil.class.php';
include_once '../lib/UnidadeFederativa.class.php';
include_once '../lib/Telefone.class.php';
include_once '../lib/TipoTelefone.class.php';
include_once '../lib/IdiomaCandidato.class.php';
include_once '../lib/Referencia.class.php';
include_once '../lib/Experiencia.class.php';
include_once '../lib/FormacaoAcademica.class.php';
include_once '../lib/CursoFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/FormacaoAdicional.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../plugins/validateEmail.function.php';
include_once '../plugins/validateUsername.function.php';
include_once '../plugins/validatePassword.function.php';
include_once '../plugins/checkDateFormat.function.php';

class gravarCurriculo
	{
		private $form;
		
		private $pessoa;
		
		
		private $codigo;
		private $nome;
		private $dataNasc;
		private $cpf;
		private $endereco;
		private $bairro;
		private $emailPrimario;
		private $emailSecundario;
		private $naturalidade;
		private $cidade;
		private $cep;
		private $pais;
		private $numero;
		private $complemento;
		private $sexo;
		private $estadoCivil;
		private $unidadeFederativa;
		
		private $sexoList = array("masculino", "feminino");
		
		public function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//UF
				$this->unidadeFederativa = new UnidadeFederativa();
				
				//Estado Civil
				$this->estadoCivil = new EstadoCivil();
								
				//Pega os dados do post
				$this->getPost();
				
				//Insere o currículo
				$this->novo();
			}
			
		public function getPost()
			{
				$error = false;
				
				//Nome
				if (isset($_POST['nome']))
					{
						$this->nome = $_POST['nome'];
						
						if ($this->nome == '')
							{
								$this->form->setError("nome", "O nome não pode ser vazio.");
								$error = true;
							}
						else
							if (!is_string($this->nome))
								{
									$this->form->setError("nome", "O nome não é uma string válida.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("nome", "O nome não pode ser vazio.");
						$error = true;
					}
					
				//Email Primário
				if (isset($_POST['email']))
					{
						$this->emailPrimario = $_POST['email'];
						
						if ($this->emailPrimario == '')
							{
								$this->form->setError("email", "O email primário não pode ser vazio.");
								$error = true;
							}
						else
							if (!validateEmail($this->emailPrimario))
								{
									$this->form->setError("email", "O email primário não é válido.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("email", "O email primário não pode ser vazio.");
						$error = true;
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
									$error = true;
								}
					}
				else
					$this->emailSecundario = "";
					
				//CPF
				if (isset($_POST['cpf']))
					{
						$this->cpf = $_POST['cpf'];
						
						if ($this->cpf == '')
							{
								$this->form->setError("cpf", "O cpf não pode ser vazio.");
								$error = true;
							}
						else
							{
								if (is_numeric($this->cpf))
									{								
										if (strlen($this->cpf) != 11)
											{
												$this->form->setError("cpf", "O cpf possui 11 caracteres.");
												$error = true;
											}
									}
								else
									{
										$this->form->setError("cpf", "O cpf é composto apenas por números.");
										$error = true;
									}
							}
						
					}
				else
					{
						$this->form->setError("cpf", "O cpf não pode ser vazio.");
						$error = true;
					}
					
				//Data Nascimento
				if (isset($_POST['data_nascimento']))
					{
						$this->dataNasc = $_POST['data_nascimento'];
						
						if ($this->dataNasc == '')
							{
								$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
								$error = true;
							}
						else
							if (!checkDateFormat($this->dataNasc))
								{
									$this->form->setError("data_nascimento", "A data de nascimento não é válida.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
						$error = true;
					}
					
				//Naturalidade
				if (isset($_POST['naturalidade']))
					{
						$this->naturalidade = $_POST['naturalidade'];
						
						if ($this->naturalidade == '')
							{
								$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
								$error = true;
							}
						else
							if (!is_string($this->naturalidade))
								{
									$this->form->setError("naturalidade", "A naturalidade não é válida.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
						$error = true;
					}
					
				//Sexo
				if (isset($_POST['sexo']))
					{
						$this->sexo = $_POST['sexo'];
						
						if ($this->sexo == '')
							{
								$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
								$error = true;
							}
						else
							if (!in_array(strtolower($this->sexo), $this->sexoList))
								{
									$this->form->setError("sexo", "Opção sexo possui valor inválido.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
						$error = true;
					}
					
				//Endereço
				if (isset($_POST['endereco']))
					{
						$this->endereco = $_POST['endereco'];
						
						if ($this->endereco == '')
							{
								$this->form->setError("endereco", "O endereço não pode ser vazio.");
								$error = true;
							}
					}
				else
					{
						$this->form->setError("endereco", "O endereço não pode ser vazio.");
						$error = true;
					}
					
				//Numero
				if (isset($_POST['numero']))
					{
						$this->numero = $_POST['numero'];
						
						if ($this->numero == '')
							{
								$this->form->setError("numero", "O número não pode ser vazio.");
								$error = true;
							}
						else
							if (!is_numeric($this->numero))
								{
									$this->form->setError("numero", "O número deve conter apenas números.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("numero", "O número não pode ser vazio.");
						$error = true;
					}
					
				//Complemento
				if (isset($_POST['complemento']))
					{
						$this->complemento = $_POST['complemento'];
					}
				else
					{
						$this->complemento = "";
					}
					
				//CEP
				if (isset($_POST['cep']))
					{
						$this->cep = $_POST['cep'];
						
						if ($this->cep == '')
							{
								$this->form->setError("cep", "O CEP não pode ser vazio.");
								$error = true;
							}
						else
							if (!is_numeric($this->cep))
								{
									$this->form->setError("cep", "O CEP deve conter apenas números.");
									$error = true;
								}
					}
				else
					{
						$this->form->setError("cep", "O CEP não pode ser vazio.");
						$error = true;
					}
					
				//Bairro
				if (isset($_POST['bairro']))
					{
						$this->bairro = $_POST['bairro'];
						
						if ($this->bairro == '')
							{
								$this->form->setError("bairro", "O bairro não pode ser vazio.");
								$error = true;
							}
					}
				else
					{
						$this->form->setError("bairro", "O bairro não pode ser vazio.");
						$error = true;
					}
				
				//Cidade
				if (isset($_POST['cidade']))
					{
						$this->cidade = $_POST['cidade'];
						
						if ($this->cidade == '')
							{
								$this->form->setError("cidade", "A cidade não pode ser vazia.");
								$error = true;
							}
					}
				else
					{
						$this->form->setError("cidade", "A cidade não pode ser vazia.");
						$error = true;
					}
					
				//UF
				if (isset($_POST['uf']))
					{
						$uf = $_POST['uf'];
						
						if ($uf == '')
							$this->unidadeFederativa = null;
						else
							{
								if (is_numeric($uf))
									{
										$this->unidadeFederativa->setCodigo($uf);
										
										if (!$this->unidadeFederativa->searchByCodigo())
											{
												$this->form->setError("uf", "Unidade Federativa inválida.");
												$error = true;
											}
									}
								else
									{
										$this->form->setError("uf", "Unidade Federativa inválida.");
										$error = true;
									}
							}
					}
				else
					{
						$this->unidadeFederativa = null;
					}
					
				//Estado Civil
				if (isset($_POST['estado_civil']))
					{
						$estadoCivil = $_POST['estado_civil'];
						
						if ($this->estadoCivil == '')
							{
								$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
								$error = true;
							}
						else
							{
								if (is_numeric($estadoCivil))
									{
										$this->estadoCivil->setCodigo($estadoCivil);
										
										if (!$this->estadoCivil->searchByCodigo())
											{
												$this->form->setError("estado_civil", "Estado civil inválido.");
												$error = true;
											}
									}
								else
									{
										$this->form->setError("estado_civil", "Estado civil inválido.");
										$error = true;
									}
							}
					}
				else
					{
						$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
						$error = true;
					}
					
				//País
				if (isset($_POST['pais']))
					{
						$this->pais = $_POST['pais'];
						
						if ($this->pais == '')
							{
								$this->form->setError("pais", "O país não pode ser vazia.");
								$error = true;
							}
					}
				else
					{
						$this->form->setError("pais", "O país não pode ser vazia.");
						$error = true;
					}
					
				if ($error === true)
					$this->redirect();
			}
			
		public function redirect()
			{
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
								
				//Redirect
				header("Location: cadastrar.php");
				die();
			}
		
		public function novo()
			{
				//Variáveis
				$this->pessoa->setNome($this->nome);
				$this->pessoa->setEmailPrimario($this->emailPrimario);
				$this->pessoa->setEmailSecundario($this->emailSecundario);
				$this->pessoa->setCpf($this->cpf);
				$this->pessoa->setDataNasc($this->dataNasc);
				$this->pessoa->setNaturalidade($this->naturalidade);
				$this->pessoa->setSexo($this->sexo);
				$this->pessoa->setEndereco($this->endereco);
				$this->pessoa->setNumero($this->numero);
				$this->pessoa->setComplemento($this->complemento);
				$this->pessoa->setCep($this->cep);
				$this->pessoa->setBairro($this->bairro);
				$this->pessoa->setCidade($this->cidade);
				$this->pessoa->setPais($this->pais);
				
				//Objetos
				$this->pessoa->setUnidadeFederativa($this->unidadeFederativa);
				$this->pessoa->setEstadoCivil($this->estadoCivil);
				
				//Grava no bd
				$this->pessoa->record();
				
				//Provisório
				echo "Gravado";
			}
	}
	
$curriculo = new gravarCurriculo();