
							<div class="report">
								<form method="get" action="relatorio.php">
									<p>
										<label>Processo Seletivo:</label>
										<select id="pro_sel_cod" name="pro_sel_cod">
										{foreach from=$procSel item=p}
											<option value="{$p.PRO_SEL_COD}">{$p.PRO_SEL_COD}</option>
										{/foreach}
										</select>
										<input id="type" type="hidden" name="type" value="full" />
										<input id="gerarProcSel" type="submit" value="Gerar" />
									</p>
								</form>
							</div>