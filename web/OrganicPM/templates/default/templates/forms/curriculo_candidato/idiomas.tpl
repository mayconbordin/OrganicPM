					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Idiomas</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="idioma">Idioma: </label>
								<div>
								<select class="element select medium" id="idioma" name="idioma"> 
									<option value=""></option>
									{foreach from=$listIdiomas item=idiom}
									{if $idioma == $idiom.IDIOMA_COD}
									<option value="{$idiom.IDIOMA_COD}" selected="selected">{$idiom.IDIOMA}</option>
									{else}
									<option value="{$idiom.IDIOMA_COD}">{$idiom.IDIOMA}</option>
									{/if}
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="leitura">Leitura: </label>
								<div>
								<select class="element select small" id="leitura" name="leitura"> 
									<option value=""></option>
									{if $leitura == "sim"}
									<option value="sim" selected="selected">Sim</option>
									{else}
									<option value="sim">Sim</option>
									{/if}
									
									{if $leitura == "não"}
									<option value="não" selected="selected">Não</option>
									{else}
									<option value="não">Não</option>
									{/if}
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="conversacao">Conversação: </label>
								<div>
								<select class="element select small" id="conversacao" name="conversacao"> 
									<option value="" selected="selected"></option>
									{if $conversacao == "sim"}
									<option value="sim" selected="selected">Sim</option>
									{else}
									<option value="sim">Sim</option>
									{/if}
									
									{if $conversacao == "não"}
									<option value="não" selected="selected">Não</option>
									{else}
									<option value="não">Não</option>
									{/if}
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="escrita">Escrita: </label>
								<div>
								<select class="element select small" id="escrita" name="escrita"> 
									<option value="" selected="selected"></option>
									{if $escrita == "sim"}
									<option value="sim" selected="selected">Sim</option>
									{else}
									<option value="sim">Sim</option>
									{/if}
									
									{if $escrita == "não"}
									<option value="não" selected="selected">Não</option>
									{else}
									<option value="não">Não</option>
									{/if}
								</select>
								<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="idioma_cod" type="hidden" value="{$idioma_cod}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>