					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Dados Pessoais</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
						{/if}
						<ul>
							<li id="li_1" >
								<label class="description" for="nome">Nome: </label>
								<div>
									<input id="nome" name="nome" class="element text medium" type="text" maxlength="200" value="{$nome}"/> 
									<p class="error"></p>
									{if $nome_erro}
									<p class="form_error">{$nome_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_2" >
								<label class="description" for="email">Email Primário: </label>
								<div>
									<input id="email" name="email" class="element text medium" type="text" maxlength="100" value="{$email}"/> 
									<p class="error"></p>
									{if $email_erro}
									<p class="form_error">{$email_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="email_sec">Email Secundário: </label>
								<div>
									<input id="email_sec" name="email_sec" class="element text medium" type="text" maxlength="100" value="{$email_sec}"/> 
									<p class="error"></p>
									{if $email_sec_erro}
									<p class="form_error">{$email_sec_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_3" >
								<label class="description" for="cpf">CPF: </label>
								<div>
									<input id="cpf" name="cpf" class="element text medium" type="text" maxlength="11" value="{$cpf}"/> 
									<p class="error"></p>
									{if $cpf_erro}
									<p class="form_error">{$cpf_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_4" >
								<label class="description" for="data_nascimento">Data de Nascimento: </label>
								<div>
									<input name="data_nascimento" type="text" id="data_nascimento" value="{$data_nascimento}" />	
									<p class="error"></p>
									{if $data_nascimento_erro}
									<p class="form_error">{$data_nascimento_erro}</p>
									{/if}
								</div>
							</li>
	
							<li id="li_5" >
								<label class="description" for="naturalidade">Naturalidade: </label>
								<div>
									<input id="naturalidade" name="naturalidade" class="element text medium" type="text" maxlength="50" value="{$naturalidade}"/> 
									<p class="error"></p>
									{if $naturalidade_erro}
									<p class="form_error">{$naturalidade_erro}</p>
									{/if}
								</div> 
							</li>
	
							<li id="li_6" >
								<label class="description" for="sexo">Sexo: </label>
								<p class="error"></p>
								{if $sexo_erro}
								<p class="form_error">{$sexo_erro}</p>
								{/if}
								<span>
									<input id="element_6_1" name="sexo" class="element radio" type="radio" value="masculino" {if $sexo == "masculino"}checked="checked"{/if} />
									<label class="choice" for="element_6_1">Masculino</label>
									<input id="element_6_2" name="sexo" class="element radio" type="radio" value="feminino" {if $sexo == "feminino"}checked="checked"{/if} />
									<label class="choice" for="element_6_2">Feminino</label>
								</span> 
							</li>
							
							<li id="li_8" >
									<label class="description" for="estado_civil">Estado Civil: </label>
									<div>
									<select class="element select medium" id="estado_civil" name="estado_civil"> 
										<option value=""></option>
										{foreach from=$listEstadosCivis item=est_civ}
										
										{if $estado_civil == $est_civ.EST_CIV_COD}
										<option value="{$est_civ.EST_CIV_COD}" selected="selected">{$est_civ.DESCRICAO}</option>
										{else}
										<option value="{$est_civ.EST_CIV_COD}">{$est_civ.DESCRICAO}</option>
										{/if}
										
										{/foreach}
									</select>
									<p class="error"></p>
									{if $estado_civil_erro}
									<p class="form_error">{$estado_civil_erro}</p>
									{/if}
									</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="action" type="hidden" value="edit"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>