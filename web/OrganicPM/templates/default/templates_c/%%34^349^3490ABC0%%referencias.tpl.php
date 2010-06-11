<?php /* Smarty version 2.6.26, created on 2010-06-07 01:29:43
         compiled from forms%5Ccurriculo_candidato%5Creferencias.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Referências</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="ref_nome">Nome: </label>
								<div>
									<input id="ref_nome" name="ref_nome" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_nome']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="ref_empresa">Empresa: </label>
								<div>
									<input id="ref_empresa" name="ref_empresa" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_empresa']; ?>
"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="ref_vinculo">Vínculo: </label>
								<div>
									<input id="ref_vinculo" name="ref_vinculo" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_vinculo']; ?>
"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="ref_telefone">Telefone: </label>
								<div>
									<input id="ref_telefone" name="ref_telefone" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_telefone']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="ref_email">Email: </label>
								<div>
									<input id="ref_email" name="ref_email" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['ref_email']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="referencia_cod" type="hidden" value="<?php echo $this->_tpl_vars['referencia_cod']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>