				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					{if $logado && ($page == "content" || $page == "curriculo"  || $page == "cadastro")}
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Menu</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2>Meu Currículo</h2>
								<ul>
									<li><a href="{#root#}candidato/curriculo.php" title="">EDITAR CURRÍCULO</a></li>
								</ul>
							</li>
							
							<li class="item"><h2>Seleções</h2>
								<ul>
									<li><a href="" title="">ANDAMENTO</a><li>
									<li><a href="" title="">TESTES</a></li>
									<li><a href="" title="">ENTREVISTAS</a></li>
								</ul>
							</li>
							
							<li class="item"><h2>Meu Login</h2>
								<ul>
									<li><a href="" title="">EDITAR</a></li>
									<li><a href="" title="">REMOVER</a></li>
								</ul>
							</li>
							
							<li class="item"><h2><a href="{#root#}process.php" title="Sair">Sair</a></h2></li>
							
						</ul>
						<!-- End Submenu -->
						
					</div>
					<!-- End Left Block -->
					{/if}
					
					<!-- Begin Right Block -->
					<div id="right">
						
						{if $status == "sucesso"}
							{include file="message.tpl" msgType="sucess" msgText="Currículo salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $status == "erro"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do currículo." msgVis="show"}
						{/if}
						
						
						{if $logado}
							{if $page == "curriculo"}
								{include file="forms\curriculo_candidato\index.tpl"}
							{/if}
							{if $page == "content"}
								{include file="content\userPanel.tpl"}
							{/if}
						{else}
							{if $page == "cadastro"}
								{include file="forms\cadastro_candidato\index.tpl"}
							{else}
								{include file="content/naoLogado.tpl"}
							{/if}
						{/if}
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				