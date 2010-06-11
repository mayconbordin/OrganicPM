<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/Experiencia.class.php';
include_once '../lib/Setor.class.php';

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
$smarty->assign("page", "experiencia_profissional");
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
				
				$experiencia = new Experiencia();
				$experiencia->setPessoa($pessoa);
				$data = $experiencia->listExperienciaByPage($start, ($start+$lenght));
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5]);
					}
				
				$count = $experiencia->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "exper_prof.php?action=listar");
					
				$columns = array(
								'Código',
								'Empresa',
								'Função',
								'Atribuições',
								'Data de Início',
								'Data de Fim',
								'Setor'
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Experiências Profissionais");
				$smarty->assign("pagination", $pagination->getPagenavi());
				
				$smarty->assign("novo", true);
				$smarty->assign("novo_link", "exper_prof.php?action=novo");
			}
		elseif ($action == "editar")
			{
				$setor = new Setor();
				$smarty->assign("listSetores", $setor->listSetores());
				
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (is_numeric($cod))
							$smarty->assign("exper_prof_cod", $cod);
						else
							header("Location: exper_prof.php");
					}
					
				$exper = new Experiencia();
				$exper->setCodigo($cod);
				$data = $exper->getDataByCodigo();
				
				$smarty->assign("empresa", $data[0]);
				$smarty->assign("funcao", $data[1]);
				$smarty->assign("atribuicoes", $data[2]);
				$smarty->assign("exp_data_inicio", $data[3]);
				$smarty->assign("exp_data_fim", $data[4]);
				$smarty->assign("setor", $data[5]);
			}
		elseif ($action == "novo")
			{
				$setor = new Setor();
				$smarty->assign("listSetores", $setor->listSetores());
			}
	}
	

//Show the page
$smarty->display('index.tpl');