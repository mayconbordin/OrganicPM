					<form id="cand_form" class="appnitro" action="gravarEndereco.php" method="post">
						<h2>Endereço</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="endereco">Endereço: </label>
								<div>
									<input id="endereco" name="endereco" class="element text medium" type="text" maxlength="500" value="{$endereco}"/> 
									<p class="error"></p>
									{if $endereco_erro}
									<p class="form_error">{$endereco_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_2" >
								<label class="description" for="numero">Número: </label>
								<div>
									<input id="numero" name="numero" class="element text small" type="text" maxlength="38" value="{$numero}"/> 
									<p class="error"></p>
									{if $numero_erro}
									<p class="form_error">{$numero_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_3" >
								<label class="description" for="complemento">Complemento: </label>
								<div>
									<input id="complemento" name="complemento" class="element text small" type="text" maxlength="100" value="{$complemento}"/> 
									<p class="error"></p>
									{if $complemento_erro}
									<p class="form_error">{$complemento_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_4" >
								<label class="description" for="cep">CEP: </label>
								<div>
									<input id="cep" name="cep" class="element text medium" type="text" maxlength="8" value="{$cep}"/> 
									<p class="error"></p>
									{if $cep_erro}
									<p class="form_error">{$cep_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_5" >
								<label class="description" for="bairro">Bairro: </label>
								<div>
									<input id="bairro" name="bairro" class="element text medium" type="text" maxlength="100" value="{$bairro}"/> 
									<p class="error"></p>
									{if $bairro_erro}
									<p class="form_error">{$bairro_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_6" >
								<label class="description" for="cidade">Cidade: </label>
								<div>
									<input id="cidade" name="cidade" class="element text medium" type="text" maxlength="200" value="{$cidade}"/> 
									<p class="error"></p>
									{if $cidade_erro}
									<p class="form_error">{$cidade_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_11" >
								<label class="description" for="uf">UF: </label>
								{if $uf_erro}
								<p class="form_error">{$uf_erro}</p>
								{/if}
								<div>
								<select class="element select small" id="uf" name="uf"> 
									<option value="" selected="selected"></option>
									
									{foreach from=$listUF item=uni_fed}
										
									{if $uf == $uni_fed.UNI_FED_COD}
									<option value="{$uni_fed.UNI_FED_COD}" selected="selected">{$uni_fed.NOME}</option>
									{else}
									<option value="{$uni_fed.UNI_FED_COD}">{$uni_fed.NOME}</option>
									{/if}
										
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>
	
							<li id="li_7" >
								<label class="description" for="pais">País: </label>
								<div>
									<input id="pais" name="pais" class="element text medium" type="text" maxlength="100" value="{$pais}"/> 
									<p class="error"></p>
									{if $pais_erro}
									<p class="form_error">{$pais_erro}</p>
									{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="action" type="hidden" value="edit"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>