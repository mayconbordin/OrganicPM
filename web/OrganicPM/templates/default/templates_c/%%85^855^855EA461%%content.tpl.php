<?php /* Smarty version 2.6.26, created on 2010-06-24 12:39:36
         compiled from content%5Ccontent.tpl */ ?>
				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<?php if ($this->_tpl_vars['logado'] && ( $this->_tpl_vars['page'] == 'content' || $this->_tpl_vars['page'] == 'dados_login' || $this->_tpl_vars['page'] == 'teste' || $this->_tpl_vars['page'] == 'vagas' || $this->_tpl_vars['page'] == 'selecao' || $this->_tpl_vars['page'] == 'fases' || $this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' )): ?>
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Menu</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/index.php" title="In�cio">In�cio</a></h2></li>
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Curr�culo</h2></a>
								<ul>									
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/dados_pessoais.php" title="">DADOS PESSOAiS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/endereco.php" title="">ENDERE�O</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/contatos.php" title="">CONTATOS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/form_acad.php" title="">FORMA��O ACAD�MICA</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/exper_prof.php" title="">EXPERI�NCIA PROFISSIONAL</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/form_adic.php" title="">FORMA��O ADICIONAL</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/conhecimentos.php" title="">CONHECIMENTOS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/idiomas.php" title="">IDIOMAS</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/referencias.php" title="">REFER�NCIAS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Sele��es</h2></a>
								<ul>
									<li><a href="" title="">ANDAMENTO</a><li>
									<li><a href="" title="">TESTES</a></li>
									<li><a href="" title="">ENTREVISTAS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Cadastro</h2></a>
								<ul>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/dados_login.php?action=editar" title="Editar Login">EDITAR LOGIN</a></li>
									<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/dados_login.php?action=remover" title="Remover">REMOVER</a></li>
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
					
					
						<?php if ($this->_tpl_vars['action'] == 'listar' && $this->_tpl_vars['status'] == 'sucesso'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Registro removido com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['action'] == 'listar' && $this->_tpl_vars['status'] == 'erro'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "N�o foi poss�vel remover o registro.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						
						<?php if ($this->_tpl_vars['page'] == 'cadastro' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Curr�culo salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'cadastro' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro do curr�culo.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'curriculo' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Curr�culo salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'curriculo' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no cadastro do curr�culo.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'teste' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Teste conclu�do.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'teste' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no seu teste.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'endereco' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Endere�o salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'endereco' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros no seu endere�o.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_pessoais' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Dados pessoais salvos com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_pessoais' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos seus dados pessoais.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'contatos' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Contato salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'contatos' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados de contato.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'formacao_academica' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Forma��o acad�mica salva com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'formacao_academica' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados da forma��o acad�mica.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'experiencia_profissional' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Experi�ncia profissional salva com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'experiencia_profissional' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados da experi�ncia profissional.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'formacao_adicional' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Forma��o adicional salva com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'formacao_adicional' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados da forma��o adicional.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'conhecimentos' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Conhecimento salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'conhecimentos' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados do conhecimento.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'idiomas' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Idioma salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'idiomas' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados do idioma.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'referencias' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Refer�ncia salvo com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'referencias' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] != 'listar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados da refer�ncia.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Dados de login salvos com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] == 'editar'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Existem erros nos dados do login.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['status'] == 'sucesso' && $this->_tpl_vars['action'] == 'remover'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => "Conta removida com sucesso.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['status'] == 'erro' && $this->_tpl_vars['action'] == 'remover'): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Houve um erro ao remover sua conta.",'msgVis' => 'show')));
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
							<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['action'] == 'editar'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\dados_login.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							<?php if ($this->_tpl_vars['page'] == 'dados_login' && $this->_tpl_vars['action'] == 'remover'): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\\remover.tpl", 'smarty_include_vars' => array()));
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
				