				{literal}
				
				$('#gerarProcSel').click(function(){
					var pro_sel_cod = $('#pro_sel_cod option:selected').val();
					
					window.location.replace('gerarRelatorio.php?id='+pro_sel_cod);
					
					return false;
				});
				
				
				
				$("#data_inicial, #data_final").datepicker({dateFormat: 'dd/mm/yy', maxDate: new Date({/literal}{$year}{literal}, {/literal}{$month}{literal}, {/literal}{$day}{literal})});
				
				var chart1;
	            chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: '{/literal}{$graph_type}{literal}',
				},
				title: {
					text: 'Visitas x Cadastros x Processos Seletivos',
					style: {
						margin: '10px 100px 0 0' // center it
					}
				},
				subtitle: {
					text: 'Relatório Comparativo',
					style: {
						margin: '0 100px 0 0' // center it
					}
				},
				xAxis: {
					title: {
						text: '{/literal}{$tipo}{literal}'
					},
					categories: [{/literal}{$periodo}{literal}]
				},
				yAxis: {
					title: {
						text: 'Total'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				tooltip: {
					formatter: function() {
		                return '<b>{/literal}{$tipo}{literal} '+this.x +'</b>:<br /> '+ this.y + ' ' + this.series.name ;
					}
				},
				series: [{
					name: 'Visitas',
					data: [{/literal}{$visitas}{literal}]
				}, {
					name: 'Cadastros',
					data: [{/literal}{$cadastros}{literal}]
				}, {
					name: 'Inscrições em Processos Seletivos',
					data: [{/literal}{$inscricoes}{literal}]
				}]
		      });

				{/literal}