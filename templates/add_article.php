<head>
    <script src="http://cloud.tinymce.com/stable/tinymce.min.js?apiKey=desi6hiftg5yqtfrrkmlemy77km6yea6m7l7yjvdnkx93tpn"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<section class="central">
    <div class="container add-article">
        <form action="../actions/action_add_article.php" method="post" class="form-group">
            <div class="add-article-header">
                <input type="text" name="title" class="form-control input-lg" placeholder="Title" required autocomplete="off">
                <input type="text" name="title" class="form-control input-lg" placeholder="Abstract" required autocomplete="off">
            </div>


            <div class="add-article-category">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked>World
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option2" autocomplete="off">Sports
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option3" autocomplete="off">Technology
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option4" autocomplete="off">Politics
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option5" autocomplete="off">Culture
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option6" autocomplete="off">Science
                    </label>
                </div>
            </div>

            <div class="row add-article-tags">
                <a href="#" class="col-md-2"><span class="glyphicon glyphicon-tags"></span> Add a tag</a>
            </div>

            <div class="row">
                <div class="col-lg-12 add-article-textarea">
                    <textarea rows="10" name="body" class="col-lg-12" required>Write your article!</textarea>
                </div>
            </div>


            <div class="row">
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary btn-block" disabled>Publish</button>
                </div>
            </div>





        </form>
    </div>


    <!--
    <div class="container">
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
    </div>-->


</section>
