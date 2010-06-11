							<form id="cand_form" class="appnitro" action="gravarContatos.php" method="post">
								<h2>Contatos</h2>
								<ul>
									<li id="li_12" >
										<label class="description" for="tipo_tel">Tipo: </label>
										{if $contato_erro}
										<p class="form_error">{$contato_erro}</p>
										{/if}
										<div>
										<select class="element select medium" id="tipo_tel" name="tipo_tel"> 
											<option value=""></option>
											{foreach from=$listTiposTelefone item=tip_tel}
											
											{if $tipo_tel == $tip_tel.TIP_TEL_TIPO}
											<option value="{$tip_tel.TIP_TEL_TIPO}" selected="selected">{$tip_tel.TIP_TEL_TIPO}</option>
											{else}
											<option value="{$tip_tel.TIP_TEL_TIPO}">{$tip_tel.TIP_TEL_TIPO}</option>
											{/if}
											
											{/foreach}
										</select>
										<p class="error"></p>
										{if $tipo_tel_erro}
										<p class="form_error">{$tipo_tel_erro}</p>
										{/if}
										</div> 
									</li>
		
									<li id="li_9" >
										<label class="description" for="ddd">DDD: </label>
										<div>
											<input id="ddd" name="ddd" class="element text small" type="text" maxlength="30" value="{$ddd}"/> 
											<p class="error"></p>
										</div> 
									</li>
		
									<li id="li_10" >
										<label class="description" for="numero_tel">Número: </label>
										<div>
											<input id="numero_tel" name="numero_tel" class="element text medium" type="text" maxlength="30" value="{$numero_tel}"/> 
											<p class="error"></p>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
									<input name="contato_cod" type="hidden" value="{$contato_cod}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>