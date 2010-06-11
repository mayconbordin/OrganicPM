<?php /* Smarty version 2.6.26, created on 2010-06-09 09:58:23
         compiled from forms%5Ccurriculo_candidato%5Ccontatos.tpl */ ?>
							<form id="cand_form" class="appnitro" action="gravarContatos.php" method="post">
								<h2>Contatos</h2>
								<ul>
									<li id="li_12" >
										<label class="description" for="tipo_tel">Tipo: </label>
										<?php if ($this->_tpl_vars['contato_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['contato_erro']; ?>
</p>
										<?php endif; ?>
										<div>
										<select class="element select medium" id="tipo_tel" name="tipo_tel"> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listTiposTelefone']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tip_tel']):
?>
											
											<?php if ($this->_tpl_vars['tipo_tel'] == $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']): ?>
											<option value="<?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
" selected="selected"><?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
"><?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
</option>
											<?php endif; ?>
											
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['tipo_tel_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['tipo_tel_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
		
									<li id="li_9" >
										<label class="description" for="ddd">DDD: </label>
										<div>
											<input id="ddd" name="ddd" class="element text small" type="text" maxlength="30" value="<?php echo $this->_tpl_vars['ddd']; ?>
"/> 
											<p class="error"></p>
										</div> 
									</li>
		
									<li id="li_10" >
										<label class="description" for="numero_tel">Número: </label>
										<div>
											<input id="numero_tel" name="numero_tel" class="element text medium" type="text" maxlength="30" value="<?php echo $this->_tpl_vars['numero_tel']; ?>
"/> 
											<p class="error"></p>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
									<input name="contato_cod" type="hidden" value="<?php echo $this->_tpl_vars['contato_cod']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>