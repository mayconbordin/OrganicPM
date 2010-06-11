<?php /* Smarty version 2.6.26, created on 2010-06-07 10:54:20
         compiled from forms%5Ccurriculo_candidato%5Cidiomas.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Idiomas</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="idioma">Idioma: </label>
								<div>
								<select class="element select medium" id="idioma" name="idioma"> 
									<option value=""></option>
									<?php $_from = $this->_tpl_vars['listIdiomas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['idiom']):
?>
									<?php if ($this->_tpl_vars['idioma'] == $this->_tpl_vars['idiom']['IDIOMA_COD']): ?>
									<option value="<?php echo $this->_tpl_vars['idiom']['IDIOMA_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['idiom']['IDIOMA']; ?>
</option>
									<?php else: ?>
									<option value="<?php echo $this->_tpl_vars['idiom']['IDIOMA_COD']; ?>
"><?php echo $this->_tpl_vars['idiom']['IDIOMA']; ?>
</option>
									<?php endif; ?>
									<?php endforeach; endif; unset($_from); ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="leitura">Leitura: </label>
								<div>
								<select class="element select small" id="leitura" name="leitura"> 
									<option value=""></option>
									<?php if ($this->_tpl_vars['leitura'] == 'sim'): ?>
									<option value="sim" selected="selected">Sim</option>
									<?php else: ?>
									<option value="sim">Sim</option>
									<?php endif; ?>
									
									<?php if ($this->_tpl_vars['leitura'] == 'não'): ?>
									<option value="não" selected="selected">Não</option>
									<?php else: ?>
									<option value="não">Não</option>
									<?php endif; ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="conversacao">Conversação: </label>
								<div>
								<select class="element select small" id="conversacao" name="conversacao"> 
									<option value="" selected="selected"></option>
									<?php if ($this->_tpl_vars['conversacao'] == 'sim'): ?>
									<option value="sim" selected="selected">Sim</option>
									<?php else: ?>
									<option value="sim">Sim</option>
									<?php endif; ?>
									
									<?php if ($this->_tpl_vars['conversacao'] == 'não'): ?>
									<option value="não" selected="selected">Não</option>
									<?php else: ?>
									<option value="não">Não</option>
									<?php endif; ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="escrita">Escrita: </label>
								<div>
								<select class="element select small" id="escrita" name="escrita"> 
									<option value="" selected="selected"></option>
									<?php if ($this->_tpl_vars['escrita'] == 'sim'): ?>
									<option value="sim" selected="selected">Sim</option>
									<?php else: ?>
									<option value="sim">Sim</option>
									<?php endif; ?>
									
									<?php if ($this->_tpl_vars['escrita'] == 'não'): ?>
									<option value="não" selected="selected">Não</option>
									<?php else: ?>
									<option value="não">Não</option>
									<?php endif; ?>
								</select>
								<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="idioma_cod" type="hidden" value="<?php echo $this->_tpl_vars['idioma_cod']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>