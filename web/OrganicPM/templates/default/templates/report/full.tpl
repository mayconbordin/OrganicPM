
							
							
							<div class="report">
								<div id="chart"></div>
							</div>
							
							<div class="report">
								<form method="get" action="relatorio.php">
									<p>
										<label>Data Inicial:</label>
										<input id="data_inicial" type="text" name="data_inicio" value="" />
										<label>Data Final:</label>
										<input id="data_final" type="text" name="data_fim" value="" />
										<label>Tipo de Gr�fico:</label>
										<select id="graph_type" name="graph_type">
											<option value="line">Linhas</option>
											<option value="bar">Barras</option>
										</select>
										<input id="type" type="hidden" name="type" value="full" />
										<input id="gerar" type="submit" value="Gerar" />
									</p>
								</form>
							</div>
							
							<div class="report">
								<h2>Per�odo: <strong>{$periodoInicial} - {$periodoFinal}</strong></h2>
							</div>