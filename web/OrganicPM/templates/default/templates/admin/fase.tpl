							<form id="cand_form" class="appnitro" action="alterFase.php" method="post">
								<h2>Fase</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<ul>
									<li id="li_1">
										<label class="description" for="fase_tipo">Tipo: </label>
										<div>
										<select class="element select medium" id="fase_tipo" name="fase_tipo" {if $teste}disabled="disabled"{/if}> 
											<option value=""></option>
											{foreach from=$listTiposFase item=tipoFase}
												
											{if $fase_tipo == $tipoFase.TIP_FAS_COD}
											<option value="{$tipoFase.TIP_FAS_COD}" selected="selected">{$tipoFase.FASE}</option>
											{else}
											<option value="{$tipoFase.TIP_FAS_COD}">{$tipoFase.FASE}</option>
											{/if}
											
											{/foreach}
										</select>
										<p class="error"></p>
										{if $fase_tipo_erro}
										<p class="form_error">{$fase_tipo_erro}</p>
										{/if}
										</div> 
									</li>
									
									{if $teste}
									<li id="li_4">
										<label class="description" for="teste">Teste: </label>
										<div>
										<select class="element select medium" id="teste" name="teste"> 
											<option value=""></option>
											{foreach from=$listTestes item=teste}
												
											{if $fase_teste == $teste.TESTE_COD}
											<option value="{$teste.TESTE_COD}" selected="selected">{$teste.DESCRICAO}</option>
											{else}
											<option value="{$teste.TESTE_COD}">{$teste.DESCRICAO}</option>
											{/if}
											
											{/foreach}
										</select>
										<p class="error"></p>
										{if $teste_erro}
										<p class="form_error">{$teste_erro}</p>
										{/if}
										</div> 
									</li>
									
									<li id="li_5">
										<label class="description" for="nota">Nota Mínima para Aprovação: </label>
										<div>
										<select class="element select medium" id="nota" name="nota"> 
											<option value=""></option>
											{foreach from=$listNotas item=nota}
												
											{if $fase_nota == $nota.NOTA}
											<option value="{$nota.NOTA}" selected="selected">{$nota.NOTA}</option>
											{else}
											<option value="{$nota.NOTA}">{$nota.NOTA}</option>
											{/if}
											
											{/foreach}
										</select>
										<p class="error"></p>
										{if $nota_erro}
										<p class="form_error">{$nota_erro}</p>
										{/if}
										</div> 
									</li>
									{/if}
									
									<li id="li_2" >
										<label class="description" for="fase_data_inicio">Data de Início: </label>
										<div>
											<input id="fase_data_inicio" name="fase_data_inicio" class="element text small" type="text" maxlength="255" value="{$fase_data_inicio}"/>
											<p class="error"></p>
											{if $fase_data_inicio_erro}
											<p class="form_error">{$fase_data_inicio_erro}</p>
											{/if}
										</div> 
									</li>
			
									<li id="li_3" >
										<label class="description" for="fase_data_fim">Data de Término: </label>
										<div>
											<input id="fase_data_fim" name="fase_data_fim" class="element text small" type="text" maxlength="255" value="{$fase_data_fim}"/>
											<p class="error"></p>
											{if $fase_data_fim_erro}
											<p class="form_error">{$fase_data_fim_erro}</p>
											{/if}
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="fase_cod" type="hidden" value="{$fase_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>