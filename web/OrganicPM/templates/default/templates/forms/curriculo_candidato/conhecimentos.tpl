					<form id="cand_form" class="appnitro" action="gravarConhecimentos.php" method="post">
						<h2>Conhecimentos</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
						{/if}
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento" class="element text medium" type="text" maxlength="255" value="{$grupo_conhecimento}"/> 
									<p class="error"></p>
									{if $grupo_conhecimento_erro}
									<p class="form_error">{$grupo_conhecimento_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento" class="element text medium" type="text" maxlength="255" value="{$conhecimento}"/> 
									<p class="error"></p>
									{if $conhecimento_erro}
									<p class="form_error">{$conhecimento_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">Proficiência: </label>
								<div>
									<input id="proficiencia" name="proficiencia" class="element text medium" type="text" maxlength="255" value="{$proficiencia}"/> 
									<p class="error"></p>
									{if $proficiencia_erro}
									<p class="form_error">{$proficiencia_erro}</p>
									{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="conhecimento_cod" type="hidden" value="{$conhecimento_cod}"/>
							<input name="action" type="hidden" value="{$action}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>