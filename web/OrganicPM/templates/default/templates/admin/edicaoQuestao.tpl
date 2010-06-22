							<form id="cand_form" class="appnitro" action="alterQuestao.php" method="post">
								<h2>Questão</h2>
								{if $geral_erro}
								<p class="form_error">{$geral_erro}</p>
								{/if}
								<ul>
									<li id="li_3" >
										<label class="description" for="questao_descricao">Questão: </label>
										<div>
											<textarea id="questao_descricao" name="questao_descricao" class="element textarea medium">{$questao_descricao}</textarea> 
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											{if $questao_descricao_erro}
											<p class="form_error">{$questao_descricao_erro}</p>
											{/if}
										</div> 
									</li>
			
									<li id="li_5" >
										<label class="description" for="questao_tipo">Tipo de Questão: </label>
										<div>
										<select class="element select medium" id="questao_tipo" name="questao_tipo"> 
											<option value="" selected="selected"></option>
											{foreach from=$listTiposQuestao item=tipoQuestao}
											{if $questao_tipo == $tipoQuestao.TIP_QUE_COD}
											<option value="{$tipoQuestao.TIP_QUE_COD}" selected="selected">{$tipoQuestao.TIPO}</option>
											{else}
											<option value="{$tipoQuestao.TIP_QUE_COD}">{$tipoQuestao.TIPO}</option>
											{/if}
											{/foreach}
										</select>
										<p class="error"></p>
										{if $questao_tipo_erro}
										<p class="form_error">{$questao_tipo_erro}</p>
										{/if}
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="questao_cod" type="hidden" value="{$questao_cod}"/>
									<input name="action" type="hidden" value="{$action}"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>
								
								<div style="margin:30px 20px 0 20px;border-top:2px solid #ffffff;padding-top:20px;">
								{include file="admin\\table2.tpl"}
								</div>