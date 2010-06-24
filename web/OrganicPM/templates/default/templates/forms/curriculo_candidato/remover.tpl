					<form id="cand_form" class="appnitro" action="removerConta.php" method="post">
						<h2>Tem certeza que deseja remover sua conta?</h2>
						{if $geral_erro}
						<p class="form_error">{$geral_erro}</p>
						{/if}
						
						<!-- Dados Adicionais -->
						<input name="pessoa_cod" type="hidden" value="{$pessoa_cod}"/>
						<input name="action" type="hidden" value="{$action}"/>
						<input type="button" id="sim" value="Sim" />
						<input type="button" value="Não" onclick="window.location.replace('{#root#}candidato/');" />
						
						<div id="remover" style="display:none;">
							<li id="li_2" >
								<label class="description" for="senha_atual">Senha: </label>
								<div>
									<input id="senha_atual" name="senha_atual" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									{if $senha_atual_erro}
									<p class="form_error">{$senha_atual_erro}</p>
									{/if}
								</div> 
							</li>
							<input type="submit" id="submit" value="Remover" />
						</div>
					
					</form>