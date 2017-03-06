<head>
    <script src="http://cloud.tinymce.com/stable/tinymce.min.js?apiKey=desi6hiftg5yqtfrrkmlemy77km6yea6m7l7yjvdnkx93tpn"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<section class="central">
    <div class="container">
        <article id="addrestaurant">
            <div class="sectiondescription">
                <h3>New article<h3>
            </div>
            <article class="box row">
                <form action="../actions/action_add_restaurant.php" method="post" class="row">
                    <div class="col-lg-12">
                        <h4>Title</h4>
                        <input type="text" name="title" class="col-lg-12" placeholder="Article title" required>
                    </div>
                    <div class="col-lg-12">
                        <h4>Field</h4>
                        <textarea rows="10" name="body" class="col-lg-12" required></textarea>
                    </div>
                    <div class="col-lg-12 ">
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
                        <input type="text" class="col-lg-12" name="tags">
                    </div>
                    <div class="col-lg-12">
                        <button type="submit" class="btn btn-primary btn-block" disabled>Create article</button>
                    </div>
                </form>
            </article>
        </article>
    </div>
</section>
