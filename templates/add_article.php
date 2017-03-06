<head>
    <script src="http://cloud.tinymce.com/stable/tinymce.min.js?apiKey=desi6hiftg5yqtfrrkmlemy77km6yea6m7l7yjvdnkx93tpn"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<section class="central">


    <div class="container panel panel-default">
        <article id="add-article">
            <div class="container row">
                <form action="../actions/action_add_article.php" method="post" class="row form-group">
                    <div class="add-article-header">
                        <div class="container row">
                            <div class="col-md-12">
                                <input type="text" name="title" class="form-control input-lg" placeholder="Title" required>
                            </div>
                        </div>
                        <div class="container row">
                            <div class="col-md-12">
                                <input type="text" name="title" class="form-control input-lg" placeholder="Description" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 add-article-category">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active radio-inline">
                                <input type="radio" name="options" id="option1" autocomplete="off" checked>World
                            </label>
                            <label class="btn btn-primary radio-inline">
                                <input type="radio" name="options" id="option2" autocomplete="off">Sports
                            </label>
                            <label class="btn btn-primary radio-inline">
                                <input type="radio" name="options" id="option3" autocomplete="off"> Technology
                            </label>
                            <label class="btn btn-primary radio-inline">
                                <input type="radio" name="options" id="option4" autocomplete="off">Politics
                            </label>
                            <label class="btn btn-primary radio-inline">
                                <input type="radio" name="options" id="option5" autocomplete="off">Culture
                            </label>
                            <label class="btn btn-primary radio-inline">
                                <input type="radio" name="options" id="option6" autocomplete="off">Science
                            </label>
                        </div>
                    </div>

                    <div class="container row add-article-tagsphoto">
                        <a href="#" class="col-md-2"><span class="glyphicon glyphicon-tags"></span> Add tag</a>
                        <a href="#" class="col-md-2"><span class="glyphicon glyphicon-camera"></span> Add photo</a>
                    </div>

                    <div class="col-lg-12 add-article-textarea">
                        <textarea rows="10" name="body" class="col-lg-12" required></textarea>
                    </div>

                    <div class="container row">
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary btn-block" disabled>Publish</button>
                        </div>
                    </div>
                </form>
            </div>
        </article>
    </div>




   <!-- <div class="container">
        <article id="addrestaurant">
            <div class="sectiondescription">
                <h3>New article<h3>
            </div>
            <article class="row">
                <form action="../actions/action_add_restaurant.php" method="post" class="row">
                    <div class="col-lg-12">
                        <h4>Title</h4>
                        <input type="text" name="title" class="form-control col-lg-12" placeholder="Article title" required>
                    </div>
                    <div class="col-lg-12">
                        <h4>Field</h4>
                        <textarea rows="10" name="body" class="col-lg-12" required></textarea>
                    </div>
                    <div class="col-lg-12">
                        <h4>Category</h4>
						<div class="row">
	                        <div class="col-md-2">
	                            <label class="radio-inline">
	                                <input type="radio" name="category" value="Sports" required>Sports
	                            </label>
	                        </div>
	                        <div class="col-md-2">
	                            <label class="radio-inline">
	                                <input type="radio" name="category" value="Science" required> Science
	                            </label>
	                        </div>
	                        <div class="col-md-2">
	                            <label class="radio-inline">
	                                <input type="radio" name="category" value="Politics" required> Politics
	                            </label>
	                        </div>
	                        <div class="col-md-2">
	                            <label class="radio-inline">
	                                <input type="radio" name="category" value="Health" required>Health
	                            </label>
	                        </div>
	                        <div class="col-md-2">
	                            <label class="radio-inline">
	                                <input type="radio" name="category" value="Tech" required>Tech
	                            </label>
	                        </div>
	                    </div>
					</div>
                    <div class="col-lg-12">
                        <h4>Tags</h4>
                        <input type="text" class="form-control col-lg-12" name="tags">
                    </div>
                    <div class="col-lg-12">
                        <button type="submit" class="btn btn-primary btn-block" disabled>Create article</button>
                    </div>
                </form>
            </article>
        </article>
    </div>-->
</section>
