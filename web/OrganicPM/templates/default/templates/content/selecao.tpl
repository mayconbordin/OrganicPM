					<div id="cand_form">
						<h2>Sele��o</h2>
						{if $selecao_erro}
							{include file="message.tpl" msgType="error" msgText="C�digo inv�lido." msgVis="show"}
						{else}
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Descri��o:</td>
									<td>{$descricao}</td>
								</tr>
								<tr>
									<td>Data de In�cio:</td>
									<td>{$data_inicio}</td>
								</tr>
								<tr>
									<td>Data de T�rmino:</td>
									<td>{$data_fim}</td>
								</tr>
								<tr>
									<td>Status:</td>
									<td>{$status}</td>
								</tr>
							</tbody>
						</table>
						{/if}
					</div>