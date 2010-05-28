{literal}
				//Background
				var bgHeight = $('#background img').css('height').substr(0, 3);
				var height = bgHeight - 130;
				$('#background img').css({'height' : height+'px'});
				
				//Screen Width
				var width = $('#background img').width();
				var height = $('#background img').height();
								
				//Title Two
				var pos = ((20.78125*width)/100) - 110;
				$('#title-two').css({'left' : pos+'px'});
				
				//Tree
				$('#tree').css({'left' : (pos-30)+'px'});
				var pos = ((50*height)/100) + 90;
				$('#tree').css({'top' : pos+'px'});
				
				//Title One
				var pos = ((50*width)/100) - 400;
				$('#title-one').css({'margin-right' : pos+'px'});
				
				$('#tree').mouseover(function() {
					$('#title-two').show();
				});
				
				$('#tree').mouseleave(function() {
					$('#title-two').hide();
				});
{/literal}