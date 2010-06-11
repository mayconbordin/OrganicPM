					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Formação Adicional</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="tipo">Tipo: </label>
								<div>
									<input id="tipo" name="tipo" class="element text medium" type="text" maxlength="255" value="{$tipo}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="adic_curso">Curso: </label>
								<div>
									<input id="adic_curso" name="adic_curso" class="element text medium" type="text" maxlength="255" value="{$adic_curso}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="adic_data_inicio">Data de Início: </label>
								<div>
									<input id="adic_data_inicio" name="adic_data_inicio" class="element text medium" type="text" maxlength="255" value="{$adic_data_inicio}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="adic_data_fim">Data de Fim: </label>
								<div>
									<input id="adic_data_fim" name="adic_data_fim" class="element text medium" type="text" maxlength="255" value="{$adic_data_fim}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="carga_horaria">Carga Horária: </label>
								<div>
									<input id="carga_horaria" name="carga_horaria" class="element text medium" type="text" maxlength="255" value="{$carga_horaria}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="adic_instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="adic_instituicao" name="adic_instituicao"> 
									<option value=""></option>
									{foreach from=$listInstituicoes item=instit}
									{if $adic_instituicao == $instit.INS_ENS_COD}
									<option value="{$instit.INS_ENS_COD}" selected="selected">{$instit.NOME}</option>
									{else}
									<option value="{$instit.INS_ENS_COD}">{$instit.NOME}</option>
									{/if}
									{/foreach}
								</select>
								<p class="error"></p>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="adic_outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="adic_outra_instituicao" name="adic_outra_instituicao" class="element text medium" type="text" maxlength="30" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="form_adic_cod" type="hidden" value="{$form_adic_cod}"/>
							<input type="submit" id="submit" value="Salvar" />	
						</ul>
					</form>