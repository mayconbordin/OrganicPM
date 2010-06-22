						<h1>{$tableTitle}</h1>
						
						<table cellspacing="1" class="tablesorter2"> 
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
										<a href="{$url}?action={$tableAction}{$params[$i]}" title="{$titleAction}">{$titleAction}</a>
									</td>
									{else}
									{foreach from=$dt item=row}
									<td class="row">{$row}</td>
									{/foreach}
									<td class="row">
										<a href="{$url}?action={$tableAction}{$params[$i]}" title="{$titleAction}">{$titleAction}</a>
									</td>									
									{/if}
									
								</tr>
								{/foreach}
							</tbody> 
						</table>
						{$pagination}