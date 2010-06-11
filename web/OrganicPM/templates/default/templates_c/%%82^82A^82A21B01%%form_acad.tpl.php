<?php /* Smarty version 2.6.26, created on 2010-06-11 10:28:38
         compiled from forms%5Ccurriculo_candidato%5Cform_acad.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarFormAcad.php" method="post">
						<h2>Formações Acadêmicas</h2>
						<?php if ($this->_tpl_vars['geral_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
						<?php endif; ?>
						<ul>
							<li id="li_5" >
								<label class="description" for="curso">Curso: </label>
								<div>
									<select id="curso" name="curso"> 
										<option value=""></option>
										<?php $_from = $this->_tpl_vars['listCursos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['curso_form']):
?>
										
										<?php if ($this->_tpl_vars['curso'] == $this->_tpl_vars['curso_form']['CUR_FOR_COD']): ?>
										<option value="<?php echo $this->_tpl_vars['curso_form']['CUR_FOR_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['curso_form']['NOME']; ?>
</option>
										<?php else: ?>
										<option value="<?php echo $this->_tpl_vars['curso_form']['CUR_FOR_COD']; ?>
"><?php echo $this->_tpl_vars['curso_form']['NOME']; ?>
</option>
										<?php endif; ?>
										
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
									<?php if ($this->_tpl_vars['curso_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['curso_erro']; ?>
</p>
									<?php endif; ?>
									<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_1" >
								<label class="description" for="outro_curso">Outro Curso: </label>
								<div>
									<input id="outro_curso" name="outro_curso" type="text" maxlength="60" value=""/>
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="nivel">Nível: </label>
								<div>
									<select id="nivel" name="nivel"> 
										<option value=""></option>
										<?php $_from = $this->_tpl_vars['listNiveis']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['niv']):
?>
										
										<?php if ($this->_tpl_vars['nivel'] == $this->_tpl_vars['niv']['NIV_FOR_COD']): ?>
										<option value="<?php echo $this->_tpl_vars['niv']['NIV_FOR_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
</option>
										<?php else: ?>
										<option value="<?php echo $this->_tpl_vars['niv']['NIV_FOR_COD']; ?>
"><?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
</option>
										<?php endif; ?>
										
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
									<?php if ($this->_tpl_vars['nivel_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['nivel_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="acad_data_inicio">Data de Início: </label>
								<div>
									<input name="acad_data_inicio" type="text" id="acad_data_inicio" value="<?php echo $this->_tpl_vars['acad_data_inicio']; ?>
" />
									<p class="error"></p>
									<?php if ($this->_tpl_vars['acad_data_inicio_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['acad_data_inicio_erro']; ?>
</p>
									<?php endif; ?>
								</div>
							</li>

							<li id="li_3" >
								<label class="description" for="acad_data_fim">Data de Término: </label>
								<div>
									<input name="acad_data_fim" type="text" id="acad_data_fim" value="<?php echo $this->_tpl_vars['acad_data_fim']; ?>
" />
									<p class="error"></p>
									<?php if ($this->_tpl_vars['acad_data_fim_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['acad_data_fim_erro']; ?>
</p>
									<?php endif; ?>
								</div>
							</li>

							<li id="li_7" >
								<label class="description" for="instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="instituicao" name="instituicao"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listInstituicoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['instit']):
?>
									
									<?php if ($this->_tpl_vars['instituicao'] == $this->_tpl_vars['instit']['INS_ENS_COD']): ?>
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
								<?php if ($this->_tpl_vars['instituicao_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['instituicao_erro']; ?>
</p>
								<?php endif; ?>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="outra_instituicao" name="outra_instituicao" class="element text medium" type="text" maxlength="200" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_8" >
								<label class="description" for="andamento">Andamento do Curso: </label>
								<div>
								<select class="element select medium" id="andamento" name="andamento"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listAndamento']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['and']):
?>
									<?php if ($this->_tpl_vars['andamento'] == $this->_tpl_vars['and']['AND_CUR_COD']): ?>
									<option value="<?php echo $this->_tpl_vars['and']['AND_CUR_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['and']['STATUS']; ?>
</option>
									<?php else: ?>
									<option value="<?php echo $this->_tpl_vars['and']['AND_CUR_COD']; ?>
"><?php echo $this->_tpl_vars['and']['STATUS']; ?>
</option>
									<?php endif; ?>
									
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								<?php if ($this->_tpl_vars['andamento_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['andamento_erro']; ?>
</p>
								<?php endif; ?>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="form_acad_cod" type="hidden" value="<?php echo $this->_tpl_vars['form_acad_cod']; ?>
"/>
							<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>