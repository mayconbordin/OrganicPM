					<form id="cand_form" class="appnitro" action="gravarDadosLogin.php" method="post">
						<h2>Login</h2>
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
							
							<li id="li_5" >
								<label class="description" for="data_registro">Data de Registro: </label>
								<div>
									<input id="data_registro" name="data_registro" class="element text medium" type="text" maxlength="60" value="{$data_registro}"/> 
									<p class="error"></p>
									{if $data_registro_erro}
									<p class="form_error">{$data_registro_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_6" >
								<label class="description" for="nivel_acesso">Nível de Acesso: </label>
								<div>
									<input id="nivel_acesso" name="nivel_acesso" class="element text medium" type="text" maxlength="60" value="{$nivel_acesso}"/> 
									<p class="error"></p>
									{if $nivel_acesso_erro}
									<p class="form_error">{$nivel_acesso_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_2" >
								<label class="description" for="senha_atual">Senha Atual: </label>
								<div>
									<input id="senha_atual" name="senha_atual" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_atual_erro}
									<p class="form_error">{$senha_atual_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_3" >
								<label class="description" for="senha_nova">Nova Senha: </label>
								<div>
									<input id="senha_nova" name="senha_nova" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_nova_erro}
									<p class="form_error">{$senha_nova_erro}</p>
									{/if}
								</div> 
							</li>
							
							<li id="li_4" >
								<label class="description" for="senha_nova_conf">Confirme a Nova Senha: </label>
								<div>
									<input id="senha_nova_conf" name="senha_nova_conf" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_nova_conf_erro}
									<p class="form_error">{$senha_nova_conf_erro}</p>
									{/if}
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
							<input name="action" type="hidden" value="edit"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>