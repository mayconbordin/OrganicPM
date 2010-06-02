<?php /* Smarty version 2.6.26, created on 2010-05-28 20:19:29
         compiled from forms%5Ccurriculo_candidato%5Cindex.tpl */ ?>
		<div id="tabs"> 
			<ul> 
				<li><a href="#tabs-1">Dados Pessoais</a></li> 
				<li><a href="#tabs-2">Endereço</a></li> 
				<li><a href="#tabs-3">Formação Acadêmica</a></li> 
				<li><a href="#tabs-4">Experiência Profissional</a></li> 
				<li><a href="#tabs-5">Formação Adicional</a></li> 
				<li><a href="#tabs-6">Conhecimentos</a></li> 
				<li><a href="#tabs-7">Idiomas</a></li> 
				<li><a href="#tabs-8">Referências</a></li> 
			</ul> 
			
			<!-- Begin Formulário Candidato -->
			<form id="form" class="appnitro" action="alterarCurriculo.php" method="post">
			
				<!-- Begin Dados Pessoais -->
				<div id="tabs-1"> 
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
					<input type="button" id="next" value="Próximo" />
				</div> 
				<!-- End Dados Pessoais -->
				
				<!-- Begin Endereço -->
				<div id="tabs-2"> 
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

						<li class="section_break">
								<h3>Contatos:</h3>
								<p></p>
						</li>
						
						<div id="contatos">
							<li id="li_12" >
								<label class="description" for="tipo_tel">Tipo: </label>
								<?php if ($this->_tpl_vars['contato_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['contato_erro']; ?>
</p>
								<?php endif; ?>
								<div>
								<select class="element select medium" id="tipo_tel" name="tipo_tel[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listTiposTelefone']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tip_tel']):
?>
								
									<option value="<?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
" ><?php echo $this->_tpl_vars['tip_tel']['TIP_TEL_TIPO']; ?>
</option>
								
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
									<input id="ddd" name="ddd[]" class="element text small" type="text" maxlength="30" value="<?php echo $this->_tpl_vars['ddd']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_10" >
								<label class="description" for="numero_tel">Número: </label>
								<div>
									<input id="numero_tel" name="numero_tel[]" class="element text medium" type="text" maxlength="30" value="<?php echo $this->_tpl_vars['numero_tel']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>
							<input name="telefone_cod[]" type="hidden" value="" />
							<input id="save" type="button" value="Salvar" />
							<input id="cancel" type="button" value="Cancelar" />
							<input id="clear" type="button" value="Limpar" /><br /><br />
						</div>
					</ul>

					<input id="add" type="button" value="Adicionar Contato" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Tipo</th> 
								<th>DDD</th> 
								<th>Número</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['contatos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['contato']):
?>
							<tr id="contatos_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['contato']['TIP_TEL_TIPO']; ?>
<input class="contatos_0" name="tipo_tel[]" type="hidden" value="<?php echo $this->_tpl_vars['contato']['TIP_TEL_TIPO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['contato']['AREA']; ?>
<input class="contatos_1" name="ddd[]" type="hidden" value="<?php echo $this->_tpl_vars['contato']['AREA']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['contato']['NUMERO']; ?>
<input class="contatos_2" name="numero_tel[]" type="hidden" value="<?php echo $this->_tpl_vars['contato']['NUMERO']; ?>
" /></td>
								<td>
									<input name="telefone_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['contato']['TELEFONE_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div>
				<!-- End Endereço -->
				
				<!-- Begin Formações Acadêmicas -->
				<div id="tabs-3"> 
					<?php if ($this->_tpl_vars['formacao_academica_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['formacao_academica_erro']; ?>
</p>
					<?php endif; ?>
					<div id="form_acad">
						<ul>
							<li id="li_5" >
								<label class="description" for="curso">Curso: </label>
								<div>
									<select id="curso" name="curso[]"> 
										<option value=""></option>
										<?php $_from = $this->_tpl_vars['listCursos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['curso_form']):
?>
										<option value="<?php echo $this->_tpl_vars['curso_form']['CUR_FOR_COD']; ?>
"><?php echo $this->_tpl_vars['curso_form']['NOME']; ?>
</option>
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
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
									<select id="nivel" name="nivel[]"> 
										<option value=""></option>
										<?php $_from = $this->_tpl_vars['listNiveis']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['niv']):
?>
										<option value="<?php echo $this->_tpl_vars['niv']['NIV_FOR_COD']; ?>
"><?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
</option>
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="acad_data_inicio">Data de Início: </label>
								<div>
									<input name="acad_data_inicio[]" type="text" id="acad_data_inicio" value="<?php echo $this->_tpl_vars['acad_data_inicio']; ?>
" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_3" >
								<label class="description" for="acad_data_fim">Data de Término: </label>
								<div>
									<input name="acad_data_fim[]" type="text" id="acad_data_fim" value="<?php echo $this->_tpl_vars['acad_data_fim']; ?>
" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_7" >
								<label class="description" for="instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="instituicao" name="instituicao[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listInstituicoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['instit']):
?>
									<option value="<?php echo $this->_tpl_vars['instit']['INS_ENS_COD']; ?>
"><?php echo $this->_tpl_vars['instit']['NOME']; ?>
</option>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
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
								<select class="element select medium" id="andamento" name="andamento[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listAndamento']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['and']):
?>
									<option value="<?php echo $this->_tpl_vars['and']['AND_CUR_COD']; ?>
"><?php echo $this->_tpl_vars['and']['STATUS']; ?>
</option>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input name="for_aca_cod[]" type="hidden" value="" />
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
				
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Nivel</th> 
								<th>Curso</th> 
								<th>Data Inicio</th> 
								<th>Data Fim</th> 
								<th>Instituição</th> 
								<th>Andamento</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['formAcademicas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['formAcad']):
?>
							<tr id="form_acad_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['formAcad']['NIVEL']; ?>
<input class="formAcad_0" name="nivel[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['NIV_FOR_COD']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['formAcad']['CURSO']; ?>
<input class="formAcad_1" name="curso[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['CUR_FOR_COD']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['formAcad']['DATA_INICIO']; ?>
<input class="formAcad_2" name="acad_data_inicio[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['DATA_INICIO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['formAcad']['DATA_FIM']; ?>
<input class="formAcad_3" name="acad_data_fim[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['DATA_FIM']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['formAcad']['NOME']; ?>
<input class="formAcad_4" name="instituicao[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['INS_ENS_COD']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['formAcad']['STATUS']; ?>
<input class="formAcad_5" name="andamento[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['AND_CUR_COD']; ?>
" /></td>
								<td>
									<input name="for_aca_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['formAcad']['FOR_ACA_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div> 
				<!-- End Formações Acadêmicas -->
				
				<!-- Begin Experiência Profissional -->
				<div id="tabs-4">
					<?php if ($this->_tpl_vars['experiencia_profissional_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['experiencia_profissional_erro']; ?>
</p>
					<?php endif; ?>
					<div id="exp_prof">
						<ul>
							<li id="li_1" >
								<label class="description" for="empresa">Empresa: </label>
								<div>
									<input id="empresa" name="empresa[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['empresa']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="funcao">Função: </label>
								<div>
									<input id="funcao" name="funcao[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['funcao']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="atribuicoes">Atribuições: </label>
								<div>
									<input id="atribuicoes" name="atribuicoes[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['atribuicoes']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="exp_data_inicio">Data de Início: </label>
								<div>
									<input id="exp_data_inicio" name="exp_data_inicio[]" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['exp_data_inicio']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="exp_data_fim">Data de Término: </label>
								<div>
									<input id="exp_data_fim" name="exp_data_fim[]" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['exp_data_fim']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="setor">Setor: </label>
								<div>
								<select class="element select medium" id="setor" name="setor[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listSetores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['set']):
?>
									<option value="<?php echo $this->_tpl_vars['set']['EXP_SET_COD']; ?>
"><?php echo $this->_tpl_vars['set']['SETOR']; ?>
</option>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>								
						</ul>
						<input name="experiencia_cod[]" type="hidden" value="" />
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Empresa</th> 
								<th>Função</th> 
								<th>Atribuições</th> 
								<th>Data de Início</th> 
								<th>Data de Término</th> 
								<th>Setor</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['expProfissionais']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['exp']):
?>
							<tr id="exper_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['exp']['EMPRESA']; ?>
<input class="exp_0" name="empresa[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['EMPRESA']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['exp']['FUNCAO']; ?>
<input class="exp_1" name="funcao[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['FUNCAO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['exp']['ATRIBUICOES']; ?>
<input class="exp_2" name="atribuicoes[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['ATRIBUICOES']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['exp']['DATA_INICIO']; ?>
<input class="exp_3" name="exp_data_inicio[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['DATA_INICIO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['exp']['DATA_FIM']; ?>
<input class="exp_4" name="exp_data_fim[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['DATA_FIM']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['exp']['SETOR']; ?>
<input class="exp_5" name="setor[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['EXP_SET_COD']; ?>
" /></td>
								<td>
									<input name="experiencia_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['exp']['EXPERIENCIA_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Experiência Profissional -->
				
				<!-- Begin Formação Adicional -->
				<div id="tabs-5"> 
					<?php if ($this->_tpl_vars['formacao_adicional_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['formacao_adicional_erro']; ?>
</p>
					<?php endif; ?>
					<div id="form_adic">
						<ul>
							<li id="li_1" >
								<label class="description" for="tipo">Tipo: </label>
								<div>
									<input id="tipo" name="tipo[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['tipo']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="adic_curso">Curso: </label>
								<div>
									<input id="adic_curso" name="adic_curso[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_curso']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="adic_data_inicio">Data de Início: </label>
								<div>
									<input id="adic_data_inicio" name="adic_data_inicio[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_data_inicio']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="adic_data_fim">Data de Fim: </label>
								<div>
									<input id="adic_data_fim" name="adic_data_fim[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['adic_data_fim']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="carga_horaria">Carga Horária: </label>
								<div>
									<input id="carga_horaria" name="carga_horaria[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['carga_horaria']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="adic_instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="adic_instituicao" name="adic_instituicao[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listInstituicoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['instit']):
?>
									<option value="<?php echo $this->_tpl_vars['instit']['INS_ENS_COD']; ?>
"><?php echo $this->_tpl_vars['instit']['NOME']; ?>
</option>
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
						</ul>
						<input name="for_adi_cod[]" type="hidden" value="" />
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Tipo</th> 
								<th>Curso</th> 
								<th>Data de Início</th> 
								<th>Data de Término</th> 
								<th>Carga Horária</th> 
								<th>Instituição</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['forAdicionais']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['forAd']):
?>
							<tr id="forAdic_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['forAd']['TIPO']; ?>
<input class="form_adic_0" name="tipo[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['TIPO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['forAd']['NOME']; ?>
<input class="form_adic_1" name="adic_curso[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['NOME']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['forAd']['DATA_INICIO']; ?>
<input class="form_adic_2" name="adic_data_inicio[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['DATA_INICIO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['forAd']['DATA_FIM']; ?>
<input class="form_adic_3" name="adic_data_fim[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['DATA_FIM']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['forAd']['CARGA_HORARIA']; ?>
<input class="form_adic_4" name="carga_horaria[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['CARGA_HORARIA']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['forAd']['INSTITUICAO']; ?>
<input class="form_adic_5" name="adic_instituicao[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['INS_ENS_COD']; ?>
" /></td>
								<td>
									<input name="for_adi_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['forAd']['FOR_ADI_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Formação Adicional -->
			
				<!-- Begin Conhecimentos -->
				<div id="tabs-6"> 
					<?php if ($this->_tpl_vars['conhecimento_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['conhecimento_erro']; ?>
</p>
					<?php endif; ?>
					<div id="conhec">
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['grupo_conhecimento']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['conhecimento']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">Proficiência: </label>
								<div>
									<input id="proficiencia" name="proficiencia[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['proficiencia']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input name="conhecimento_cod[]" type="hidden" value="" />
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Grupo de Conhecimento</th> 
								<th>Conhecimento</th> 
								<th>Proficiência</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['conhecimentos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['conhec']):
?>
							<tr id="conh_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['conhec']['GRUPO']; ?>
<input class="conhec_0" name="grupo_conhecimento[]" type="hidden" value="<?php echo $this->_tpl_vars['conhec']['GRUPO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['conhec']['DESCRICAO']; ?>
<input class="conhec_1" name="conhecimento[]" type="hidden" value="<?php echo $this->_tpl_vars['conhec']['DESCRICAO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['conhec']['PROFICIENCIA']; ?>
<input class="conhec_2" name="proficiencia[]" type="hidden" value="<?php echo $this->_tpl_vars['conhec']['PROFICIENCIA']; ?>
" /></td>
								<td>
									<input name="conhecimento_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['conhec']['CONHECIMENTO_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Conhecimentos -->
				
				<!-- Begin Idiomas -->
				<div id="tabs-7"> 
					<?php if ($this->_tpl_vars['idioma_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['idioma_erro']; ?>
</p>
					<?php endif; ?>
					<div id="idioma_tab">
						<ul>
							<li id="li_1" >
								<label class="description" for="idioma">Idioma: </label>
								<div>
								<select class="element select medium" id="idioma" name="idioma[]"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listIdiomas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['idiom']):
?>
									<option value="<?php echo $this->_tpl_vars['idiom']['IDIOMA_COD']; ?>
"><?php echo $this->_tpl_vars['idiom']['IDIOMA']; ?>
</option>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="leitura">Leitura: </label>
								<div>
								<select class="element select small" id="leitura" name="leitura[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="conversacao">Conversação: </label>
								<div>
								<select class="element select small" id="conversacao" name="conversacao[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="escrita">Escrita: </label>
								<div>
								<select class="element select small" id="escrita" name="escrita[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Idioma</th> 
								<th>Leitura</th> 
								<th>Conversação</th> 
								<th>Escrita</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['idiomas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['idiom']):
?>
							<tr id="idiom_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['idiom']['IDIOMA']; ?>
<input class="idio_0" name="idioma[]" type="hidden" value="<?php echo $this->_tpl_vars['idiom']['IDIOMA_COD']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['idiom']['ESCRITA']; ?>
<input class="idio_1" name="escrita[]" type="hidden" value="<?php echo $this->_tpl_vars['idiom']['ESCRITA']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['idiom']['CONVERSACAO']; ?>
<input class="idio_2" name="conversacao[]" type="hidden" value="<?php echo $this->_tpl_vars['idiom']['CONVERSACAO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['idiom']['LEITURA']; ?>
<input class="idio_3" name="leitura[]" type="hidden" value="<?php echo $this->_tpl_vars['idiom']['LEITURA']; ?>
" /></td>
								<td>
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Idiomas -->
				
				<!-- Begin Referências -->
				<div id="tabs-8"> 
					<?php if ($this->_tpl_vars['referencia_erro']): ?>
					<p class="form_error"><?php echo $this->_tpl_vars['referencia_erro']; ?>
</p>
					<?php endif; ?>
					<div id="referencia">
						<ul>
							<li id="li_1" >
								<label class="description" for="ref_nome">Nome: </label>
								<div>
									<input id="ref_nome" name="ref_nome[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_nome']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="ref_empresa">Empresa: </label>
								<div>
									<input id="ref_empresa" name="ref_empresa[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_empresa']; ?>
"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="ref_vinculo">Vínculo: </label>
								<div>
									<input id="ref_vinculo" name="ref_vinculo[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_vinculo']; ?>
"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="ref_telefone">Telefone: </label>
								<div>
									<input id="ref_telefone" name="ref_telefone[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_telefone']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="ref_email">Email: </label>
								<div>
									<input id="ref_email" name="ref_email[]" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_email']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input name="referencia_cod[]" type="hidden" value="" />
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Nome</th> 
								<th>Empresa</th> 
								<th>Vínculo</th> 
								<th>Telefone</th> 
								<th>Email</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							<?php $_from = $this->_tpl_vars['referencias']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['ref']):
?>
							<tr id="refer_<?php echo $this->_tpl_vars['i']; ?>
">
								<td><?php echo $this->_tpl_vars['ref']['NOME']; ?>
<input class="ref_0" name="ref_nome[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['NOME']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['ref']['EMPRESA']; ?>
<input class="ref_1" name="ref_empresa[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['EMPRESA']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['ref']['VINCULO']; ?>
<input class="ref_2" name="ref_vinculo[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['VINCULO']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['ref']['FONE']; ?>
<input class="ref_3" name="ref_telefone[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['FONE']; ?>
" /></td>
								<td><?php echo $this->_tpl_vars['ref']['EMAIL']; ?>
<input class="ref_4" name="ref_email[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['EMAIL']; ?>
" /></td>
								<td>
									<input name="referencia_cod[]" type="hidden" value="<?php echo $this->_tpl_vars['ref']['REFERENCIA_COD']; ?>
" />
									<input class="edit" type="button" value="Editar" />
									<input class="delete" type="button" value="Remover" />
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
						</tbody> 
					</table> 
					
					<input type="submit" id="submit" value="Finalizar Cadastro" />
					
				</div>
				<!-- End Referências -->
				
				<!-- Dados Adicionais -->
				<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
				<input name="action" type="hidden" value="alter"/>
			
			</form>
			<!-- End Formulário Candidato -->
			
		</div>