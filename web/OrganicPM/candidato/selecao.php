<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/CandidatoProcessoSeletivo.class.php';

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
	}

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
$smarty->debugging		= true;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "selecao");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);

//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());

if ($session->loggedIn)
	{
		if (isset($_GET['action']) && $_GET['action'] == "listar")
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
				
				$procSel = new ProcessoSeletivo();
				$procSel->setPessoa($pessoa);
				$data = $procSel->listProcSelByPageAndPessoa($start, ($start+$lenght));
				$count = $procSel->count();
				
				$pagination = new Pagination($page, $count, $lenght, 1, "selecao.php?action=listar");
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2]);
					}
					
				$columns = array(
								'Código',
								'Descrição',
								'Status'
							);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Seleções");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("detalhes", "selecao");
			}
		elseif (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				$smarty->assign("cod", $cod);
				
				if (is_numeric($cod))
					{
						$candProcSel = new CandidatoProcessoSeletivo();
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($cod);
						
						$candProcSel->setProcessoSeletivo($procSel);
						
						$data = $candProcSel->getDataByCodigo();
								
						$smarty->assign("cod", $cod);
						$smarty->assign("descricao", $data[0]);
						$smarty->assign("data_inicio", $data[1]);
						$smarty->assign("data_fim", $data[2]);
						$smarty->assign("status", $data[3]);
					}
				else
					$smarty->assign("selecao_erro", true);
			}
		else
			header("Location: candidato/index.php");
	}

//Show the page
$smarty->display('index.tpl');