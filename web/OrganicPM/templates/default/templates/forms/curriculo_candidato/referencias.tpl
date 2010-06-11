					<form id="cand_form" class="appnitro" action="gravarReferencia.php" method="post">
						<h2>Referências</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
						{/if}
						<ul>
							<li id="li_1" >
								<label class="description" for="ref_nome">Nome: </label>
								<div>
									<input id="ref_nome" name="ref_nome" class="element text medium" type="text" maxlength="255" value="{$ref_nome}"/> 
									<p class="error"></p>
									{if $ref_nome_erro}
									<p class="form_error">{$ref_nome_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="ref_empresa">Empresa: </label>
								<div>
									<input id="ref_empresa" name="ref_empresa" class="element text medium" type="text" maxlength="255" value="{$ref_empresa}"/>
									<p class="error"></p>
									{if $ref_empresa_erro}
									<p class="form_error">{$ref_empresa_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="ref_vinculo">Vínculo: </label>
								<div>
									<input id="ref_vinculo" name="ref_vinculo" class="element text medium" type="text" maxlength="255" value="{$ref_vinculo}"/>
									<p class="error"></p>
									{if $ref_vinculo_erro}
									<p class="form_error">{$ref_vinculo_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_4" >
								<label class="description" for="ref_telefone">Telefone: </label>
								<div>
									<input id="ref_telefone" name="ref_telefone" class="element text medium" type="text" maxlength="255" value="{$ref_telefone}"/> 
									<p class="error"></p>
									{if $ref_telefone_erro}
									<p class="form_error">{$ref_telefone_erro}</p>
									{/if}
								</div> 
							</li>

							<li id="li_5" >
								<label class="description" for="ref_email">Email: </label>
								<div>
									<input id="ref_email" name="ref_email" class="element text medium" type="text" maxlength="255" value="{$ref_email}"/> 
									<p class="error"></p>
									{if $ref_email_erro}
									<p class="form_error">{$ref_email_erro}</p>
									{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="referencia_cod" type="hidden" value="{$referencia_cod}"/>
							<input name="action" type="hidden" value="{$action}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>