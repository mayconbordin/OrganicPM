<?php /* Smarty version 2.6.26, created on 2010-06-07 10:38:37
         compiled from forms%5Ccurriculo_candidato%5Cform_adic.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Formação Adicional</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="tipo">Tipo: </label>
								<div>
									<input id="tipo" name="tipo" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['tipo']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="adic_curso">Curso: </label>
								<div>
									<input id="adic_curso" name="adic_curso" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_curso']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="adic_data_inicio">Data de Início: </label>
								<div>
									<input id="adic_data_inicio" name="adic_data_inicio" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_data_inicio']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="adic_data_fim">Data de Fim: </label>
								<div>
									<input id="adic_data_fim" name="adic_data_fim" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_data_fim']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="carga_horaria">Carga Horária: </label>
								<div>
									<input id="carga_horaria" name="carga_horaria" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['carga_horaria']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="adic_instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="adic_instituicao" name="adic_instituicao"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listInstituicoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['instit']):
?>
									<?php if ($this->_tpl_vars['adic_instituicao'] == $this->_tpl_vars['instit']['INS_ENS_COD']): ?>
									<option value="<?php echo $this->_tpl_vars['instit']['INS_ENS_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['instit']['NOME']; ?>
</option>
									<?php else: ?>
									<option value="<?php echo $this->_tpl_vars['instit']['INS_ENS_COD']; ?>
"><?php echo $this->_tpl_vars['instit']['NOME']; ?>
</option>
									<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="adic_outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="adic_outra_instituicao" name="adic_outra_instituicao" class="element text medium" type="text" maxlength="30" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="form_adic_cod" type="hidden" value="<?php echo $this->_tpl_vars['form_adic_cod']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />	
						</ul>
					</form>