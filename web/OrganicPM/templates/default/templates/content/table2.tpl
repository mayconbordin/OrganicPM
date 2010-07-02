						<h1 class="table_title">{$tableTitle}</h1>
						<table cellspacing="1" class="tablesorter"> 
							<thead> 
								<tr>
									{foreach from=$columns item=col}
									<th>{$col}</th>
									{/foreach}									
								</tr> 
							</thead> 
							<tbody>
								{foreach from=$data item=dt key=i}
								<tr>
									{if $i%2 == 0}
									
									{foreach from=$dt item=row}
									<td>{$row}</td>
									{/foreach}
									
									{else}
									{foreach from=$dt item=row}
									<td class="row">{$row}</td>
									{/foreach}
																	
									{/if}
									
								</tr>
								{/foreach}
							</tbody> 
						</table>
						
						{if !$logado}
						<a class="btn" href="{#root#}candidato/cadastrar.php">Cadastre-se</a>
						<a class="btn" href="{#root#}login.php">Logar</a>
						{/if}
						
						{$pagination}