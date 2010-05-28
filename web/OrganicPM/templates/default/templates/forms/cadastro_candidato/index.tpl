		<div id="tabs"> 
			<ul> 
				<li><a href="#tabs-1">Dados Pessoais</a></li> 
				<li><a href="#tabs-2">Endereço</a></li> 
				<li><a href="#tabs-3">Formação Acadêmica</a></li> 
				<li><a href="#tabs-4">Experiência Profissional</a></li> 
				<li><a href="#tabs-5">Formação Adicional</a></li> 
				<li><a href="#tabs-6">Conhecimentos</a></li> 
				<li><a href="#tabs-7">Idiomas</a></li> 
				<li><a href="#tabs-8">Referências</a></li> 
				<li><a href="#tabs-9">Acesso</a></li> 				
			</ul> 
			
			<!-- Begin Formulário Candidato -->
			<form id="form" class="appnitro" action="gravarCurriculo.php" method="post">
			
				<!-- Begin Dados Pessoais -->
				<div id="tabs-1"> 
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
					</ul>
					<input type="button" id="next" value="Próximo" />
				</div> 
				<!-- End Dados Pessoais -->
				
				<!-- Begin Endereço -->
				<div id="tabs-2"> 
					<ul>
						<li id="li_1" >
							<label class="description" for="endereco">Endereço: </label>
							<div>
								<input id="endereco" name="endereco" class="element text medium" type="text" maxlength="500" value="{$endereco}"/> 
								<p class="error"></p>
								{if $endereco_erro}
								<p class="form_error">{$endereco_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_2" >
							<label class="description" for="numero">Número: </label>
							<div>
								<input id="numero" name="numero" class="element text small" type="text" maxlength="38" value="{$numero}"/> 
								<p class="error"></p>
								{if $numero_erro}
								<p class="form_error">{$numero_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_3" >
							<label class="description" for="complemento">Complemento: </label>
							<div>
								<input id="complemento" name="complemento" class="element text small" type="text" maxlength="100" value="{$complemento}"/> 
								<p class="error"></p>
								{if $complemento_erro}
								<p class="form_error">{$complemento_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_4" >
							<label class="description" for="cep">CEP: </label>
							<div>
								<input id="cep" name="cep" class="element text medium" type="text" maxlength="8" value="{$cep}"/> 
								<p class="error"></p>
								{if $cep_erro}
								<p class="form_error">{$cep_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_5" >
							<label class="description" for="bairro">Bairro: </label>
							<div>
								<input id="bairro" name="bairro" class="element text medium" type="text" maxlength="100" value="{$bairro}"/> 
								<p class="error"></p>
								{if $bairro_erro}
								<p class="form_error">{$bairro_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_6" >
							<label class="description" for="cidade">Cidade: </label>
							<div>
								<input id="cidade" name="cidade" class="element text medium" type="text" maxlength="200" value="{$cidade}"/> 
								<p class="error"></p>
								{if $cidade_erro}
								<p class="form_error">{$cidade_erro}</p>
								{/if}
							</div> 
						</li>

						<li id="li_11" >
							<label class="description" for="uf">UF: </label>
							{if $uf_erro}
							<p class="form_error">{$uf_erro}</p>
							{/if}
							<div>
							<select class="element select small" id="uf" name="uf"> 
								<option value="" selected="selected"></option>
								
								{foreach from=$listUF item=uni_fed}
									
								{if $uf == $uni_fed.UNI_FED_COD}
								<option value="{$uni_fed.UNI_FED_COD}" selected="selected">{$uni_fed.NOME}</option>
								{else}
								<option value="{$uni_fed.UNI_FED_COD}">{$uni_fed.NOME}</option>
								{/if}
									
								{/foreach}
							</select>
							<p class="error"></p>
							</div> 
						</li>

						<li id="li_7" >
							<label class="description" for="pais">País: </label>
							<div>
								<input id="pais" name="pais" class="element text medium" type="text" maxlength="100" value="{$pais}"/> 
								<p class="error"></p>
								{if $pais_erro}
								<p class="form_error">{$pais_erro}</p>
								{/if}
							</div> 
						</li>

						<li class="section_break">
								<h3>Contatos:</h3>
								<p></p>
						</li>
						
						<div id="contatos">
							<li id="li_12" >
								<label class="description" for="tipo_tel">Tipo: </label>
								{if $contato_erro}
								<p class="form_error">{$contato_erro}</p>
								{/if}
								<div>
								<select class="element select medium" id="tipo_tel" name="tipo_tel[]"> 
									<option value=""></option>
									{foreach from=$listTiposTelefone item=tip_tel}
								
									<option value="{$tip_tel.TIP_TEL_TIPO}" >{$tip_tel.TIP_TEL_TIPO}</option>
								
									{/foreach}
								</select>
								<p class="error"></p>
								{if $tipo_tel_erro}
								<p class="form_error">{$tipo_tel_erro}</p>
								{/if}
								</div> 
							</li>

							<li id="li_9" >
								<label class="description" for="ddd">DDD: </label>
								<div>
									<input id="ddd" name="ddd[]" class="element text small" type="text" maxlength="30" value="{$ddd}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_10" >
								<label class="description" for="numero_tel">Número: </label>
								<div>
									<input id="numero_tel" name="numero_tel[]" class="element text medium" type="text" maxlength="30" value="{$numero_tel}"/> 
									<p class="error"></p>
								</div> 
							</li>
							<input id="save" type="button" value="Salvar" />
							<input id="cancel" type="button" value="Cancelar" />
							<input id="clear" type="button" value="Limpar" /><br /><br />
						</div>
					</ul>

					<input id="add" type="button" value="Adicionar Contato" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Tipo</th> 
								<th>DDD</th> 
								<th>Número</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$contatos item=contato}
							<tr>
								<td>{$contato.tipo}<input name="tipo_tel[]" type="hidden" value="{$contato.tipo}" /></td>
								<td>{$contato.ddd}<input name="ddd[]" type="hidden" value="{$contato.ddd}" /></td>
								<td>{$contato.num}<input name="numero_tel[]" type="hidden" value="{$contato.num}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div>
				<!-- End Endereço -->
				
				<!-- Begin Formações Acadêmicas -->
				<div id="tabs-3"> 
					{if $formacao_academica_erro}
					<p class="form_error">{$formacao_academica_erro}</p>
					{/if}
					<div id="form_acad">
						<ul>
							<li id="li_5" >
								<label class="description" for="curso">Curso: </label>
								<div>
									<select id="curso" name="curso[]"> 
										<option value=""></option>
										{foreach from=$listCursos item=curso_form}
										<option value="{$curso_form.CUR_FOR_COD}">{$curso_form.NOME}</option>
										{/foreach}
									</select>
									<p class="error"></p>
									<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_1" >
								<label class="description" for="outro_curso">Outro Curso: </label>
								<div>
									<input id="outro_curso" name="outro_curso" type="text" maxlength="200" value=""/>
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="nivel">Nível: </label>
								<div>
									<select id="nivel" name="nivel[]"> 
										<option value=""></option>
										{foreach from=$listNiveis item=niv}
										<option value="{$niv.NIV_FOR_COD}">{$niv.NIVEL}</option>
										{/foreach}
									</select>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="acad_data_inicio">Data de Início: </label>
								<div>
									<input name="acad_data_inicio[]" type="text" id="acad_data_inicio" value="{$acad_data_inicio}" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_3" >
								<label class="description" for="acad_data_fim">Data de Término: </label>
								<div>
									<input name="acad_data_fim[]" type="text" id="acad_data_fim" value="{$acad_data_fim}" />
									<p class="error"></p>
								</div>
							</li>

							<li id="li_7" >
								<label class="description" for="instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="instituicao" name="instituicao[]"> 
									<option value=""></option>
									{foreach from=$listInstituicoes item=instit}
									<option value="{$instit.INS_ENS_COD}">{$instit.NOME}</option>
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
								<select class="element select medium" id="andamento" name="andamento[]"> 
									<option value=""></option>
									{foreach from=$listAndamento item=and}
									<option value="{$and.AND_CUR_COD}">{$and.STATUS}</option>
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
				
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Nivel</th> 
								<th>Curso</th> 
								<th>Data Inicio</th> 
								<th>Data Fim</th> 
								<th>Instituição</th> 
								<th>Andamento</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$formAcademicas item=formAcad}
							<tr>
								<td>{$formAcad.nivelNome}<input name="nivel[]" type="hidden" value="{$formAcad.nivel}" /></td>
								<td>{$formAcad.cursoNome}<input name="curso[]" type="hidden" value="{$formAcad.curso}" /></td>
								<td>{$formAcad.acad_data_inicio}<input name="acad_data_inicio[]" type="hidden" value="{$formAcad.acad_data_inicio}" /></td>
								<td>{$formAcad.acad_data_fim}<input name="acad_data_fim[]" type="hidden" value="{$formAcad.acad_data_fim}" /></td>
								<td>{$formAcad.instituicaoNome}<input name="instituicao[]" type="hidden" value="{$formAcad.instituicao}" /></td>
								<td>{$formAcad.andamentoNome}<input name="andamento[]" type="hidden" value="{$formAcad.andamento}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div> 
				<!-- End Formações Acadêmicas -->
				
				<!-- Begin Experiência Profissional -->
				<div id="tabs-4">
					{if $experiencia_profissional_erro}
					<p class="form_error">{$experiencia_profissional_erro}</p>
					{/if}
					<div id="exp_prof">
						<ul>
							<li id="li_1" >
								<label class="description" for="empresa">Empresa: </label>
								<div>
									<input id="empresa" name="empresa[]" class="element text medium" type="text" maxlength="30" value="{$empresa}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="funcao">Função: </label>
								<div>
									<input id="funcao" name="funcao[]" class="element text medium" type="text" maxlength="30" value="{$funcao}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="atribuicoes">Atribuições: </label>
								<div>
									<input id="atribuicoes" name="atribuicoes[]" class="element text medium" type="text" maxlength="300" value="{$atribuicoes}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="exp_data_inicio">Data de Início: </label>
								<div>
									<input id="exp_data_inicio" name="exp_data_inicio[]" class="element text small" type="text" maxlength="255" value="{$exp_data_inicio}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="exp_data_fim">Data de Término: </label>
								<div>
									<input id="exp_data_fim" name="exp_data_fim[]" class="element text small" type="text" maxlength="255" value="{$exp_data_fim}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="setor">Setor: </label>
								<div>
								<select class="element select medium" id="setor" name="setor[]"> 
									<option value=""></option>
									{foreach from=$listSetores item=set}
									<option value="{$set.EXP_SET_COD}">{$set.SETOR}</option>
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>								
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Empresa</th> 
								<th>Função</th> 
								<th>Atribuições</th> 
								<th>Data de Início</th> 
								<th>Data de Término</th> 
								<th>Setor</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$expProfissionais item=exp}
							<tr>
								<td>{$exp.empresa}<input name="empresa[]" type="hidden" value="{$exp.empresa}" /></td>
								<td>{$exp.funcao}<input name="funcao[]" type="hidden" value="{$exp.funcao}" /></td>
								<td>{$exp.atribuicoes}<input name="atribuicoes[]" type="hidden" value="{$exp.atribuicoes}" /></td>
								<td>{$exp.exp_data_inicio}<input name="exp_data_inicio[]" type="hidden" value="{$exp.exp_data_inicio}" /></td>
								<td>{$exp.exp_data_fim}<input name="exp_data_fim[]" type="hidden" value="{$exp.exp_data_fim}" /></td>
								<td>{$exp.setorNome}<input name="setor[]" type="hidden" value="{$exp.setor}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Experiência Profissional -->
				
				<!-- Begin Formação Adicional -->
				<div id="tabs-5"> 
					{if $formacao_adicional_erro}
					<p class="form_error">{$formacao_adicional_erro}</p>
					{/if}
					<div id="form_adic">
						<ul>
							<li id="li_1" >
								<label class="description" for="tipo">Tipo: </label>
								<div>
									<input id="tipo" name="tipo[]" class="element text medium" type="text" maxlength="30" value="{$tipo}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="adic_curso">Curso: </label>
								<div>
									<input id="adic_curso" name="adic_curso[]" class="element text medium" type="text" maxlength="30" value="{$adic_curso}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="adic_data_inicio">Data de Início: </label>
								<div>
									<input id="adic_data_inicio" name="adic_data_inicio[]" class="element text medium" type="text" maxlength="255" value="{$adic_data_inicio}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="adic_data_fim">Data de Fim: </label>
								<div>
									<input id="adic_data_fim" name="adic_data_fim[]" class="element text medium" type="text" maxlength="255" value="{$adic_data_fim}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="carga_horaria">Carga Horária: </label>
								<div>
									<input id="carga_horaria" name="carga_horaria[]" class="element text medium" type="text" maxlength="38" value="{$carga_horaria}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="adic_instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="adic_instituicao" name="adic_instituicao[]"> 
									<option value=""></option>
									{foreach from=$listInstituicoes item=instit}
									<option value="{$instit.INS_ENS_COD}">{$instit.NOME}</option>
									{/foreach}
								</select>
								<p class="error"></p>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="adic_outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="adic_outra_instituicao" name="adic_outra_instituicao" class="element text medium" type="text" maxlength="200" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Tipo</th> 
								<th>Curso</th> 
								<th>Data de Início</th> 
								<th>Data de Término</th> 
								<th>Carga Horária</th> 
								<th>Instituição</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$forAdicionais item=forAd}
							<tr>
								<td>{$forAd.tipo}<input name="tipo[]" type="hidden" value="{$forAd.tipo}" /></td>
								<td>{$forAd.adic_curso}<input name="adic_curso[]" type="hidden" value="{$forAd.adic_curso}" /></td>
								<td>{$forAd.adic_data_inicio}<input name="adic_data_inicio[]" type="hidden" value="{$forAd.adic_data_inicio}" /></td>
								<td>{$forAd.adic_data_fim}<input name="adic_data_fim[]" type="hidden" value="{$forAd.adic_data_fim}" /></td>
								<td>{$forAd.carga_horaria}<input name="carga_horaria[]" type="hidden" value="{$forAd.carga_horaria}" /></td>
								<td>{$forAd.adic_instituicaoNome}<input name="adic_instituicao[]" type="hidden" value="{$forAd.adic_instituicao}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Formação Adicional -->
			
				<!-- Begin Conhecimentos -->
				<div id="tabs-6"> 
					{if $conhecimento_erro}
					<p class="form_error">{$conhecimento_erro}</p>
					{/if}
					<div id="conhec">
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento[]" class="element text medium" type="text" maxlength="30" value="{$grupo_conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento[]" class="element text medium" type="text" maxlength="100" value="{$conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">Proficiência: </label>
								<div>
									<input id="proficiencia" name="proficiencia[]" class="element text medium" type="text" maxlength="30" value="{$proficiencia}"/> 
									<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Grupo de Conhecimento</th> 
								<th>Conhecimento</th> 
								<th>Proficiência</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$conhecimentos item=conhec}
							<tr>
								<td>{$conhec.grupo_conhecimento}<input name="grupo_conhecimento[]" type="hidden" value="{$conhec.grupo_conhecimento}" /></td>
								<td>{$conhec.conhecimento}<input name="conhecimento[]" type="hidden" value="{$conhec.conhecimento}" /></td>
								<td>{$conhec.proficiencia}<input name="proficiencia[]" type="hidden" value="{$conhec.proficiencia}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Conhecimentos -->
				
				<!-- Begin Idiomas -->
				<div id="tabs-7"> 
					{if $idioma_erro}
					<p class="form_error">{$idioma_erro}</p>
					{/if}
					<div id="idioma_tab">
						<ul>
							<li id="li_1" >
								<label class="description" for="idioma">Idioma: </label>
								<div>
								<select class="element select medium" id="idioma" name="idioma[]"> 
									<option value=""></option>
									{foreach from=$listIdiomas item=idiom}
									<option value="{$idiom.IDIOMA_COD}">{$idiom.IDIOMA}</option>
									{/foreach}
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="leitura">Leitura: </label>
								<div>
								<select class="element select small" id="leitura" name="leitura[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="conversacao">Conversação: </label>
								<div>
								<select class="element select small" id="conversacao" name="conversacao[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="escrita">Escrita: </label>
								<div>
								<select class="element select small" id="escrita" name="escrita[]"> 
									<option value="" selected="selected"></option>
									<option value="sim" >Sim</option>
									<option value="não" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Idioma</th> 
								<th>Leitura</th> 
								<th>Conversação</th> 
								<th>Escrita</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$idiomas item=idiom}
							<tr>
								<td>{$idiom.idiomaNome}<input name="idioma[]" type="hidden" value="{$idiom.idioma}" /></td>
								<td>{$idiom.escrita}<input name="escrita[]" type="hidden" value="{$idiom.escrita}" /></td>
								<td>{$idiom.conversacao}<input name="conversacao[]" type="hidden" value="{$idiom.conversacao}" /></td>
								<td>{$idiom.leitura}<input name="leitura[]" type="hidden" value="{$idiom.leitura}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Idiomas -->
				
				<!-- Begin Referências -->
				<div id="tabs-8"> 
					{if $referencia_erro}
					<p class="form_error">{$referencia_erro}</p>
					{/if}
					<div id="referencia">
						<ul>
							<li id="li_1" >
								<label class="description" for="ref_nome">Nome: </label>
								<div>
									<input id="ref_nome" name="ref_nome[]" class="element text medium" type="text" maxlength="30" value="{$ref_nome}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="ref_empresa">Empresa: </label>
								<div>
									<input id="ref_empresa" name="ref_empresa[]" class="element text medium" type="text" maxlength="30" value="{$ref_empresa}"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="ref_vinculo">Vínculo: </label>
								<div>
									<input id="ref_vinculo" name="ref_vinculo[]" class="element text medium" type="text" maxlength="30" value="{$ref_vinculo}"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="ref_telefone">Telefone: </label>
								<div>
									<input id="ref_telefone" name="ref_telefone[]" class="element text medium" type="text" maxlength="30" value="{$ref_telefone}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="ref_email">Email: </label>
								<div>
									<input id="ref_email" name="ref_email[]" class="element text medium" type="text" maxlength="30" value="{$ref_email}"/> 
									<p class="error"></p>
								</div> 
							</li>
						</ul>
						<input id="save" type="button" value="Salvar" />
						<input id="cancel" type="button" value="Cancelar" />
						<input id="clear" type="button" value="Limpar" />
					</div>
					
					<input id="add" type="button" value="Adicionar" />
					
					<table cellspacing="1" class="tablesorter"> 
						<thead> 
							<tr> 
								<th>Nome</th> 
								<th>Empresa</th> 
								<th>Vínculo</th> 
								<th>Telefone</th> 
								<th>Email</th> 
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 
							{foreach from=$referencias item=ref}
							<tr>
								<td>{$ref.ref_nome}<input name="ref_nome[]" type="hidden" value="{$ref.ref_nome}" /></td>
								<td>{$ref.ref_empresa}<input name="ref_empresa[]" type="hidden" value="{$ref.ref_empresa}" /></td>
								<td>{$ref.ref_vinculo}<input name="ref_vinculo[]" type="hidden" value="{$ref.ref_vinculo}" /></td>
								<td>{$ref.ref_telefone}<input name="ref_telefone[]" type="hidden" value="{$ref.ref_telefone}" /></td>
								<td>{$ref.ref_email}<input name="ref_email[]" type="hidden" value="{$ref.ref_email}" /></td>
								<td><input class="delete" type="button" value="Remover" /></td>
							</tr>
							{/foreach}
						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Referências -->
				
				<!-- Begin Acesso -->
				<div id="tabs-9">
					{if $acesso_erro}
					<p class="form_error">{$acesso_erro}</p>
					{/if}
					<ul>
						<li id="li_1" >
							<label class="description" for="usuario">Usuário: </label>
							<div>
								<input id="usuario" name="usuario" class="element text medium" type="text" maxlength="60" value="{$usuario}"/> 
								<p class="error"></p>
								{if $usuario_erro}
								<p class="form_error">{$usuario_erro}</p>
								{/if}
							</div> 
						</li>
						
						<li id="li_2" >
							<label class="description" for="senha">Senha: </label>
							<div>
								<input id="senha" name="senha" class="element text medium" type="password" maxlength="100" value=""/> 
								<p class="error"></p>
								{if $senha_erro}
								<p class="form_error">{$senha_erro}</p>
								{/if}
							</div> 
						</li>
						
						<li id="li_3" >
							<label class="description" for="senha_conf">Confirme a senha: </label>
							<div>
								<input id="senha_conf" name="senha_conf" class="element text medium" type="password" maxlength="100" value=""/> 
								<p class="error"></p>
								{if $senha_conf_erro}
								<p class="form_error">{$senha_conf_erro}</p>
								{/if}
							</div> 
						</li>
					</ul>
					
					<br /><br />
					<input type="submit" id="submit" value="Finalizar Cadastro" />
				</div>
				<!-- End Acesso -->
				
				<!-- Dados Adicionais -->
				<input name="action" type="hidden" value="{$action}"/>
			
			</form>
			<!-- End Formulário Candidato -->
			
		</div>