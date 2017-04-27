{include file='common/header.tpl'}

<section class="central advanced-central">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form class="input-group" method="get" id="adv-search">
                    <input type="text" name="search" class="form-control input-lg" placeholder="Search for articles"/>
                    <div class="input-group-btn">
                        <div class="btn-group" role="group">
                            <div class="dropdown dropdown-lg">
                                <button type="button" id="advanced-dropdown" class="btn btn-default dropdown-toggle btn-lg" data-toggle="dropdown" aria-expanded="false"><span id="advanced-text">Advanced</span> <span class="caret"></span></button>
                                <div class="dropdown-menu dropdown-menu-right" role="menu">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="filter">Filter by</label>
                                            <select class="form-control">
                                                <option value="0" selected>All Articles</option>
                                                <option value="1">World</option>
                                                <option value="2">Sports</option>
                                                <option value="3">Technology</option>
                                                <option value="4">Politics</option>
                                                <option value="4">Culture</option>
                                                <option value="4">Science</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="contain">Author</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                        <div class="form-group">
                                            <label for="contain">Contains the words</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                        <div class="form-group">
                                            <label for="contain">Contains the tags</label>
                                            <input class="form-control" type="text" />
                                        </div>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row container-category-title">
            <h3 class="col-md-12">Results <span class="glyphicon glyphicon-menu-down"></span></h3>
        </div>
        <div class="list-group table-results">
            <div id="table-header" class="list-group-item list-group-item-info">
                <div class="row">
                    <a href="#" class="col-xs-3">Name</a>
                    <a href="#" class="col-xs-3">Category</a>
                    <a href="#" id="advanced-publisher" class="col-xs-3">Publisher</a>
                    <a href="#" class="col-xs-3">Rating</a>
                </div>
            </div>
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
					<a href="?pageNo={$pageNo-1}"><span class="glyphicon glyphicon-chevron-left"></span>Previous </a>
				{/if}
				&nbsp
				{if $limit == $articlesLength}
					<a href="?pageNo={$pageNo+1}">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
				{/if}
			</div>
        </div>
    </div>

</section>

{include file='common/footer.tpl'}
