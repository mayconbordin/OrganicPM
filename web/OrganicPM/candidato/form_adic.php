<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/FormacaoAdicional.class.php';
include_once '../lib/Instituicao.class.php';

$actions = array("listar", "deletar", "editar", "novo");

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
		if (!in_array($action, $actions))
			$action = "listar";
	}
else
	$action = "listar";


global $form;

//==================================================================
// Template ========================================================
//==================================================================

$smarty = new Smarty;

//Smarty Configs
$smarty->template_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates';
$smarty->compile_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates_c';
$smarty->cache_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/cache';
$smarty->config_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/configs';
$smarty->compile_check	= true;
$smarty->debugging		= false;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "formacao_adicional");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);

//Errors
if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);
	
//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());


if ($session->loggedIn)
	{
		if ($action == "listar")
			{
				//Rows per page
				$lenght = 20;
				
				if (isset($_GET['page']))
					{
						$page = $_GET['page'];
					}
				else
					{
						$page = 1;
					}
					
				$start = ($page - 1) * $lenght;
				
				//Formações adicionais
				$formAdicional = new FormacaoAdicional();
				$formAdicional->setPessoa($pessoa);
				$data = $formAdicional->listFormAdicByPage($start, ($start+$lenght));
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5], $data[$i][6]);
					}
				
				$count = $formAdicional->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "form_adic.php?action=listar");
					
				$columns = array(
								'Código',
								'Instituição',
								'Tipo',
								'Curso',
								'Data de Início',
								'Data de Fim',
								'Carga Horária'
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Experiências Profissionais");
				$smarty->assign("pagination", $pagination->getPagenavi());
				
				$smarty->assign("novo", true);
				$smarty->assign("novo_link", "form_adic.php?action=novo");
			}
		elseif ($action == "editar")
			{
				$instituicao = new Instituicao();
				$smarty->assign("listInstituicoes", $instituicao->listInstituicoes());
				
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (is_numeric($cod))
							$smarty->assign("form_adic_cod", $cod);
						else
							header("Location: form_adic.php");
					}
					
				$formAdic = new FormacaoAdicional();
				$formAdic->setCodigo($cod);
				$data = $formAdic->getDataByCodigo();
				
				$smarty->assign("adic_instituicao", $data[0]);
				$smarty->assign("tipo", $data[1]);
				$smarty->assign("adic_curso", $data[2]);
				$smarty->assign("adic_data_inicio", $data[3]);
				$smarty->assign("adic_data_fim", $data[4]);
				$smarty->assign("carga_horaria", $data[5]);
				
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("adic_instituicao_erro", $form->error("adic_instituicao"));
				$smarty->assign("tipo_erro", $form->error("tipo"));
				$smarty->assign("adic_curso_erro", $form->error("adic_curso"));
				$smarty->assign("adic_data_inicio_erro", $form->error("adic_data_inicio"));
				$smarty->assign("adic_data_fim_erro", $form->error("adic_data_fim"));
				$smarty->assign("carga_horaria_erro", $form->error("carga_horaria"));
			}
		elseif ($action == "novo")
			{
				$instituicao = new Instituicao();
				$smarty->assign("listInstituicoes", $instituicao->listInstituicoes());
				
				$smarty->assign("adic_instituicao", $form->value("adic_instituicao"));
				$smarty->assign("tipo", $form->value("tipo"));
				$smarty->assign("adic_curso", $form->value("adic_curso"));
				$smarty->assign("adic_data_inicio", $form->value("adic_data_inicio"));
				$smarty->assign("adic_data_fim", $form->value("adic_data_fim"));
				$smarty->assign("carga_horaria", $form->value("carga_horaria"));
				
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("adic_instituicao_erro", $form->error("adic_instituicao"));
				$smarty->assign("tipo_erro", $form->error("tipo"));
				$smarty->assign("adic_curso_erro", $form->error("adic_curso"));
				$smarty->assign("adic_data_inicio_erro", $form->error("adic_data_inicio"));
				$smarty->assign("adic_data_fim_erro", $form->error("adic_data_fim"));
				$smarty->assign("carga_horaria_erro", $form->error("carga_horaria"));
			}
		elseif ($action == "deletar")
			{
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (!is_numeric($cod))
							header("Location: form_adic.php?action=listar&status=erro");
					}
					
				$formAdic = new FormacaoAdicional();
				$formAdic->setCodigo($cod);
				
				if (!$formAdic->remove())
					header("Location: form_adic.php?action=listar&status=erro");
				else
					header("Location: form_adic.php?action=listar&status=sucesso");
			}
	}
	

//Show the page
$smarty->display('index.tpl');