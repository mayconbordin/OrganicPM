						<h1>{$tableTitle}</h1>
						
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
									<td>
										<a href="{$url}?action=editar&amp;id={$dt[0]}" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="{$url}?action=deletar&amp;id={$dt[0]}" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									{else}
									{foreach from=$dt item=row}
									<td class="row">{$row}</td>
									{/foreach}
									<td class="row">
										<a href="{$url}?action=editar&amp;id={$dt[0]}" title="Editar" class="edit"><img src="{#templateDir#}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="{$url}?action=deletar&amp;id={$dt[0]}" title="Deletar" class="delete"><img src="{#templateDir#}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>									
									{/if}
									
								</tr>
								{/foreach}
							</tbody> 
						</table>
						{$pagination}