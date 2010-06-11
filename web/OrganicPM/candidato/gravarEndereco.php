<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/UnidadeFederativa.class.php';
include_once '../lib/Form/Form.class.php';

include_once '../plugins/validateEmail.function.php';
include_once '../plugins/checkDateFormat.function.php';

class gravarEndereco
	{
		private $form;
		
		private $pessoa;
				
		private $codigo;
		private $endereco;
		private $bairro;
		private $cidade;
		private $cep;
		private $pais;
		private $numero;
		private $complemento;
		
		private $unidadeFederativa;
		
		private $error = false;
		
		public function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//UF
				$this->unidadeFederativa = new UnidadeFederativa();
				
				//Pega os dados do post
				$this->getPost();
				
				//Insere o currículo
				$this->novo();
			}
			
		public function getPost()
			{
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
				//==================================================================
		   		// Endereço ========================================================
		   		//==================================================================					
				//Endereço
				if (isset($_POST['endereco']))
					{
						$this->endereco = $_POST['endereco'];
						
						if ($this->endereco == '')
							{
								$this->form->setError("endereco", "O endereço não pode ser vazio.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("endereco", "O endereço não pode ser vazio.");
						$this->error = true;
					}
					
				//Numero
				if (isset($_POST['numero']))
					{
						$this->numero = $_POST['numero'];
						
						if ($this->numero == '')
							{
								$this->form->setError("numero", "O número não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->numero))
								{
									$this->form->setError("numero", "O número deve conter apenas números.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("numero", "O número não pode ser vazio.");
						$this->error = true;
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
								$this->error = true;
							}
						else
							if (!is_numeric($this->cep))
								{
									$this->form->setError("cep", "O CEP deve conter apenas números.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("cep", "O CEP não pode ser vazio.");
						$this->error = true;
					}
					
				//Bairro
				if (isset($_POST['bairro']))
					{
						$this->bairro = $_POST['bairro'];
						
						if ($this->bairro == '')
							{
								$this->form->setError("bairro", "O bairro não pode ser vazio.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("bairro", "O bairro não pode ser vazio.");
						$this->error = true;
					}
				
				//Cidade
				if (isset($_POST['cidade']))
					{
						$this->cidade = $_POST['cidade'];
						
						if ($this->cidade == '')
							{
								$this->form->setError("cidade", "A cidade não pode ser vazia.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("cidade", "A cidade não pode ser vazia.");
						$this->error = true;
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
												$this->error = true;
											}
									}
								else
									{
										$this->form->setError("uf", "Unidade Federativa inválida.");
										$this->error = true;
									}
							}
					}
				else
					{
						$this->unidadeFederativa = null;
					}
					
				//País
				if (isset($_POST['pais']))
					{
						$this->pais = $_POST['pais'];
						
						if ($this->pais == '')
							{
								$this->form->setError("pais", "O país não pode ser vazia.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("pais", "O país não pode ser vazia.");
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
					header("Location: endereco.php?status=erro");
				else
					header("Location: endereco.php?status=sucesso");
				die();
			}

		public function novo()
			{
				//Variáveis
				$this->pessoa->setCodigo($this->codigo);
				$this->pessoa->setEndereco($this->endereco);
				$this->pessoa->setNumero($this->numero);
				$this->pessoa->setComplemento($this->complemento);
				$this->pessoa->setCep($this->cep);
				$this->pessoa->setBairro($this->bairro);
				$this->pessoa->setCidade($this->cidade);
				$this->pessoa->setPais($this->pais);
								
				//Objetos
				$this->pessoa->setUnidadeFederativa($this->unidadeFederativa);
				
				//Grava os dados da pessoa
				if (!$this->pessoa->alterEndereco())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				
				//Redireciona
				$this->redirect();
			}
	}
	
$curriculo = new gravarEndereco();