<?php /* Smarty version 2.6.26, created on 2010-06-09 03:57:07
         compiled from forms%5Ccurriculo_candidato%5Cendereco.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarEndereco.php" method="post">
						<h2>Endereço</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="endereco">Endereço: </label>
								<div>
									<input id="endereco" name="endereco" class="element text medium" type="text" maxlength="500" value="<?php echo $this->_tpl_vars['endereco']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['endereco_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['endereco_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_2" >
								<label class="description" for="numero">Número: </label>
								<div>
									<input id="numero" name="numero" class="element text small" type="text" maxlength="38" value="<?php echo $this->_tpl_vars['numero']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['numero_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['numero_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_3" >
								<label class="description" for="complemento">Complemento: </label>
								<div>
									<input id="complemento" name="complemento" class="element text small" type="text" maxlength="100" value="<?php echo $this->_tpl_vars['complemento']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['complemento_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['complemento_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_4" >
								<label class="description" for="cep">CEP: </label>
								<div>
									<input id="cep" name="cep" class="element text medium" type="text" maxlength="8" value="<?php echo $this->_tpl_vars['cep']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['cep_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['cep_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_5" >
								<label class="description" for="bairro">Bairro: </label>
								<div>
									<input id="bairro" name="bairro" class="element text medium" type="text" maxlength="100" value="<?php echo $this->_tpl_vars['bairro']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['bairro_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['bairro_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_6" >
								<label class="description" for="cidade">Cidade: </label>
								<div>
									<input id="cidade" name="cidade" class="element text medium" type="text" maxlength="200" value="<?php echo $this->_tpl_vars['cidade']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['cidade_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['cidade_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
	
							<li id="li_11" >
								<label class="description" for="uf">UF: </label>
								<?php if ($this->_tpl_vars['uf_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['uf_erro']; ?>
</p>
								<?php endif; ?>
								<div>
								<select class="element select small" id="uf" name="uf"> 
									<option value="" selected="selected"></option>
									
									<?php $_from = $this->_tpl_vars['listUF']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['uni_fed']):
?>
										
									<?php if ($this->_tpl_vars['uf'] == $this->_tpl_vars['uni_fed']['UNI_FED_COD']): ?>
									<option value="<?php echo $this->_tpl_vars['uni_fed']['UNI_FED_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['uni_fed']['NOME']; ?>
</option>
									<?php else: ?>
									<option value="<?php echo $this->_tpl_vars['uni_fed']['UNI_FED_COD']; ?>
"><?php echo $this->_tpl_vars['uni_fed']['NOME']; ?>
</option>
									<?php endif; ?>
										
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>
	
							<li id="li_7" >
								<label class="description" for="pais">País: </label>
								<div>
									<input id="pais" name="pais" class="element text medium" type="text" maxlength="100" value="<?php echo $this->_tpl_vars['pais']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['pais_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['pais_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="action" type="hidden" value="edit"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>