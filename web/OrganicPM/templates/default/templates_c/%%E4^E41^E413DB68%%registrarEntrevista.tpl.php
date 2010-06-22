<?php /* Smarty version 2.6.26, created on 2010-06-18 23:43:06
         compiled from admin%5CregistrarEntrevista.tpl */ ?>
							<form id="cand_form" class="appnitro" action="entrevistaFunc.php" method="post">
								<h2>Registrar Entrevista</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<table cellspacing="1" class="tablesorter"> 
									<tbody>
										<tr>
											<td>Candidato:</td>
											<td><?php echo $this->_tpl_vars['nome']; ?>
</td>
										</tr>
										<tr>
											<td>Processo Seletivo:</td>
											<td><?php echo $this->_tpl_vars['descricao']; ?>
</td>
										</tr>
										<tr>
											<td>Data de Início:</td>
											<td><?php echo $this->_tpl_vars['data_inicio']; ?>
</td>
										</tr>
										<tr>
											<td>Data de Término:</td>
											<td><?php echo $this->_tpl_vars['data_fim']; ?>
</td>
										</tr>
										<tr>
											<td>Data Agendada:</td>
											<td><?php echo $this->_tpl_vars['data_agendada']; ?>
</td>
										</tr>
									</tbody>
								</table>
								<ul>
									<li id="li_1" >
										<label class="description" for="data_efetiva">Data da entrevista: </label>
										<div>
											<input id="data_efetiva" name="data_efetiva" type="text"  value="<?php echo $this->_tpl_vars['data_efetiva']; ?>
" />
											<p class="error"></p>
											<?php if ($this->_tpl_vars['data_efetiva_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['data_efetiva_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
									<li id="li_2" >
										<label class="description" for="entrevistador">Entrevistador: </label>
										<div>
											<input id="entrevistador" name="entrevistador" type="text"  value="<?php echo $this->_tpl_vars['entrevistador']; ?>
" maxlength="80" />
											<p class="error"></p>
											<?php if ($this->_tpl_vars['entrevistador_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['entrevistador_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
									<li id="li_3" >
										<label class="description" for="comentario">Comentários: </label>
										<div>
											<textarea id="comentario" name="comentario" class="element textarea small"><?php echo $this->_tpl_vars['comentario']; ?>
</textarea>
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['comentario_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['comentario_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
									<li id="li_4" >
										<label class="description" for="status">Status: </label>
										<div>
										<select class="element select medium" id="status" name="status"> 
											<option value=""></option>
											<?php if ($this->_tpl_vars['status'] == 'classificado'): ?>
											<option value="classificado" selected="selected">Classificado</option>
											<?php else: ?>
											<option value="classificado">Classificado</option>
											<?php endif; ?>
											
											<?php if ($this->_tpl_vars['status'] == 'desclassificado'): ?>
											<option value="desclassificado" selected="selected">Desclassificado</option>
											<?php else: ?>
											<option value="desclassificado">Desclassificado</option>
											<?php endif; ?>
											
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['status_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['status_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="fase_cod" type="hidden" value="<?php echo $this->_tpl_vars['fase_cod']; ?>
"/>
									<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
									<input name="pro_sel_cod" type="hidden" value="<?php echo $this->_tpl_vars['pro_sel_cod']; ?>
"/>
									<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>