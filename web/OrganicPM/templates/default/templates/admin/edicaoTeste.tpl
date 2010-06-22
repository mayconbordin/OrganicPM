							<form id="cand_form" class="appnitro" action="alterTeste.php" method="post">
								<h2>Teste</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<ul>
									<li id="li_1" >
										<label class="description" for="teste_descricao">Descrição: </label>
										<div>
											<textarea id="teste_descricao" name="teste_descricao" class="element textarea small">{$teste_descricao}</textarea> 
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											{if $teste_descricao_erro}
											<p class="form_error">{$teste_descricao_erro}</p>
											{/if}
										</div> 
									</li>
				
									<li id="li_4" >
										<label class="description" for="teste_tipo">Tipo: </label>
										<div>
										<select class="element select medium" id="teste_tipo" name="teste_tipo"> 
											<option value=""></option>
											{foreach from=$listTiposTeste item=tipoTeste}
											{if $teste_tipo == $tipoTeste.TIP_TES_COD}
											<option value="{$tipoTeste.TIP_TES_COD}" selected="selected">{$tipoTeste.TIPO}</option>
											{else}
											<option value="{$tipoTeste.TIP_TES_COD}">{$tipoTeste.TIPO}</option>
											{/if}
											{/foreach}
										</select>
										<input class="new" type="button" value="Novo" />
										<p class="error"></p>
										{if $teste_tipo_erro}
										<p class="form_error">{$teste_tipo_erro}</p>
										{/if}
										</div> 
									</li>
				
									<li id="li_2" >
										<label class="description" for="teste_novo_tipo">Novo Tipo: </label>
										<div>
											<input id="teste_novo_tipo" name="teste_novo_tipo" class="element text medium" type="text" maxlength="255" value=""/> 
											<input class="save" type="button" value="Salvar" />
											<input class="cancel" type="button" value="Cancelar" />
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="teste_cod" type="hidden" value="{$teste_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>

							</form>
							
							
							<div style="margin:30px 20px 0 20px;border-top:2px solid #ffffff;padding-top:20px;">
							{include file="admin\\table2.tpl"}
							</div>