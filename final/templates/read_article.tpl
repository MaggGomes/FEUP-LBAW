{include file='common/header.tpl'}

<section class="central read-article-central">
    <div class="container">
        <div class="row">
            <article class="col-lg-9 article-text">
                {include file='common/article.tpl'}
            </article>
            <div class="col-lg-3">
                {include file='common/recommended_side.tpl'}
            </div>
        </div>
        <div class="row">
            {if $smarty.session.id != null}
                <div class="col-md-8 col-md-offset-2 col-lg-7 col-lg-offset-1 comment-article">
                    <form action="../actions/add_comment.php" method="post">
                        <input class="form-control comment-text" type="text" placeholder="Write a comment..."
                               name="comment">
                        <input type="text" name="idarticle" value="{$article.id}" hidden="hidden">
                        <button class="btn btn-primary" type="submit">Comment</button>
                    </form>
                </div>
            {/if}
            <div class="container-category-title">
                <h3 class="col-md-12">{sizeof($comments)} Comments <span class="glyphicon glyphicon-menu-down"></span></h3>
            </div>
        </div>
    </div>
</section>

{include file='common/footer.tpl'}
