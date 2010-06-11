<?php /* Smarty version 2.6.26, created on 2010-06-07 10:32:07
         compiled from forms%5Ccurriculo_candidato%5Cexper_prof.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Experiência Profissional</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="empresa">Empresa: </label>
								<div>
									<input id="empresa" name="empresa" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['empresa']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="funcao">Função: </label>
								<div>
									<input id="funcao" name="funcao" class="element text medium" type="text" maxlength="200" value="<?php echo $this->_tpl_vars['funcao']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="atribuicoes">Atribuições: </label>
								<div>
									<input id="atribuicoes" name="atribuicoes" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['atribuicoes']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="exp_data_inicio">Data de Início: </label>
								<div>
									<input id="exp_data_inicio" name="exp_data_inicio" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['exp_data_inicio']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="exp_data_fim">Data de Término: </label>
								<div>
									<input id="exp_data_fim" name="exp_data_fim" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['exp_data_fim']; ?>
" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="setor">Setor: </label>
								<div>
								<select class="element select medium" id="setor" name="setor"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listSetores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['set']):
?>
									<?php if ($this->_tpl_vars['setor'] == $this->_tpl_vars['set']['EXP_SET_COD']): ?>
									<option value="<?php echo $this->_tpl_vars['set']['EXP_SET_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['set']['SETOR']; ?>
</option>
									<?php else: ?>
									<option value="<?php echo $this->_tpl_vars['set']['EXP_SET_COD']; ?>
"><?php echo $this->_tpl_vars['set']['SETOR']; ?>
</option>
									<?php endif; ?>
									
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="exper_prof_cod" type="hidden" value="<?php echo $this->_tpl_vars['exper_prof_cod']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />							
						</ul>
					</form>