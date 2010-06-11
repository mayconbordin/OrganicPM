					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Conhecimentos</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento" class="element text medium" type="text" maxlength="255" value="{$grupo_conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento" class="element text medium" type="text" maxlength="255" value="{$conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">Proficiência: </label>
								<div>
									<input id="proficiencia" name="proficiencia" class="element text medium" type="text" maxlength="255" value="{$proficiencia}"/> 
									<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="conhecimento_cod" type="hidden" value="{$conhecimento_cod}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>