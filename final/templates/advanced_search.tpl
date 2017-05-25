{include file='common/header.tpl'}

<section class="row central advanced-central">


		<div class="col-md-3">
			<div class="account-sidebar">
				<form class="" id="advancedSearchForm">

					<label for="">Article title</label>
					<br>
					<input type="text" name="search" class="form-control" placeholder="Search for articles" onkeyup="advancedSearch()" value="{$search}"/>

					<div class="form-group">
						<label for="filter">Filter by</label>
						<select class="form-control" onchange="advancedSearch()">
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
						<input class="form-control" onkeyup="advancedSearch()" type="text" />
					</div>
					<div class="form-group">
						<label for="contain">Contains the words</label>
						<input class="form-control" onkeyup="advancedSearch()" type="text" />
					</div>
					<div class="form-group">
						<label for="contain">Contains the tags</label>
						<input class="form-control" onkeyup="advancedSearch()" type="text" />
					</div>

					<label for="">Order by</label>
					<select class="" name="order" onchange="advancedSearch()">
						<option value="az">Alphabetical A-Z</option>
						<option value="za">Alphabetical Z-A</option>
						<option value=""></option>
					</select>

					<br>

					<label for="">Articles per page</label>
					<select class="" name="" onchange="advancedSearch()">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>

					<br>

					<label for="">Page</label>
					<select class="" name="" onchange="advancedSearch()">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</form>
			</div>
		</div>

		<div class="col-md-9">
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
		</div>
</section>

{include file='common/footer.tpl'}
