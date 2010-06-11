<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
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
$smarty->assign("page", "vagas");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);

//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());

if ($session->loggedIn)
	{
		if (isset($_GET['action']) && $_GET['action'] == "inscricao")
			{
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						$smarty->assign("cod", $cod);
						
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($cod);
						$procSel->setPessoa($pessoa);
						
						if ($procSel->isAtivo())
							{
								$data = $procSel->getDataByCodigo();
								
								$smarty->assign("cod", $cod);
								$smarty->assign("descricao", $data[0]);
								$smarty->assign("data_inicio", $data[1]);
								$smarty->assign("data_fim", $data[2]);
								$smarty->assign("vagas", $data[3]);
								$smarty->assign("cargo", $data[4]);
								
								if ($procSel->cadastroExiste())
									$smarty->assign("pro_sel_aviso", "Você já está inscrito neste processo seletivo.");
								else
									{
										$procSel->addCandidato();
										$smarty->assign("pro_sel_sucesso", "Inscrição efetuada com sucesso.");
									}
							}
					}
				else
					header("Location: candidato/index.php");
			}
		elseif (isset($_GET['action']) && $_GET['action'] == "listar")
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
				$data = $procSel->listProcSelAtivosByPage($start, ($start+$lenght));
				$count = $procSel->countAtivos();
				
				$pagination = new Pagination($page, $count, $lenght, 1, "vaga.php?action=listar");
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5]);
					}
					
				$columns = array(
								'Código',
								'Descrição',
								'Data de Início',
								'Data de Fim',
								'Vagas',
								'Cargo'
							);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Processos Seletivos");
				$smarty->assign("pagination", $pagination->getPagenavi());
				$smarty->assign("detalhes", "vaga");
			}
		elseif (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				$smarty->assign("cod", $cod);
				
				if (is_numeric($cod))
					{
						$procSel = new ProcessoSeletivo();
						$procSel->setCodigo($cod);
						
						if ($procSel->isAtivo())
							{
								$data = $procSel->getDataByCodigo();
								
								$smarty->assign("cod", $cod);
								$smarty->assign("descricao", $data[0]);
								$smarty->assign("data_inicio", $data[1]);
								$smarty->assign("data_fim", $data[2]);
								$smarty->assign("vagas", $data[3]);
								$smarty->assign("cargo", $data[4]);
							}
						else 
							$smarty->assign("pro_sel_erro", true);
					}
				else
					$smarty->assign("pro_sel_erro", true);
			}
		else
			header("Location: candidato/index.php");
	}

//Show the page
$smarty->display('index.tpl');