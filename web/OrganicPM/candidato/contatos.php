<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Telefone.class.php';
include_once '../lib/TipoTelefone.class.php';

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
$smarty->assign("page", "contatos");
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
				
				$contatos = new Telefone();
				$contatos->setPessoa($pessoa);
				$data = $contatos->listTelefonesByPage($start, ($start+$lenght));
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3]);
					}
				
				$count = $contatos->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "contatos.php?action=listar");
					
				$columns = array(
								'Código',
								'Número',
								'Área',
								'Tipo'		
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Contatos");
				$smarty->assign("pagination", $pagination->getPagenavi());
				
				$smarty->assign("novo", true);
				$smarty->assign("novo_link", "contatos.php?action=novo");
			}
		elseif ($action == "editar")
			{
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (is_numeric($cod))
							$smarty->assign("contato_cod", $cod);
						else
							header("Location: contatos.php");
					}
					
				$tipoTelefone = new TipoTelefone();
				$smarty->assign("listTiposTelefone", $tipoTelefone->listTiposTelefone());
				
				$telefone = new Telefone();
				$telefone->setCodigo($cod);
				$data = $telefone->getDataByCodigo();
				
				$smarty->assign("tipo_tel", $data[2]);
				$smarty->assign("ddd", $data[1]);
				$smarty->assign("numero_tel", $data[0]);
			}
		elseif ($action == "novo")
			{	
				$tipoTelefone = new TipoTelefone();
				$smarty->assign("listTiposTelefone", $tipoTelefone->listTiposTelefone());
			}
	}
	

//Show the page
$smarty->display('index.tpl');