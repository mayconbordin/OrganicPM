					<form id="cand_form" class="appnitro" action="gravarExperProf.php" method="post">
						<h2>Experiência Profissional</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
						{/if}
						<ul>
							<li id="li_1" >
								<label class="description" for="empresa">Empresa: </label>
								<div>
									<input id="empresa" name="empresa" class="element text medium" type="text" maxlength="255" value="{$empresa}" /> 
									<p class="error"></p>
									{if $empresa_erro}
									<p class="form_error">{$empresa_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="funcao">Função: </label>
								<div>
									<input id="funcao" name="funcao" class="element text medium" type="text" maxlength="200" value="{$funcao}" /> 
									<p class="error"></p>
									{if $funcao_erro}
									<p class="form_error">{$funcao_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="atribuicoes">Atribuições: </label>
								<div>
									<input id="atribuicoes" name="atribuicoes" class="element text medium" type="text" maxlength="255" value="{$atribuicoes}" /> 
									<p class="error"></p>
									{if $atribuicoes_erro}
									<p class="form_error">{$atribuicoes_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="exp_data_inicio">Data de Início: </label>
								<div>
									<input id="exp_data_inicio" name="exp_data_inicio" class="element text small" type="text" maxlength="255" value="{$exp_data_inicio}" /> 
									<p class="error"></p>
									{if $exp_data_inicio_erro}
									<p class="form_error">{$exp_data_inicio_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="exp_data_fim">Data de Término: </label>
								<div>
									<input id="exp_data_fim" name="exp_data_fim" class="element text small" type="text" maxlength="255" value="{$exp_data_fim}" /> 
									<p class="error"></p>
									{if $exp_data_fim_erro}
									<p class="form_error">{$exp_data_fim_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="setor">Setor: </label>
								<div>
								<select class="element select medium" id="setor" name="setor"> 
									<option value=""></option>
									{foreach from=$listSetores item=set}
									{if $setor == $set.EXP_SET_COD}
									<option value="{$set.EXP_SET_COD}" selected="selected">{$set.SETOR}</option>
									{else}
									<option value="{$set.EXP_SET_COD}">{$set.SETOR}</option>
									{/if}
									
									{/foreach}
								</select>
								<p class="error"></p>
								{if $setor_erro}
								<p class="form_error">{$setor_erro}</p>
								{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="exper_prof_cod" type="hidden" value="{$exper_prof_cod}"/>
							<input name="action" type="hidden" value="{$action}"/>
							<input type="submit" id="submit" value="Salvar" />							
						</ul>
					</form>