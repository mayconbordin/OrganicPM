<?php /* Smarty version 2.6.26, created on 2010-06-10 15:36:47
         compiled from content%5Ccontent.tpl */ ?>
				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<?php if ($this->_tpl_vars['logado'] && ( $this->_tpl_vars['page'] == 'content' || $this->_tpl_vars['page'] == 'teste' || $this->_tpl_vars['page'] == 'vagas' || $this->_tpl_vars['page'] == 'selecao' || $this->_tpl_vars['page'] == 'fases' || $this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' )): ?>
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Menu</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/index.php" title="Início">Início</a></h2></li>
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Currículo</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/curriculo.php" title="">EDITAR CURRÍCULO</a></li>
									
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/dados_pessoais.php" title="">DADOS PESSOAiS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/endereco.php" title="">ENDEREÇO</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/contatos.php" title="">CONTATOS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/form_acad.php" title="">FORMAÇÃO ACADÊMICA</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/exper_prof.php" title="">EXPERIÊNCIA PROFISSIONAL</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/form_adic.php" title="">FORMAÇÃO ADICIONAL</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/conhecimentos.php" title="">CONHECIMENTOS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/idiomas.php" title="">IDIOMAS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/referencias.php" title="">REFERÊNCIAS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Seleções</h2></a>
								<ul>
									<li><a href="" title="">ANDAMENTO</a><li>
									<li><a href="" title="">TESTES</a></li>
									<li><a href="" title="">ENTREVISTAS</a></li>
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
					<?php endif; ?>
					
					<!-- Begin Right Block -->
					<div id="right">
						
						<?php if ($this->_tpl_vars['page'] == 'curriculo' && $this->_tpl_vars['status'] == 'sucesso'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Currículo salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'curriculo' && $this->_tpl_vars['status'] == 'erro'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro do currículo.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'teste' && $this->_tpl_vars['status'] == 'sucesso'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Teste concluído.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'teste' && $this->_tpl_vars['status'] == 'erro'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no seu teste.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['logado']): ?>
							<?php if ($this->_tpl_vars['page'] == 'curriculo'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\index.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'content'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\userPanel.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'dados_pessoais'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\dados_pessoais.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'endereco'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\endereco.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if (( $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' ) && $this->_tpl_vars['action'] == 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['page'] == 'vagas' && $this->_tpl_vars['action'] == 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'vagas' && $this->_tpl_vars['action'] != 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\vagas.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'fases' && $this->_tpl_vars['action'] == 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'fases' && $this->_tpl_vars['action'] != 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\fases.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'selecao' && $this->_tpl_vars['action'] == 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\table.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'selecao' && $this->_tpl_vars['action'] != 'listar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\\selecao.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['page'] == 'teste' && $this->_tpl_vars['status'] != 'sucesso'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "teste\\form.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['page'] == 'contatos' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\contatos.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'formacao_academica' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\form_acad.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'experiencia_profissional' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\exper_prof.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'formacao_adicional' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\form_adic.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'conhecimentos' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\conhecimentos.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'idiomas' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\idiomas.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'referencias' && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' )): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\referencias.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php else: ?>
							<?php if ($this->_tpl_vars['page'] == 'cadastro'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\cadastro_candidato\index.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php else: ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content/naoLogado.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
						<?php endif; ?>
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				