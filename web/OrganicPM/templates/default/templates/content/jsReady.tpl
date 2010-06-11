{literal}
				//Background
				var bgHeight = $('#background img').css('height').substr(0, 3);
				var height = bgHeight - 130;
				$('#background img').css({'height' : height+'px'});
				
				//Reajuste de largura
				var width = $(window).width() - 460;
				$('#content #content-wrapper #right').css({'width' : width+'px'});
				
				$('.item .item_title').click(function(){					
					if ($(this).parent().children('ul').css('display') == "none")
						$(this).parent().children('ul').fadeIn("slow");
					else
						$(this).parent().children('ul').fadeOut("slow");
					return false;
				});
{/literal}