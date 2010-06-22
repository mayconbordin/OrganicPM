							<form id="cand_form" class="appnitro" action="entrevistaFunc.php" method="post">
								<h2>Agendar Entrevista</h2>
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
										<label class="description" for="data_agendada">Data agendada: </label>
										<div>
											<input id="data_agendada" name="data_agendada" type="text"  value="{$data_agendada}" />
											<p class="error"></p>
											{if $data_agendada_erro}
											<p class="form_error">{$data_agendada_erro}</p>
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