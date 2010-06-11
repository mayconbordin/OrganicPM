				{literal}
				$('#usuario,#data_registro').attr('disabled', 'disabled');
				
				{/literal}
					{if $isAdmin === false}
						{literal}
						$('#nivel_acesso').attr('disabled', 'disabled');
						{/literal}
					{/if}
				{literal}
				
				{/literal}