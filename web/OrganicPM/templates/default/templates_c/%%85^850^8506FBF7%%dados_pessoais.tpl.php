<?php /* Smarty version 2.6.26, created on 2010-06-05 21:03:11
         compiled from forms/curriculo_candidato/dados_pessoais.tpl */ ?>
					<form id="form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<ul>
							<li id="li_1" >
								<label class="description" for="nome">Nome: </label>
								<div>
									<input id="nome" name="nome" class="element text medium" type="text" maxlength="200" value="<?php echo $this->_tpl_vars['nome']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['nome_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['nome_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_2" >
								<label class="description" for="email">Email Primário: </label>
								<div>
									<input id="email" name="email" class="element text medium" type="text" maxlength="100" value="<?php echo $this->_tpl_vars['email']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['email_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['email_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="email_sec">Email Secundário: </label>
								<div>
									<input id="email_sec" name="email_sec" class="element text medium" type="text" maxlength="100" value="<?php echo $this->_tpl_vars['email_sec']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['email_sec_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['email_sec_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_3" >
								<label class="description" for="cpf">CPF: </label>
								<div>
									<input id="cpf" name="cpf" class="element text medium" type="text" maxlength="11" value="<?php echo $this->_tpl_vars['cpf']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['cpf_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['cpf_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_4" >
								<label class="description" for="data_nascimento">Data de Nascimento: </label>
								<div>
									<input name="data_nascimento" type="text" id="data_nascimento" value="<?php echo $this->_tpl_vars['data_nascimento']; ?>
" />	
									<p class="error"></p>
									<?php if ($this->_tpl_vars['data_nascimento_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['data_nascimento_erro']; ?>
</p>
									<?php endif; ?>
								</div>
							</li>
	
							<li id="li_5" >
								<label class="description" for="naturalidade">Naturalidade: </label>
								<div>
									<input id="naturalidade" name="naturalidade" class="element text medium" type="text" maxlength="50" value="<?php echo $this->_tpl_vars['naturalidade']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['naturalidade_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['naturalidade_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_6" >
								<label class="description" for="sexo">Sexo: </label>
								<p class="error"></p>
								<?php if ($this->_tpl_vars['sexo_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['sexo_erro']; ?>
</p>
								<?php endif; ?>
								<span>
									<input id="element_6_1" name="sexo" class="element radio" type="radio" value="masculino" <?php if ($this->_tpl_vars['sexo'] == 'masculino'): ?>checked="checked"<?php endif; ?> />
									<label class="choice" for="element_6_1">Masculino</label>
									<input id="element_6_2" name="sexo" class="element radio" type="radio" value="feminino" <?php if ($this->_tpl_vars['sexo'] == 'feminino'): ?>checked="checked"<?php endif; ?> />
									<label class="choice" for="element_6_2">Feminino</label>
								</span> 
							</li>
							
							<li id="li_8" >
									<label class="description" for="estado_civil">Estado Civil: </label>
									<div>
									<select class="element select medium" id="estado_civil" name="estado_civil"> 
										<option value=""></option>
										<?php $_from = $this->_tpl_vars['listEstadosCivis']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['est_civ']):
?>
										
										<?php if ($this->_tpl_vars['estado_civil'] == $this->_tpl_vars['est_civ']['EST_CIV_COD']): ?>
										<option value="<?php echo $this->_tpl_vars['est_civ']['EST_CIV_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['est_civ']['DESCRICAO']; ?>
</option>
										<?php else: ?>
										<option value="<?php echo $this->_tpl_vars['est_civ']['EST_CIV_COD']; ?>
"><?php echo $this->_tpl_vars['est_civ']['DESCRICAO']; ?>
</option>
										<?php endif; ?>
										
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
									<?php if ($this->_tpl_vars['estado_civil_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['estado_civil_erro']; ?>
</p>
									<?php endif; ?>
									</div> 
								</li>
						</ul>
					</form>