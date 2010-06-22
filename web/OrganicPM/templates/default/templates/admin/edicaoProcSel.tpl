							<form id="cand_form" class="appnitro" action="alterProcSel.php" method="post">
								<h2>Processo Seletivo</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<ul>
									<li id="li_1" >
										<label class="description" for="descricao">Descrição: </label>
										<div>
											<textarea id="descricao" name="descricao" class="element textarea small">{$descricao}</textarea>
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											{if $descricao_erro}
											<p class="form_error">{$descricao_erro}</p>
											{/if}
										</div> 
									</li>
				
									<li id="li_2" >
										<label class="description" for="data_inicio">Data de Início: </label>
										<div>
											<input id="data_inicio" name="data_inicio" class="element text small" type="text" maxlength="255" value="{$data_inicio}"/>
											<p class="error"></p>
											{if $data_inicio_erro}
											<p class="form_error">{$data_inicio_erro}</p>
											{/if}
										</div> 
									</li>
				
									<li id="li_3" >
										<label class="description" for="data_fim">Data de Término: </label>
										<div>
											<input id="data_fim" name="data_fim" class="element text small" type="text" maxlength="255" value="{$data_fim}"/>
											<p class="error"></p>
											{if $data_fim_erro}
											<p class="form_error">{$data_fim_erro}</p>
											{/if}
										</div> 
									</li>
				
									<li id="li_4" >
										<label class="description" for="vagas">Vagas: </label>
										<div>
											<input id="vagas" name="vagas" class="element text small" type="text" maxlength="255" value="{$vagas}"/>
											<p class="error"></p>
											{if $vagas_erro}
											<p class="form_error">{$vagas_erro}</p>
											{/if}
										</div> 
									</li>
				
									<li id="li_5" >
										<label class="description" for="cargo">Cargo: </label>
										<div>
										<select class="element select medium" id="cargo" name="cargo"> 
											<option value=""></option>
											{foreach from=$listCargos item=carg}
													
											{if $cargo == $carg.CARGO_COD}
											<option value="{$carg.CARGO_COD}" selected="selected">{$carg.DESCRICAO}</option>
											{else}
											<option value="{$carg.CARGO_COD}">{$carg.DESCRICAO}</option>
											{/if}
											
											{/foreach}
										</select>
										<p class="error"></p>
										{if $cargo_erro}
										<p class="form_error">{$cargo_erro}</p>
										{/if}
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="pro_sel_cod" type="hidden" value="{$pro_sel_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>

							</form>
							
							
							<div style="margin:30px 20px 0 20px;border-top:2px solid #ffffff;padding-top:20px;">
							{include file="admin\\table2.tpl"}
							</div>