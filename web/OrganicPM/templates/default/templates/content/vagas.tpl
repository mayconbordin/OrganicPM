					<div id="cand_form">
						<h2>Vagas</h2>
						{if $pro_sel_sucesso}
							{include file="message.tpl" msgType="sucess" msgText=$pro_sel_sucesso msgVis="show"}
						{/if}
						{if $pro_sel_aviso}
							{include file="message.tpl" msgType="warning" msgText=$pro_sel_aviso msgVis="show"}
						{/if}
						
						{if $pro_sel_erro}
							<p>Processo seletivo não encontrado ou finalizado.</p>
						{else}
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Descrição:</td>
									<td>{$descricao}</td>
								</tr>
								<tr>
									<td>Data de Início:</td>
									<td>{$data_inicio}</td>
								</tr>
								<tr>
									<td>Data de Término:</td>
									<td>{$data_fim}</td>
								</tr>
								<tr>
									<td>Vagas:</td>
									<td>{$vagas}</td>
								</tr>
								<tr>
									<td>Cargo:</td>
									<td>{$cargo}</td>
								</tr>
							</tbody>
						</table>
						<a class="inscrever" href="vaga.php?id={$cod}&action=inscricao" title="Inscrever-se">Increver-se &#187;</a>
						{/if}
					</div>