<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Conhecimento.class.php';

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
$smarty->assign("page", "conhecimentos");
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
				
				//Conhecimentos
				$conhecimento = new Conhecimento();
				$conhecimento->setPessoa($pessoa);
				$data = $conhecimento->listConhecimentoByPage($start, ($start+$lenght));
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3]);
					}
				
				$count = $conhecimento->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "conhecimentos.php?action=listar");
					
				$columns = array(
								'Código',
								'Grupo',
								'Descrição',
								'Proficiência'
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Conhecimentos");
				$smarty->assign("pagination", $pagination->getPagenavi());
				
				$smarty->assign("novo", true);
				$smarty->assign("novo_link", "conhecimentos.php?action=novo");
			}
		elseif ($action == "editar")
			{
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (is_numeric($cod))
							$smarty->assign("conhecimento_cod", $cod);
						else
							header("Location: conhecimentos.php");
					}
					
				$conhecimento = new Conhecimento();
				$conhecimento->setCodigo($cod);
				$data = $conhecimento->getDataByCodigo();
				
				$smarty->assign("grupo_conhecimento", $data[0]);
				$smarty->assign("conhecimento", $data[1]);
				$smarty->assign("proficiencia", $data[2]);
				
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("grupo_conhecimento_erro", $form->error("grupo_conhecimento"));
				$smarty->assign("conhecimento_erro", $form->error("conhecimento"));
				$smarty->assign("proficiencia_erro", $form->error("proficiencia"));
			}
		elseif ($action == "novo")
			{
				$smarty->assign("grupo_conhecimento", $form->value("grupo_conhecimento"));
				$smarty->assign("conhecimento", $form->value("conhecimento"));
				$smarty->assign("proficiencia", $form->value("proficiencia"));
				
				$smarty->assign("geral_erro", $form->error("geral"));
				$smarty->assign("grupo_conhecimento_erro", $form->error("grupo_conhecimento"));
				$smarty->assign("conhecimento_erro", $form->error("conhecimento"));
				$smarty->assign("proficiencia_erro", $form->error("proficiencia"));
			}
		elseif ($action == "deletar")
			{
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (!is_numeric($cod))
							header("Location: conhecimentos.php?action=listar&status=erro");
					}
					
				$conhecimento = new Conhecimento();
				$conhecimento->setCodigo($cod);
				
				if (!$conhecimento->remove())
					header("Location: conhecimentos.php?action=listar&status=erro");
				else
					header("Location: conhecimentos.php?action=listar&status=sucesso");
			}
	}
	

//Show the page
$smarty->display('index.tpl');