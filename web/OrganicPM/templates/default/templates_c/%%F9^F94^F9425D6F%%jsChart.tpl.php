<?php /* Smarty version 2.6.26, created on 2010-06-14 10:08:20
         compiled from report%5CjsChart.tpl */ ?>
				<?php echo '
				function newChart() {
					var chart1 = new Highcharts.Chart({
						chart: {
							renderTo: \'chart\',
							defaultSeriesType: \'line\',
						},
						title: {
							text: \'Visitas x Cadastros x Processos Seletivos\',
							style: {
								margin: \'10px 100px 0 0\' // center it
							}
						},
						subtitle: {
							text: \'Relatório Comparativo\',
							style: {
								margin: \'0 100px 0 0\' // center it
							}
						},
						xAxis: {
							categories: [\'01\',\'02\',\'03\',\'04\',\'05\',\'06\',\'07\',\'08\',\'09\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'27\',\'28\',\'29\',\'30\']
						},
						yAxis: {
							title: {
								text: \'Total\'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: \'#808080\'
							}]
						},
						tooltip: {
							formatter: function() {
				                return \'<b>\'+ this.series.name +\'</b><br/>\'+
									this.x +\': \'+ this.y ;
							}
						},
						series: [{
							name: \'Visitas\',
							data: [4,6,2,3,9,6,8,7,4,5,0]
						}, {
							name: \'Cadastros\',
							data: [0,0,0,0,4,0,0,0,0,0,0]
						}, {
							name: \'Inscrições em Processos Seletivos\',
							data: [0,0,0,0,0,0,0,0,0,9,0]
						}]
				      });
				}
				'; ?>