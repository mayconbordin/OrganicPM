					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Formações Acadêmicas</h2>
						<ul>
							<li id="li_5" >
								<label class="description" for="curso">Curso: </label>
								<div>
									<select id="curso" name="curso"> 
										<option value=""></option>
										{foreach from=$listCursos item=curso_form}
										
										{if $curso == $curso_form.CUR_FOR_COD}
										<option value="{$curso_form.CUR_FOR_COD}" selected="selected">{$curso_form.NOME}</option>
										{else}
										<option value="{$curso_form.CUR_FOR_COD}">{$curso_form.NOME}</option>
										{/if}
										
										{/foreach}
									</select>
									<p class="error"></p>
									<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_1" >
								<label class="description" for="outro_curso">Outro Curso: </label>
								<div>
									<input id="outro_curso" name="outro_curso" type="text" maxlength="60" value=""/>
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="nivel">Nível: </label>
								<div>
									<select id="nivel" name="nivel"> 
										<option value=""></option>
										{foreach from=$listNiveis item=niv}
										
										{if $nivel == $niv.NIV_FOR_COD}
										<option value="{$niv.NIV_FOR_COD}" selected="selected">{$niv.NIVEL}</option>
										{else}
										<option value="{$niv.NIV_FOR_COD}">{$niv.NIVEL}</option>
										{/if}
										
										{/foreach}
									</select>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="acad_data_inicio">Data de Início: </label>
								<div>
									<input name="acad_data_inicio" type="text" id="acad_data_inicio" value="{$acad_data_inicio}" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_3" >
								<label class="description" for="acad_data_fim">Data de Término: </label>
								<div>
									<input name="acad_data_fim" type="text" id="acad_data_fim" value="{$acad_data_fim}" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_7" >
								<label class="description" for="instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="instituicao" name="instituicao"> 
									<option value=""></option>
									{foreach from=$listInstituicoes item=instit}
									
									{if $instituicao == $instit.INS_ENS_COD}
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

							<li id="li_4" >
								<label class="description" for="outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="outra_instituicao" name="outra_instituicao" class="element text medium" type="text" maxlength="200" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_8" >
								<label class="description" for="andamento">Andamento do Curso: </label>
								<div>
								<select class="element select medium" id="andamento" name="andamento"> 
									<option value=""></option>
									{foreach from=$listAndamento item=and}
									{if $andamento == $and.AND_CUR_COD}
									<option value="{$and.AND_CUR_COD}" selected="selected">{$and.STATUS}</option>
									{else}
									<option value="{$and.AND_CUR_COD}">{$and.STATUS}</option>
									{/if}
									
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="form_acad_cod" type="hidden" value="{$form_acad_cod}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>