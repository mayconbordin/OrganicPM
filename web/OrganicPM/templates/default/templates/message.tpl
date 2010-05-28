			{if $msgType == "error"}
			<div class="clear-msg"></div>
			<div class="error-message message-{$msgVis}">
				<p>{$msgText}</p>
			</div>
			<div class="clear-msg"></div>
			{/if}
			{if $msgType == "sucess"}
			<div class="clear-msg"></div>
			<div class="sucess-message message-{$msgVis}">
				<p>{$msgText}</p>
			</div>
			<div class="clear-msg"></div>
			{/if}
			{if $msgType == "warning"}
			<div class="clear-msg"></div>
			<div class="warning-message message-{$msgVis}">
				<p>{$msgText}</p>
			</div>
			<div class="clear-msg"></div>
			{/if}
			{if $msgType == "info"}
			<div class="clear-msg"></div>
			<div class="info-message message-{$msgVis}">
				<p>{$msgText}</p>
			</div>
			<div class="clear-msg"></div>
			{/if}