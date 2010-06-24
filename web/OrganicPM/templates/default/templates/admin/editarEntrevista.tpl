							<form id="cand_form" class="appnitro" action="entrevistaFunc.php" method="post">
								<h2>Editar Entrevista</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<table cellspacing="1" class="tablesorter"> 
									<tbody>
										<tr>
											<td>Candidato:</td>
											<td>{$nome}</td>
										</tr>
										<tr>
											<td>Processo Seletivo:</td>
											<td>{$descricao}</td>
										</tr>
										<tr>
											<td>Data de Início:</td>
											<td>{$data_inicio}</td>
										</tr>
										<tr>
											<td>Data de Término:</td>
											<td>{$data_fim}</td>
										</tr>
									</tbody>
								</table>
								<ul>
									<li id="li_1" >
										<label class="description" for="data_efetiva">Data em que a entrevista ocorreu: </label>
										<div>
											<input id="data_efetiva" name="data_efetiva" type="text"  value="{$data_efetiva}" />
											<p class="error"></p>
											{if $data_efetiva_erro}
											<p class="form_error">{$data_efetiva_erro}</p>
											{/if}
										</div> 
									</li>
									<li id="li_5" >
										<label class="description" for="data_agendada">Data que estava agendada: </label>
										<div>
											<input id="data_agendada" name="data_agendada" type="text"  value="{$data_agendada}" />
											<p class="error"></p>
											{if $data_agendada_erro}
											<p class="form_error">{$data_agendada_erro}</p>
											{/if}
										</div> 
									</li>
									<li id="li_2" >
										<label class="description" for="entrevistador">Entrevistador: </label>
										<div>
											<input id="entrevistador" name="entrevistador" type="text"  value="{$entrevistador}" maxlength="80" />
											<p class="error"></p>
											{if $entrevistador_erro}
											<p class="form_error">{$entrevistador_erro}</p>
											{/if}
										</div> 
									</li>
									<li id="li_3" >
										<label class="description" for="comentario">Comentários: </label>
										<div>
											<textarea id="comentario" name="comentario" class="element textarea small">{$comentario}</textarea>
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											{if $comentario_erro}
											<p class="form_error">{$comentario_erro}</p>
											{/if}
										</div> 
									</li>
									<li id="li_4" >
										<label class="description" for="status">Status: </label>
										<div>
										<select class="element select medium" id="status" name="status"> 
											<option value=""></option>
											{if $status_entrev == "classificado"}
											<option value="classificado" selected="selected">Classificado</option>
											{else}
											<option value="classificado">Classificado</option>
											{/if}
											
											{if $status_entrev == "desclassificado"}
											<option value="desclassificado" selected="selected">Desclassificado</option>
											{else}
											<option value="desclassificado">Desclassificado</option>
											{/if}
											
										</select>
										<p class="error"></p>
										{if $status_erro}
										<p class="form_error">{$status_erro}</p>
										{/if}
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="fase_cod" type="hidden" value="{$fase_cod}"/>
									<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
									<input name="pro_sel_cod" type="hidden" value="{$pro_sel_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>