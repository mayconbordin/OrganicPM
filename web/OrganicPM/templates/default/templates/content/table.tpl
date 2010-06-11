						<h1 class="table_title">{$tableTitle}</h1>
						{if $novo}
						<a class="novo_link" href="{$novo_link}" title="Novo Registro">Novo Registro</a>
						{/if}
						<table cellspacing="1" class="tablesorter"> 
							<thead> 
								<tr>
									{foreach from=$columns item=col}
									<th>{$col}</th>
									{/foreach}
									<th>Ações</th>
									
								</tr> 
							</thead> 
							<tbody>
								{foreach from=$data item=dt key=i}
								<tr>
									{if $i%2 == 0}
									
									{foreach from=$dt item=row}
									<td>{$row}</td>
									{/foreach}
									
									{if $detalhes}
									<td>
										<a href="{$detalhes}.php?id={$dt[0]}" title="Detalhes">Detalhes</a>
									</td>
									{else}
									<td>
										<a href="{$url}?action=editar&amp;id={$dt[0]}" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="{$url}?action=deletar&amp;id={$dt[0]}" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									{/if}
									
									{else}
									{foreach from=$dt item=row}
									<td class="row">{$row}</td>
									{/foreach}
									{if $detalhes}
									<td class="row">
										<a href="{$detalhes}.php?id={$dt[0]}" title="Detalhes">Detalhes</a>
									</td>
									{else}
									<td class="row">
										<a href="{$url}?action=editar&amp;id={$dt[0]}" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="{$url}?action=deletar&amp;id={$dt[0]}" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									{/if}								
									{/if}
									
								</tr>
								{/foreach}
							</tbody> 
						</table>
						
						{$pagination}