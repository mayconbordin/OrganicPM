<?php /* Smarty version 2.6.26, created on 2010-06-17 14:56:22
         compiled from report%5CjsReady.tpl */ ?>
				<?php echo '
				
				$("#data_inicial, #data_final").datepicker({dateFormat: \'dd/mm/yy\', maxDate: new Date('; ?>
<?php echo $this->_tpl_vars['year']; ?>
<?php echo ', '; ?>
<?php echo $this->_tpl_vars['month']; ?>
<?php echo ', '; ?>
<?php echo $this->_tpl_vars['day']; ?>
<?php echo ')});
				
				var chart1;
	            chart1 = new Highcharts.Chart({
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
					title: {
						text: \''; ?>
<?php echo $this->_tpl_vars['tipo']; ?>
<?php echo '\'
					},
					categories: ['; ?>
<?php echo $this->_tpl_vars['periodo']; ?>
<?php echo ']
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
							\''; ?>
<?php echo $this->_tpl_vars['tipo']; ?>
<?php echo ' \'+this.x +\': \'+ this.y ;
					}
				},
				series: [{
					name: \'Visitas\',
					data: ['; ?>
<?php echo $this->_tpl_vars['visitas']; ?>
<?php echo ']
				}, {
					name: \'Cadastros\',
					data: ['; ?>
<?php echo $this->_tpl_vars['cadastros']; ?>
<?php echo ']
				}, {
					name: \'Inscrições em Processos Seletivos\',
					data: ['; ?>
<?php echo $this->_tpl_vars['inscricoes']; ?>
<?php echo ']
				}]
		      });

				'; ?>