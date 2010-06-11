<?php /* Smarty version 2.6.26, created on 2010-06-10 12:42:48
         compiled from admin%5CcadastroProcSel.tpl */ ?>
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
							<textarea id="descricao" name="descricao" class="element textarea small"><?php echo $this->_tpl_vars['descricao']; ?>
</textarea>
							<p><span class="left"></span> caracteres restantes.</p>
							<p class="error"></p>
							<?php if ($this->_tpl_vars['descricao_erro']): ?>
							<p class="form_error"><?php echo $this->_tpl_vars['descricao_erro']; ?>
</p>
							<?php endif; ?>
						</div> 
					</li>

					<li id="li_2" >
						<label class="description" for="data_inicio">Data de Início: </label>
						<div>
							<input id="data_inicio" name="data_inicio" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['data_inicio']; ?>
"/>
							<p class="error"></p>
							<?php if ($this->_tpl_vars['data_inicio_erro']): ?>
							<p class="form_error"><?php echo $this->_tpl_vars['data_inicio_erro']; ?>
</p>
							<?php endif; ?>
						</div> 
					</li>

					<li id="li_3" >
						<label class="description" for="data_fim">Data de Término: </label>
						<div>
							<input id="data_fim" name="data_fim" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['data_fim']; ?>
"/>
							<p class="error"></p>
							<?php if ($this->_tpl_vars['data_fim_erro']): ?>
							<p class="form_error"><?php echo $this->_tpl_vars['data_fim_erro']; ?>
</p>
							<?php endif; ?>
						</div> 
					</li>

					<li id="li_4" >
						<label class="description" for="vagas">Vagas: </label>
						<div>
							<input id="vagas" name="vagas" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['vagas']; ?>
"/>
							<p class="error"></p>
							<?php if ($this->_tpl_vars['vagas_erro']): ?>
							<p class="form_error"><?php echo $this->_tpl_vars['vagas_erro']; ?>
</p>
							<?php endif; ?>
						</div> 
					</li>

					<li id="li_5" >
						<label class="description" for="cargo">Cargo: </label>
						<div>
						<select class="element select medium" id="cargo" name="cargo"> 
							<option value=""></option>
							<?php $_from = $this->_tpl_vars['listCargos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['carg']):
?>
									
							<?php if ($this->_tpl_vars['cargo'] == $this->_tpl_vars['carg']['CARGO_COD']): ?>
							<option value="<?php echo $this->_tpl_vars['carg']['CARGO_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['carg']['DESCRICAO']; ?>
</option>
							<?php else: ?>
							<option value="<?php echo $this->_tpl_vars['carg']['CARGO_COD']; ?>
"><?php echo $this->_tpl_vars['carg']['DESCRICAO']; ?>
</option>
							<?php endif; ?>
							
							<?php endforeach; endif; unset($_from); ?>
						</select>
						<p class="error"></p>
						<?php if ($this->_tpl_vars['cargo_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['cargo_erro']; ?>
</p>
						<?php endif; ?>
						</div> 
					</li>
					<input class="next" type="button" value="Próximo" />
				</ul>
			
			</div>
			<!-- End Processos Seletivos -->
			
			<!-- Begin Fases -->
			<div id="tabs-2">
				<?php if ($this->_tpl_vars['fase_erro']): ?>
				<p class="form_error"><?php echo $this->_tpl_vars['fase_erro']; ?>
</p>
				<?php endif; ?>
				<div id="fase-form">
					<ul>
						<li id="li_1">
							<label class="description" for="fase_tipo">Tipo: </label>
							<div>
							<select class="element select medium" id="fase_tipo" name="fase_tipo[]"> 
								<option value=""></option>
								<?php $_from = $this->_tpl_vars['listTiposFase']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoFase']):
?>
									
								<?php if ($this->_tpl_vars['fase_tipo'] == $this->_tpl_vars['tipoFase']['TIP_FAS_COD']): ?>
								<option value="<?php echo $this->_tpl_vars['tipoFase']['TIP_FAS_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['tipoFase']['FASE']; ?>
</option>
								<?php else: ?>
								<option value="<?php echo $this->_tpl_vars['tipoFase']['TIP_FAS_COD']; ?>
"><?php echo $this->_tpl_vars['tipoFase']['FASE']; ?>
</option>
								<?php endif; ?>
								
								<?php endforeach; endif; unset($_from); ?>
							</select>
							<p class="error"></p>
							</div> 
						</li>
						
						<li id="li_4">
							<label class="description" for="teste">Teste: </label>
							<div>
							<select class="element select medium" id="teste" name="teste"> 
								<option value="" selected="selected">Carregando...</option>
							</select>
							<p class="error"></p>
							</div> 
						</li>
						
						<li id="li_5">
							<label class="description" for="nota">Nota Mínima para Aprovação: </label>
							<div>
							<select class="element select medium" id="nota" name="nota"> 
								<option value="" selected="selected">Carregando...</option>
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
				
				<?php $_from = $this->_tpl_vars['fases']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['fase']):
?>
				<li id="listItem_<?php echo $this->_tpl_vars['i']; ?>
">'
					<img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/arrow.png" alt="Mover" width="16" height="16" class="handle" />
					<a href="#" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
					<a href="#" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
					
					<strong class="fase_nome"><?php echo $this->_tpl_vars['fase']['FASE_NOME']; ?>
</strong> (<?php echo $this->_tpl_vars['fase']['FASE_DATA_INICIO']; ?>
 - <?php echo $this->_tpl_vars['fase']['FASE_DATA_FIM']; ?>
)
					<input class="fase_0" name="fase_tipo[]" type="hidden" value="<?php echo $this->_tpl_vars['fase']['FASE_TIPO']; ?>
<?php if ($this->_tpl_vars['fase']['TESTE']): ?>-<?php echo $this->_tpl_vars['fase']['TESTE']; ?>
-<?php echo $this->_tpl_vars['fase']['NOTA']; ?>
<?php endif; ?>"/>
					<input class="fase_1" name="fase_data_inicio[]" type="hidden" value="<?php echo $this->_tpl_vars['fase']['FASE_DATA_INICIO']; ?>
"/>
					<input class="fase_2" name="fase_data_fim[]" type="hidden" value="<?php echo $this->_tpl_vars['fase']['FASE_DATA_FIM']; ?>
"/>
				</li>
				<?php endforeach; endif; unset($_from); ?>

				</ul>
				<!-- End Lista de Fases -->
				
				<input class="submit" type="submit" value="Cadastrar" />
				
			</div>
			<!-- End Fases -->

			</form>
			
		</div>