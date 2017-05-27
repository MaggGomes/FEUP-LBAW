{include file='common/header.tpl'}

<head>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=desi6hiftg5yqtfrrkmlemy77km6yea6m7l7yjvdnkx93tpn"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<section class="central add-article-central">
    <div class="container add-article">
        <form action="../actions/action_add_article.php" method="post" class="form-group" enctype="multipart/form-data">
            <div class="add-article-header">
                <input type="text" name="title" class="form-control input-lg" placeholder="Title" required autocomplete="off">
                <input type="text" name="abstract" class="form-control input-lg" placeholder="Abstract" required autocomplete="off">
                <input type="file" name="articlePicture" class="form-control input-lg" required >
            </div>

            <div class="add-article-category">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked value="World">World
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option2" autocomplete="off" value="Sports">Sports
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option3" autocomplete="off" value="Technology">Technology
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option4" autocomplete="off" value="Politics">Politics
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option5" autocomplete="off" value="Culture">Culture
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="options" id="option6" autocomplete="off" value="Science">Science
                    </label>
                </div>
            </div>

            <div class="row col-lg-12 add-article-tags">
                <a href="#" class="col-md-2"><span class="glyphicon glyphicon-tags"></span> Add tag(s)</a>
                <input type="text" id="tags" name="tags" class="form-control input-lg" placeholder="Tags separated by spaces">
            </div>

            <div class="row">
                <div class="col-lg-12 add-article-textarea">
                    <textarea rows="10" name="body" class="col-lg-12" placeholder="Write your article"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary btn-block" >Publish</button>
                </div>
            </div>
        </form>
    </div>
</section>
{include file='common/footer.tpl'}
