					<form id="cand_form" class="appnitro" action="userFunctions.php" method="post">
						<h2>Usuário</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
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
							
							<li id="li_6" >
								<label class="description" for="nivel_acesso">Nível de Acesso: </label>
								<div>
									<div>
										<select class="element select small" id="nivel_acesso" name="nivel_acesso"> 
											<option value="" selected="selected"></option>
											
											{foreach from=$niveis item=niv}
												
											{if $nivel_acesso == $niv.NIVEL}
											<option value="{$niv.NIVEL}" selected="selected">{$niv.ALIAS}</option>
											{else}
											<option value="{$niv.NIVEL}">{$niv.ALIAS}</option>
											{/if}
												
											{/foreach}
										</select>
										<p class="error"></p>
										{if $nivel_acesso_erro}
										<p class="form_error">{$nivel_acesso_erro}</p>
										{/if}
									</div> 

								</div> 
							</li>
							
							<li id="li_6" >
								<label class="description" for="status">Status: </label>
								<div>
									<div>
										<select class="element select small" id="status" name="status"> 
											<option value=""></option>
											
											{if $status == "active"}
											<option value="active" selected="selected">Ativo</option>
											{else}
											<option value="active">Ativo</option>
											{/if}
											{if $status == "disabled"}
											<option value="disabled" selected="selected">Desabilitado</option>
											{else}
											<option value="disabled">Desabilitado</option>
											{/if}
											{if $status == "blocked"}
											<option value="blocked" selected="selected">Bloqueado</option>
											{else}	
											<option value="blocked">Bloqueado</option>
											{/if}
										</select>
										<p class="error"></p>
										{if $status_erro}
										<p class="form_error">{$status_erro}</p>
										{/if}
									</div> 

								</div> 
							</li>
							
							<li id="li_3" >
								<label class="description" for="senha">Nova Senha: </label>
								<div>
									<input id="senha" name="senha" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_erro}
									<p class="form_error">{$senha_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_4" >
								<label class="description" for="senha_conf">Confirme a Nova Senha: </label>
								<div>
									<input id="senha_conf" name="senha_conf" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_conf_erro}
									<p class="form_error">{$senha_conf_erro}</p>
									{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="action" type="hidden" value="{$action}"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>