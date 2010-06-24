<?php /* Smarty version 2.6.26, created on 2010-06-24 12:14:35
         compiled from forms%5Ccurriculo_candidato%5Cremover.tpl */ ?>
					<form id="cand_form" class="appnitro" action="removerConta.php" method="post">
						<h2>Tem certeza que deseja remover sua conta?</h2>
						<?php if ($this->_tpl_vars['geral_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
						<?php endif; ?>
						
						<!-- Dados Adicionais -->
						<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
						<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
						<input type="button" id="sim" value="Sim" />
						<input type="button" value="Não" onclick="window.location.replace('<?php echo $this->_config[0]['vars']['root']; ?>
candidato/');" />
						
						<div id="remover" style="display:none;">
							<li id="li_2" >
								<label class="description" for="senha_atual">Senha: </label>
								<div>
									<input id="senha_atual" name="senha_atual" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_atual_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_atual_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							<input type="submit" id="submit" value="Remover" />
						</div>
					
					</form>