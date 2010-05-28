{literal}
				//Background
				var bgHeight = $('#background img').css('height').substr(0, 3);
				var height = bgHeight - 130;
				$('#background img').css({'height' : height+'px'});
				
				//Reajuste de largura
				var width = $(window).width() - 460;
				$('#content #content-wrapper #right').css({'width' : width+'px'});
{/literal}