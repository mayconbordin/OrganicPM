							<form id="cand_form" class="appnitro" action="alterAlternativa.php" method="post">
								<h2>Alternativa</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<ul>
									<li id="li_3" >
										<label class="description" for="alternativa">Alternativa: </label>
										<div>
											<input id="alternativa" name="alternativa" type="text" value="{$alternativa}" />
											<p class="error"></p>
											{if $alternativa_erro}
											<p class="form_error">{$alternativa_erro}</p>
											{/if}
										</div> 
									</li>
			
									<li id="li_5" >
										<label class="description" for="resposta">Resposta: </label>
										<div>
										<select class="element select medium" id="resposta" name="resposta"> 
											<option value="" selected="selected"></option>
											{foreach from=$valores item=val}
											{if $resposta == $val.VAL_GAB_COD}
											<option value="{$val.VAL_GAB_COD}" selected="selected">{$val.VALOR}</option>
											{else}
											<option value="{$val.VAL_GAB_COD}">{$val.VALOR}</option>
											{/if}
											{/foreach}
										</select>
										<p class="error"></p>
										{if $resposta_erro}
										<p class="form_error">{$resposta_erro}</p>
										{/if}
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="alt_que_cod" type="hidden" value="{$alt_que_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>