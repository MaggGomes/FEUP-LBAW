{include file='common/header.tpl'}

<section class="row central advanced-central">

		<div class="col-md-3">
			<div class="account-sidebar">
				<form class="" id="advancedSearchForm" oninput="accountPageNumber=1; articleSearch()">

					<label for="">Article title</label>
					<br>
					<input type="text" name="title" class="form-control" placeholder="Search for articles" value="{$search}"/>

					<div class="form-group">
						<label for="filter">Filter by</label>
						<select name="category" class="form-control">
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
						<input name="author" class="form-control" type="text" />
					</div>
					<div class="form-group">
						<label for="contain">Contains the words</label>
						<input name="content" class="form-control" type="text" />
					</div>
					<div class="form-group">
						<label for="contain">Contains the tags</label>
						<input name="tags" class="form-control" type="text" />
					</div>

					<label for="">Order by</label>
					<select class="" name="order">
						<option value="1">Alphabetical A-Z</option>
						<option value="2">Alphabetical Z-A</option>
                        <option value="3">Higher Rating First</option>
						<option value="4">Lower Rating First</option>
						<option value=""></option>
					</select>

					<br>

					<label for="">Articles per page</label>
					<select class="" name="limit">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>

					<br>
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
                    <div id="advancedResults">
                        {include file="advancedResults.tpl"}
                    </div>

		        </div>
		    </div>
		</div>
</section>

{include file='common/footer.tpl'}
