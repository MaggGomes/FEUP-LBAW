<div class="row container-category-title">
	<h3 class="col-xs-12">Most Recent <span class="glyphicon glyphicon-menu-down"></span></h3>
</div>
<div class="list-group">
	{foreach $mostRecent as $mostRecentArticle}
    <a href="read_article.php?id={$mostRecentArticle.id}" class="list-group-item">
        <h4 class="list-group-item-heading">{$mostRecentArticle.title}</h4>
        <p class="list-group-item-text">{$mostRecentArticle.abstract}</p>
		{if $mostRecentArticle.daydiff > 0}
        	<small class="text-muted">{$mostRecentArticle.daydiff} days ago</small>
		{elseif $mostRecentArticle.hourdiff > 0}
			<small class="text-muted">{$mostRecentArticle.daydiff} hours ago</small>
		{else}
			<small class="text-muted">{$mostRecentArticle.minutediff} minutes ago</small>
		{/if}
    </a>
	{/foreach}
    </a>
</div>
