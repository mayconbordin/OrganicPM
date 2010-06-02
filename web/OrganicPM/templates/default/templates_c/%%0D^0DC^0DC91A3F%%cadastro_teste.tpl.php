<?php /* Smarty version 2.6.26, created on 2010-06-01 11:01:30
         compiled from admin%5Ccadastro_teste.tpl */ ?>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Teste</a></li>
				<li><a href="#tabs-2">Questões</a></li>
			</ul>
			
			<form class="appnitro"  method="post" action="gravarTeste.php">
			
			<!-- Begin Testes -->
			<div id="tabs-1">
				<?php if ($this->_tpl_vars['teste_erro']): ?>
				<p class="form_error"><?php echo $this->_tpl_vars['teste_erro']; ?>
</p>
				<?php endif; ?>
				<ul>
					<li id="li_1" >
						<label class="description" for="teste_descricao">Descrição: </label>
						<div>
							<textarea id="teste_descricao" name="teste_descricao" class="element textarea small"></textarea> 
							<p><span class="left"></span> caracteres restantes.</p>
							<p class="error"></p>
							<?php if ($this->_tpl_vars['teste_descricao_erro']): ?>
							<p class="form_error"><?php echo $this->_tpl_vars['teste_descricao_erro']; ?>
</p>
							<?php endif; ?>
						</div> 
					</li>

					<li id="li_4" >
						<label class="description" for="teste_tipo">Tipo: </label>
						<div>
						<select class="element select medium" id="teste_tipo" name="teste_tipo"> 
							<option value=""></option>
							<?php $_from = $this->_tpl_vars['listTiposTeste']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoTeste']):
?>
							<option value="<?php echo $this->_tpl_vars['tipoTeste']['TIP_TES_COD']; ?>
"><?php echo $this->_tpl_vars['tipoTeste']['TIPO']; ?>
</option>
							<?php endforeach; endif; unset($_from); ?>
						</select>
						<input class="new" type="button" value="Novo" />
						<p class="error"></p>
						<?php if ($this->_tpl_vars['teste_tipo_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['teste_tipo_erro']; ?>
</p>
						<?php endif; ?>
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
				<?php if ($this->_tpl_vars['questoes_erro']): ?>
				<p class="form_error"><?php echo $this->_tpl_vars['questoes_erro']; ?>
</p>
				<?php endif; ?>
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
								<?php $_from = $this->_tpl_vars['listTiposQuestao']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoQuestao']):
?>
								<option value="<?php echo $this->_tpl_vars['tipoQuestao']['TIP_QUE_COD']; ?>
"><?php echo $this->_tpl_vars['tipoQuestao']['TIPO']; ?>
</option>
								<?php endforeach; endif; unset($_from); ?>
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

				<?php $_from = $this->_tpl_vars['questoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['que']):
?>
				<?php if ($this->_tpl_vars['que']['DESCRICAO'] != ""): ?>
				<li id="listItem_<?php echo $this->_tpl_vars['i']+1; ?>
">
					<img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/arrow.png" alt="move" width="16" height="16" class="handle" />
					<a href="#" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
					<a href="#" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
							
					<strong>Questão <?php echo $this->_tpl_vars['i']+1; ?>
 (<?php echo $this->_tpl_vars['que']['RESUMO']; ?>
)</strong>
					<input class="quest_0" name="questao_descricao[]" type="hidden" value="<?php echo $this->_tpl_vars['que']['DESCRICAO']; ?>
"/>
					<input class="quest_1" name="questao_tipo[]" type="hidden" value="<?php echo $this->_tpl_vars['que']['TIP_QUE_COD']; ?>
"/>
					<input class="quest_2" name="questao_alternativas[]" type="hidden" value="<?php echo $this->_tpl_vars['que']['ALTERNATIVAS']; ?>
"/>
					<input class="quest_3" name="questao_respostas[]" type="hidden" value="<?php echo $this->_tpl_vars['que']['RESPOSTAS']; ?>
"/>
				</li>
				<?php endif; ?>
				<?php endforeach; endif; unset($_from); ?>
				</ul>
				<!-- End Lista de Questões -->
				
				<br />
				<br />
				<input class="submit" type="submit" value="Cadastrar" />
				
			</div>
			<!-- End Questões -->

			</form>
			
		</div>