		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Teste</a></li>
				<li><a href="#tabs-2">Questões</a></li>
			</ul>
			
			<form class="appnitro"  method="post" action="gravarTeste.php">
			
			<!-- Begin Testes -->
			<div id="tabs-1">
				{if $teste_erro}
				<p class="form_error">{$teste_erro}</p>
				{/if}
				<ul>
					<li id="li_1" >
						<label class="description" for="teste_descricao">Descrição: </label>
						<div>
							<textarea id="teste_descricao" name="teste_descricao" class="element textarea small"></textarea> 
							<p><span class="left"></span> caracteres restantes.</p>
							<p class="error"></p>
							{if $teste_descricao_erro}
							<p class="form_error">{$teste_descricao_erro}</p>
							{/if}
						</div> 
					</li>

					<li id="li_4" >
						<label class="description" for="teste_tipo">Tipo: </label>
						<div>
						<select class="element select medium" id="teste_tipo" name="teste_tipo"> 
							<option value=""></option>
							{foreach from=$listTiposTeste item=tipoTeste}
							<option value="{$tipoTeste.TIP_TES_COD}">{$tipoTeste.TIPO}</option>
							{/foreach}
						</select>
						<input class="new" type="button" value="Novo" />
						<p class="error"></p>
						{if $teste_tipo_erro}
						<p class="form_error">{$teste_tipo_erro}</p>
						{/if}
						</div> 
					</li>

					<li id="li_2" >
						<label class="description" for="teste_novo_tipo">Novo Tipo: </label>
						<div>
							<input id="teste_novo_tipo" name="teste_novo_tipo" class="element text medium" type="text" maxlength="255" value=""/> 
							<input class="save" type="button" value="Salvar" />
							<input class="cancel" type="button" value="Cancelar" />
						</div> 
					</li>
					<input class="next" type="button" value="Próximo" />
				</ul>
							
			</div>
			<!-- End Testes -->
			
			<!-- Begin Questões -->
			<div id="tabs-2">
				{if $questoes_erro}
				<p class="form_error">{$questoes_erro}</p>
				{/if}
				<div id="questao-form">
					<ul>
						<li id="li_3" >
							<label class="description" for="questao_descricao">Questão: </label>
							<div>
								<textarea id="questao_descricao" name="q_des" class="element textarea medium"></textarea> 
								<p><span class="left"></span> caracteres restantes.</p>
								<p class="error"></p>
							</div> 
						</li>

						<li id="li_5" >
							<label class="description" for="questao_tipo">Tipo de Questão: </label>
							<div>
							<select class="element select medium" id="questao_tipo" name="q_tip"> 
								<option value="" selected="selected"></option>
								{foreach from=$listTiposQuestao item=tipoQuestao}
								<option value="{$tipoQuestao.TIP_QUE_COD}">{$tipoQuestao.TIPO}</option>
								{/foreach}
							</select>
							<p class="error"></p>
							</div> 
						</li>
						
						<!-- Begin Lista de Questões -->
						<h2>Alternativas:</h2>
						<table cellspacing="1" class="tablesorter"> 
							<thead> 
								<tr> 
									<th>Descricao</th> 
									<th>Resposta</th> 
									<th></th> 
								</tr> 
							</thead> 
							<tbody> 
								<tr>
									<td><input class="questao_alternativa" name="alt_des" type="text" value="" /></td>
									<td>
										<select class="questao_resposta element select medium" id="queAlt_1" name="tes_res"> 
											<option value="" selected="selected"></option>
										</select>
									</td>
									<td><input class="remove" type="button" value="-" /></td>
								</tr>
							</tbody> 
						</table> 
						<p><input class="add" type="button" value="+" /></p>
						<!-- End Lista de Questões -->
								
						<input class="save" type="button" value="Salvar" />
						<input class="cancel" type="button" value="Cancelar" />
						<input class="clear" type="button" value="Limpar" />
					</ul>
				</div>
				
				<input class="add" type="button" value="Adicionar" />
				<br />
				<br />
				<br />
			
				<!-- Begin Lista de Questões -->
				<h2>Questões:</h2>
				<ul id="questao-list">

				{foreach from=$questoes item=que key=i}
				{if $que.DESCRICAO != ""}
				<li id="listItem_{$i+1}">
					<img src="{#templateDir#}resources/images/arrow.png" alt="move" width="16" height="16" class="handle" />
					<a href="#" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
					<a href="#" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
							
					<strong>Questão {$i+1} ({$que.RESUMO})</strong>
					<input class="quest_0" name="questao_descricao[]" type="hidden" value="{$que.DESCRICAO}"/>
					<input class="quest_1" name="questao_tipo[]" type="hidden" value="{$que.TIP_QUE_COD}"/>
					<input class="quest_2" name="questao_alternativas[]" type="hidden" value="{$que.ALTERNATIVAS}"/>
					<input class="quest_3" name="questao_respostas[]" type="hidden" value="{$que.RESPOSTAS}"/>
				</li>
				{/if}
				{/foreach}
				</ul>
				<!-- End Lista de Questões -->
				
				<br />
				<br />
				<input class="submit" type="submit" value="Cadastrar" />
				
			</div>
			<!-- End Questões -->

			</form>
			
		</div>