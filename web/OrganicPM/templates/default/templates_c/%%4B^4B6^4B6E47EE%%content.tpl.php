<?php /* Smarty version 2.6.26, created on 2010-06-25 21:53:36
         compiled from admin%5Ccontent.tpl */ ?>
				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Administração</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/index.php" title="Início">Início</a></h2></li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Candidatos</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/busca.php" title="">BUSCAR CURRÍCULOS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Processo Seletivos</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=listar" title="">LISTAR</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=inscritos" title="">CANDIDATOS INSCRITOS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Testes</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/testes.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/testes.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Entrevistas</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/entrevistas.php?action=agendar" title="">AGENDAMENTO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/entrevistas.php?action=registrar" title="">REGISTRAR ENTREVISTA</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/entrevistas.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Relatório</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/relatorio.php?type=full" title="">GRÁFICO COMPARATIVO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/relatorio.php?type=procsel" title="">PROCESSO SELETIVO</a><li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Usuários</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/usuarios.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/usuarios.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Cadastro</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/dados_login.php?action=editar" title="Editar Login">EDITAR LOGIN</a></li>
									<li><a href="" title="">REMOVER</a></li>
								</ul>
							</li>
							
							<li class="item"><h2><a href="<?php echo $this->_config[0]['vars']['root']; ?>
process.php" title="Sair">Sair</a></h2></li>
							
						</ul>
						<!-- End Submenu -->
						
					</div>
					<!-- End Left Block -->
					
					<!-- Begin Right Block -->
					<div id="right">
						<?php if ($this->_tpl_vars['page'] == 'dados_login'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\dados_login.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'busca'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\busca.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'reports' && $this->_tpl_vars['type'] == 'full'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "report\\full.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'reports' && $this->_tpl_vars['type'] == 'procsel'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "report\\procsel.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
					
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel'): ?>
							<?php if ($this->_tpl_vars['status'] == 'sucesso'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Processo seletivo salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['status'] == 'erro'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro do processo seletivo.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'adminTestes'): ?>
							<?php if ($this->_tpl_vars['status'] == 'sucesso'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Teste salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['status'] == 'erro'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro do teste.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'fases'): ?>
							<?php if ($this->_tpl_vars['status'] == 'sucesso'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Fase salva com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['status'] == 'erro'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro da fase.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'entrevistas'): ?>
							<?php if ($this->_tpl_vars['status'] == 'sucesso'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Entrevista salva com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['status'] == 'erro'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro da entrevista.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'admin'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\userPanel.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>

						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'novo'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\cadastroProcSel.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\edicaoProcSel.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'fases' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\fase.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'usuarios' && $this->_tpl_vars['action'] == 'listar'): ?>
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'usuarios' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\editarLogin.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'adminTestes' && $this->_tpl_vars['action'] == 'novo'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\cadastro_teste.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'adminTestes' && $this->_tpl_vars['action'] == 'listar'): ?>
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'adminTestes' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\edicaoTeste.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'questoes' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\edicaoQuestao.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'alternativas' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\edicaoAlternativa.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'entrevistas' && $this->_tpl_vars['listar']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\table3.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'entrevistas' && ! $this->_tpl_vars['listar'] && $this->_tpl_vars['action'] == 'agendar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\agendarEntrevista.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'entrevistas' && ! $this->_tpl_vars['listar'] && $this->_tpl_vars['action'] == 'registrar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\registrarEntrevista.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'entrevistas' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\editarEntrevista.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'entrevistas' && $this->_tpl_vars['action'] == 'listar' && $this->_tpl_vars['flexigrid']): ?>
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						<?php endif; ?>
						
						
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'inscritos' && $this->_tpl_vars['flexigrid']): ?>
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'inscritos' && ! $this->_tpl_vars['flexigrid']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\table3.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'listar'): ?>
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						<?php endif; ?>
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				