				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					{if $logado}
					<!-- Begin Right Block -->
					<div id="right">
						
						<h1 class="title-message">Você já está logado</h1>
						
						<p class="log-message">Você pode fazer sair do sistema <a href="{#root#}process.php" title="Sair">aqui</a>.</p>
						
					</div>
					<!-- End Right Block -->
					{/if}
					
					{if $logado === false}
					<!-- Begin Login Panel -->
					<div id="login-panel">
						
						<div id="login-form">
							<h1>Autenticação</h1>
							
							{if $userError || $passError}
								{include file="message.tpl" msgType="error" msgText="Usuário ou Senha incorretos." msgVis="show"}
							{/if}
							
							{if $genError}
								{include file="message.tpl" msgType="error" msgText=$genError msgVis="show"}
							{/if}
							
							{include file="message.tpl" msgType="warning" msgText="" msgVis="hide"}
							
							<form method="post" action="process.php">
								<div id="username-input">
									<label>USUÁRIO:</label>
									<input id="user" name="user" type="text" value="" />
								</div>
								
								<div id="password-input">
									<label>SENHA:</label>
									<input id="pass" name="pass" type="password" value="" />
								</div>
								
								<div id="remember">
									<input type="checkbox" name="remember"  />Remember me
								</div>
								
								<div id="submit">
									<input type="hidden" name="sublogin" value="1">
									<input id="challenge" type="hidden" name="challenge" value="">
									<input id="signin" type="submit" value="LOGAR"/>
								</div>
								
							</form>
					
						</div>
						
					</div>
					<!-- End Login Panel -->
					{/if}
					
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				