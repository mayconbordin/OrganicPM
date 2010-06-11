<?php /* Smarty version 2.6.26, created on 2010-06-08 00:46:23
         compiled from admin%5Ccontent.tpl */ ?>
				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Administração</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><a class="item_title" href="" title=""><h2>Candidatos</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/curriculo.php" title="">BUSCAR CURRÍCULOS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Processo Seletivos</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=listar" title="">EM ANDAMENTO</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
admin/procseletivo.php?action=pesquisar" title="">PESQUISAR</a></li>
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
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Login</h2></a>
								<ul>
									<li><a href="" title="">EDITAR</a></li>
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

						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'novo'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\cadastroProcSel.tpl", 'smarty_include_vars' => array()));
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
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				