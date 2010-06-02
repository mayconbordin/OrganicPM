		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Processo Seletivo</a></li>
				<li><a href="#tabs-2">Fases</a></li>
			</ul>
			
			<form class="appnitro"  method="post" action="gravarProcSel.php">
			
			<!-- Begin Processos Seletivos -->
			<div id="tabs-1">
				<ul>
					<li id="li_1" >
						<label class="description" for="descricao">Descrição: </label>
						<div>
							<textarea id="descricao" name="descricao" class="element textarea small">{$descricao}</textarea>
							<p><span class="left"></span> caracteres restantes.</p>
							<p class="error"></p>
							{if $descricao_erro}
							<p class="form_error">{$descricao_erro}</p>
							{/if}
						</div> 
					</li>

					<li id="li_2" >
						<label class="description" for="data_inicio">Data de Início: </label>
						<div>
							<input id="data_inicio" name="data_inicio" class="element text small" type="text" maxlength="255" value="{$data_inicio}"/>
							<p class="error"></p>
							{if $data_inicio_erro}
							<p class="form_error">{$data_inicio_erro}</p>
							{/if}
						</div> 
					</li>

					<li id="li_3" >
						<label class="description" for="data_fim">Data de Término: </label>
						<div>
							<input id="data_fim" name="data_fim" class="element text small" type="text" maxlength="255" value="{$data_fim}"/>
							<p class="error"></p>
							{if $data_fim_erro}
							<p class="form_error">{$data_fim_erro}</p>
							{/if}
						</div> 
					</li>

					<li id="li_4" >
						<label class="description" for="vagas">Vagas: </label>
						<div>
							<input id="vagas" name="vagas" class="element text small" type="text" maxlength="255" value="{$vagas}"/>
							<p class="error"></p>
							{if $vagas_erro}
							<p class="form_error">{$vagas_erro}</p>
							{/if}
						</div> 
					</li>

					<li id="li_5" >
						<label class="description" for="cargo">Cargo: </label>
						<div>
						<select class="element select medium" id="cargo" name="cargo"> 
							<option value=""></option>
							{foreach from=$listCargos item=carg}
									
							{if $cargo == $carg.CARGO_COD}
							<option value="{$carg.CARGO_COD}" selected="selected">{$carg.DESCRICAO}</option>
							{else}
							<option value="{$carg.CARGO_COD}">{$carg.DESCRICAO}</option>
							{/if}
							
							{/foreach}
						</select>
						<p class="error"></p>
						{if $cargo_erro}
						<p class="form_error">{$cargo_erro}</p>
						{/if}
						</div> 
					</li>
					<input class="next" type="button" value="Próximo" />
				</ul>
			
			</div>
			<!-- End Processos Seletivos -->
			
			<!-- Begin Fases -->
			<div id="tabs-2">
				{if $fase_erro}
				<p class="form_error">{$fase_erro}</p>
				{/if}
				<div id="fase-form">
					<ul>
						<li id="li_1">
							<label class="description" for="fase_tipo">Tipo: </label>
							<div>
							<select class="element select medium" id="fase_tipo" name="fase_tipo[]"> 
								<option value=""></option>
								{foreach from=$listTiposFase item=tipoFase}
									
								{if $fase_tipo == $tipoFase.TIP_FAS_COD}
								<option value="{$tipoFase.TIP_FAS_COD}" selected="selected">{$tipoFase.FASE}</option>
								{else}
								<option value="{$tipoFase.TIP_FAS_COD}">{$tipoFase.FASE}</option>
								{/if}
								
								{/foreach}
							</select>
							<p class="error"></p>
							</div> 
						</li>
						
						<li id="li_4">
							<label class="description" for="teste">Teste: </label>
							<div>
							<select class="element select medium" id="teste" name="teste"> 
								<option value="" selected="selected"></option>
							</select>
							<p class="error"></p>
							</div> 
						</li>

						<li id="li_2" >
							<label class="description" for="fase_data_inicio">Data de Início: </label>
							<div>
								<input id="fase_data_inicio" name="fase_data_inicio[]" class="element text small" type="text" maxlength="255" value=""/>
								<p class="error"></p>
							</div> 
						</li>

						<li id="li_3" >
							<label class="description" for="fase_data_fim">Data de Término: </label>
							<div>
								<input id="fase_data_fim" name="fase_data_fim[]" class="element text small" type="text" maxlength="255" value=""/>
								<p class="error"></p>
							</div> 
						</li>
								
						<input class="save" type="button" value="Salvar" />
						<input class="cancel" type="button" value="Cancelar" />
						<input class="clear" type="button" value="Limpar" />
					</ul>
				</div>
				
				<!-- <input id="ordem_fases" name="ordem_fases" type="hidden" value=""/> -->
				<input class="add" type="button" value="Adicionar" />
			
				<!-- Begin Lista de Fases -->
				<h2 id="ordem-fases">Fases:</h2>
				<ul id="fases-list">
				
				{foreach from=$fases item=fase key=i}
				<li id="listItem_{$i}">'
					<img src="{#templateDir#}resources/images/arrow.png" alt="Mover" width="16" height="16" class="handle" />
					<a href="#" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
					<a href="#" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
					
					<strong class="fase_nome">{$fase.FASE_NOME}</strong> ({$fase.FASE_DATA_INICIO} - {$fase.FASE_DATA_FIM})
					<input class="fase_0" name="fase_tipo[]" type="hidden" value="{$fase.FASE_TIPO}{if $fase.TESTE}-{$fase.TESTE}{/if}"/>
					<input class="fase_1" name="fase_data_inicio[]" type="hidden" value="{$fase.FASE_DATA_INICIO}"/>
					<input class="fase_2" name="fase_data_fim[]" type="hidden" value="{$fase.FASE_DATA_FIM}"/>
				</li>
				{/foreach}

				</ul>
				<!-- End Lista de Fases -->
				
				<input class="submit" type="submit" value="Cadastrar" />
				
			</div>
			<!-- End Fases -->

			</form>
			
		</div>