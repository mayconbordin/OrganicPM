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
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
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
								<option value="1" >First option</option>
								<option value="2" >Second option</option>
								<option value="3" >Third option</option>
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
								<div>
								<select class="element select medium" id="tipo_tel" name="tipo_tel[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div>
				<!-- End Endereço -->
				
				<!-- Begin Formações Acadêmicas -->
				<div id="tabs-3"> 
					<div id="form_acad">
						<ul>
							<li id="li_5" >
								<label class="description" for="curso">Curso: </label>
								<div>
									<select id="curso" name="curso[]"> 
										<option value="" selected="selected"></option>
										<option value="1" >First option</option>
										<option value="2" >Second option</option>
										<option value="3" >Third option</option>
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
									<select id="nivel" name="nivel[]"> 
										<option value="" selected="selected"></option>
										<option value="1" >First option</option>
										<option value="2" >Second option</option>
										<option value="3" >Third option</option>
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
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
								</select>
								<p class="error"></p>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="outra_instituicao" name="outra_instituicao" class="element text medium" type="text" maxlength="30" value=""/> 
									<p class="error"></p>
									<input id="add_2" type="button" value="Adicionar" />
								</div> 
							</li>

							<li id="li_8" >
								<label class="description" for="andamento">Andamento do Curso: </label>
								<div>
								<select class="element select medium" id="andamento" name="andamento[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
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
								<th></th> 
							</tr> 
						</thead> 
						<tbody> 

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
				</div> 
				<!-- End Formações Acadêmicas -->
				
				<!-- Begin Experiência Profissional -->
				<div id="tabs-4">
					<div id="exp_prof">
						<ul>
							<li id="li_1" >
								<label class="description" for="empresa">Empresa: </label>
								<div>
									<input id="empresa" name="empresa[]" class="element text medium" type="text" maxlength="255" value="{$empresa}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="funcao">Função: </label>
								<div>
									<input id="funcao" name="funcao[]" class="element text medium" type="text" maxlength="255" value="{$funcao}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="atribuicoes">Atribuições: </label>
								<div>
									<input id="atribuicoes" name="atribuicoes[]" class="element text medium" type="text" maxlength="255" value="{$atribuicoes}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="exp_data_inicio">Data de Início: </label>
								<div>
									<input id="exp_data_inicio" name="exp_data_inicio[]" class="element text medium" type="text" maxlength="255" value="{$exp_data_inicio}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="exp_data_fim">Data de Término: </label>
								<div>
									<input id="exp_data_fim" name="exp_data_fim[]" class="element text medium" type="text" maxlength="255" value="{$exp_data_fim}" /> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="setor">Setor: </label>
								<div>
								<select class="element select medium" id="setor" name="setor[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Experiência Profissional -->
				
				<!-- Begin Formação Adicional -->
				<div id="tabs-5"> 
					<div id="form_adic">
						<ul>
							<li id="li_1" >
								<label class="description" for="tipo">Tipo: </label>
								<div>
									<input id="tipo" name="tipo[]" class="element text medium" type="text" maxlength="255" value="{$tipo}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="adic_curso">Curso: </label>
								<div>
									<input id="adic_curso" name="adic_curso[]" class="element text medium" type="text" maxlength="255" value="{$adic_curso}"/> 
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
									<input id="carga_horaria" name="carga_horaria[]" class="element text medium" type="text" maxlength="255" value="{$carga_horaria}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_6" >
								<label class="description" for="adic_instituicao">Instituição: </label>
								<div>
								<select class="element select medium" id="adic_instituicao" name="adic_instituicao[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
								</select>
								<p class="error"></p>
								<input id="other" type="button" value="Outro" />
								</div> 
							</li>
							
							<li id="li_7" >
								<label class="description" for="adic_outra_instituicao">Outra Instituição: </label>
								<div>
									<input id="adic_outra_instituicao" name="adic_outra_instituicao" class="element text medium" type="text" maxlength="30" value=""/> 
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Formação Adicional -->
			
				<!-- Begin Conhecimentos -->
				<div id="tabs-6"> 
										<div id="conhec">
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento[]" class="element text medium" type="text" maxlength="255" value="{$grupo_conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento[]" class="element text medium" type="text" maxlength="255" value="{$conhecimento}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">Proficiência: </label>
								<div>
									<input id="proficiencia" name="proficiencia[]" class="element text medium" type="text" maxlength="255" value="{$proficiencia}"/> 
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Conhecimentos -->
				
				<!-- Begin Idiomas -->
				<div id="tabs-7"> 
					<div id="idioma_tab">
						<ul>
							<li id="li_1" >
								<label class="description" for="idioma">Idioma: </label>
								<div>
								<select class="element select medium" id="idioma" name="idioma[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >First option</option>
									<option value="2" >Second option</option>
									<option value="3" >Third option</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="leitura">Leitura: </label>
								<div>
								<select class="element select small" id="leitura" name="leitura[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >Sim</option>
									<option value="0" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="conversacao">Conversação: </label>
								<div>
								<select class="element select small" id="conversacao" name="conversacao[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >Sim</option>
									<option value="0" >Não</option>
								</select>
								<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="escrita">Escrita: </label>
								<div>
								<select class="element select small" id="escrita" name="escrita[]"> 
									<option value="" selected="selected"></option>
									<option value="1" >Sim</option>
									<option value="0" >Não</option>
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Idiomas -->
				
				<!-- Begin Referências -->
				<div id="tabs-8"> 
					<div id="referencia">
						<ul>
							<li id="li_1" >
								<label class="description" for="ref_nome">Nome: </label>
								<div>
									<input id="ref_nome" name="ref_nome[]" class="element text medium" type="text" maxlength="255" value="{$ref_nome}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="ref_empresa">Empresa: </label>
								<div>
									<input id="ref_empresa" name="ref_empresa[]" class="element text medium" type="text" maxlength="255" value="{$ref_empresa}"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="ref_vinculo">Vínculo: </label>
								<div>
									<input id="ref_vinculo" name="ref_vinculo[]" class="element text medium" type="text" maxlength="255" value="{$ref_vinculo}"/>
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="ref_telefone">Telefone: </label>
								<div>
									<input id="ref_telefone" name="ref_telefone[]" class="element text medium" type="text" maxlength="255" value="{$ref_telefone}"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="ref_email">Email: </label>
								<div>
									<input id="ref_email" name="ref_email[]" class="element text medium" type="text" maxlength="255" value="{$ref_email}"/> 
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

						</tbody> 
					</table> 
					
					<input type="button" id="next" value="Próximo" />
					
				</div>
				<!-- End Referências -->
				
				<!-- Begin Acesso -->
				<div id="tabs-9"> 
					<ul>
						<li id="li_1" >
							<label class="description" for="usuario">Usuário: </label>
							<div>
								<input id="usuario" name="usuario" class="element text medium" type="text" maxlength="200" value="{$usuario}"/> 
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
								<input id="senha_conf" name="senha_conf" class="element text medium" type="password" maxlength="11" value=""/> 
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