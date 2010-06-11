<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';

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
$smarty->assign("page", "fases");
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
				
				$fases = new Fases();
				$fases->setPessoa($pessoa);
				$data = $fases->listFasesByPageAndPessoa($start, ($start+$lenght));
				$count = $fases->countByPessoa();
								
				$pagination = new Pagination($page, $count, $lenght, 1, "fase.php?action=listar");
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][6], $data[$i][2], $data[$i][3], $data[$i][4]);
					}
					
				$columns = array(
								'Código',
								'Fase',
								'Data de Início',
								'Data de Fim',
								'Status'
							);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Fases");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("detalhes", "fase");
			}
		elseif (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				$smarty->assign("cod", $cod);
				
				if (is_numeric($cod))
					{
						$fases = new Fases();
						$fases->setCodigo($cod);
						
						if ($fases->isAtivo())
							{
								$data = $fases->getDataByCodigo();
								
								$smarty->assign("cod", $cod);
								$smarty->assign("fase", $data[0]);
								$smarty->assign("data_inicio", $data[1]);
								$smarty->assign("data_fim", $data[2]);
								$smarty->assign("status", $data[3]);
								
								if (stripos($data[0],"Teste") !== false)
									$smarty->assign("teste", true);
							}
						else 
							$smarty->assign("fase_erro", true);
					}
				else
					$smarty->assign("fase_erro", true);
			}
		else
			header("Location: candidato/index.php");
	}

//Show the page
$smarty->display('index.tpl');