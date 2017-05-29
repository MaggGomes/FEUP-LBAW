{foreach $articles as $article}
<a href="../pages/read_article.php?id={$article.id}" class="list-group-item list-group-item-action">

    <div class="row">
        <div class="col-xs-3">{$article.title}</div>
        <div class="col-xs-3">{$article.category}</div>
        <div class="col-xs-3">{$article.name}</div>
        <div class="col-xs-3">{$article.rating}</div>
    </div>
</a>
{/foreach}
<br>
<div align="center">
    {if $pageNo > 0}
        <button type="button" name="button" class="btn btn-link" onclick="accountPageNumber--; articleSearch()"><span class="glyphicon glyphicon-chevron-left"></span>Previous </button>
    {/if}
    &nbsp
    {if $limit == $articlesLength}
        <button type="button" name="button" class="btn btn-link" onclick="accountPageNumber++; articleSearch()">Next <span class="glyphicon glyphicon-chevron-right"></span></button>
    {/if}
</div>
