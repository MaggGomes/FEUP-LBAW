{include file='common/header.tpl'}

<section class="central">
    <div class="container">
        <div class="row">
            <article class="col-lg-9 article-text">
                <div class="panel panel-default">
                    <div class="panel-body article-text">
                        <div class="page-header">
                            <div class="profile-header-container">
                                <div class="row">
                                    <div class="col-xs-10">
                                        <div class="profile-header-img">
                                            {if $article.userimage == NULL}
                                                <img class="img-circle" src="../upload/user_profile/default.png" />
                                            {else}
                                                <img class="img-circle" src="../upload/user_profile/{$article.userimage}" />
                                            {/if}
                                        </div>
                                        <div class="article-publisher">
                                            <a href="../pages/profile.php?id={$article.userid}"><h4 class="article-author">{$article.username}</h4></a>
                                            <small>March 1</small>
                                        </div>
                                    </div>
                                    <div class="col-xs-2 small-text">
                                        <div class="dropdown horizontal-menu">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#report-article" data-toggle="modal"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                                <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>{$article.title}</h3>
                        <img class="article-image" src="../upload/articles/{$article.articleimage}">
                        <p>{$article.content}</p>
                    </div>
                    <div class="panel-footer article-footer">
                        <div class="row article-footer-upper">
                            <div class="col-xs-12 small-text">
                                <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
                            </div>
                        </div>
                        <div class="row article-footer-lower">
                            <div class="col-xs-5">
                                <a href="#"><span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> 30 &nbsp&nbsp</span></a>
                                <a href="#"><span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> 10</span></a>
                            </div>
                            <div class="col-xs-7">
                                <div class="pull-right">
                                    <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                                    <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>

            <div class="col-lg-3">
                <div class="row container-category-title">
                    <h3 class="col-xs-12">Recommended <span class="glyphicon glyphicon-menu-down"></span></h3>
                </div>
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

{include file='common/footer.tpl'}