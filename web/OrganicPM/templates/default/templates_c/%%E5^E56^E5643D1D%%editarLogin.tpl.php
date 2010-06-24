<?php /* Smarty version 2.6.26, created on 2010-06-24 11:19:32
         compiled from admin%5CeditarLogin.tpl */ ?>
					<form id="cand_form" class="appnitro" action="userFunctions.php" method="post">
						<h2>Usuário</h2>
						<?php if ($this->_tpl_vars['geral_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
						<?php endif; ?>
						<ul>
							<li id="li_1" >
								<label class="description" for="usuario">Usuário: </label>
								<div>
									<input id="usuario" name="usuario" class="element text medium" type="text" maxlength="60" value="<?php echo $this->_tpl_vars['usuario']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['usuario_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['usuario_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_6" >
								<label class="description" for="nivel_acesso">Nível de Acesso: </label>
								<div>
									<div>
										<select class="element select small" id="nivel_acesso" name="nivel_acesso"> 
											<option value="" selected="selected"></option>
											
											<?php $_from = $this->_tpl_vars['niveis']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['niv']):
?>
												
											<?php if ($this->_tpl_vars['nivel_acesso'] == $this->_tpl_vars['niv']['NIVEL']): ?>
											<option value="<?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
" selected="selected"><?php echo $this->_tpl_vars['niv']['ALIAS']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
"><?php echo $this->_tpl_vars['niv']['ALIAS']; ?>
</option>
											<?php endif; ?>
												
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['nivel_acesso_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['nivel_acesso_erro']; ?>
</p>
										<?php endif; ?>
									</div> 

								</div> 
							</li>
							
							<li id="li_6" >
								<label class="description" for="status">Status: </label>
								<div>
									<div>
										<select class="element select small" id="status" name="status"> 
											<option value=""></option>
											
											<?php if ($this->_tpl_vars['status'] == 'active'): ?>
											<option value="active" selected="selected">Ativo</option>
											<?php else: ?>
											<option value="active">Ativo</option>
											<?php endif; ?>
											<?php if ($this->_tpl_vars['status'] == 'disabled'): ?>
											<option value="disabled" selected="selected">Desabilitado</option>
											<?php else: ?>
											<option value="disabled">Desabilitado</option>
											<?php endif; ?>
											<?php if ($this->_tpl_vars['status'] == 'blocked'): ?>
											<option value="blocked" selected="selected">Bloqueado</option>
											<?php else: ?>	
											<option value="blocked">Bloqueado</option>
											<?php endif; ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['status_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['status_erro']; ?>
</p>
										<?php endif; ?>
									</div> 

								</div> 
							</li>
							
							<li id="li_3" >
								<label class="description" for="senha">Nova Senha: </label>
								<div>
									<input id="senha" name="senha" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_4" >
								<label class="description" for="senha_conf">Confirme a Nova Senha: </label>
								<div>
									<input id="senha_conf" name="senha_conf" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_conf_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_conf_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>