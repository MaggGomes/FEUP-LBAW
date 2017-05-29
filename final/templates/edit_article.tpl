{include file='common/header.tpl'}

<head>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=desi6hiftg5yqtfrrkmlemy77km6yea6m7l7yjvdnkx93tpn"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<section class="central add-article-central">
    <div class="container add-article">
        <form action="../actions/edit_article.php" method="post" class="form-group" enctype="multipart/form-data">
            <div class="add-article-header">
                <input type="text" placeholder="Title" name="title" class="form-control input-lg" value="{$article.title}" required autocomplete="off">
                <input type="text" placeholder="Abstract" name="abstract" class="form-control input-lg" value="{$article.abstract}" required autocomplete="off">
                <input type="file" name="articlePicture" class="form-control input-lg" >
            </div>

            <div class="add-article-category">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary {if $article.category == 'World'} active {/if}">
                        <input type="radio" name="options" id="option1" autocomplete="off"
                        {if $article.category == 'World'}
                        checked
                        {/if} value="World">World
                    </label>
                    <label class="btn btn-primary {if $article.category == 'Sports'} active {/if}">
                        <input type="radio" name="options" id="option2" autocomplete="off"
                        {if $article.category == 'Sports'}
                        checked
                        {/if} value="Sports">Sports
                    </label>
                    <label class="btn btn-primary {if $article.category == 'Technology'} active {/if}">
                        <input type="radio" name="options" id="option3" autocomplete="off"
                        {if $article.category == 'Technology'}
                        checked
                        {/if} value="Technology">Technology
                    </label>
                    <label class="btn btn-primary {if $article.category == 'Politics'} active {/if}">
                        <input type="radio" name="options" id="option4" autocomplete="off"
                        {if $article.category == 'Politics'}
                        checked
                        {/if} value="Politics">Politics
                    </label>
                    <label class="btn btn-primary {if $article.category == 'Culture'} active {/if}">
                        <input type="radio" name="options" id="option5" autocomplete="off"
                        {if $article.category == 'Culture'}
                        checked
                        {/if} value="Culture">Culture
                    </label>
                    <label class="btn btn-primary {if $article.category == 'Science'} active {/if}">
                        <input type="radio" name="options" id="option6" autocomplete="off"
                        {if $article.category == 'Science'}
                        checked
                        {/if} value="Science">Science
                    </label>
                </div>
            </div>

            <div class="row col-lg-12 add-article-tags">
                <span class="glyphicon glyphicon-tags"></span> Tag(s)
                <input type="text" id="tags-edit" name="tags" class="form-control input-lg" value="{$article.tags}" placeholder="Tags separated by spaces">
            </div>

            <input type="text" name="articleid" value="{$article.id}" hidden="hidden">

            <div class="row">
                <div class="col-lg-12 add-article-textarea">
                    <textarea rows="10" name="body" class="col-lg-12" >{$article.content}</textarea>
                </div>
            </div>


            <div class="row">
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary btn-block" >Edit</button>
                </div>
            </div>

        </form>
    </div>

</section>


{include file='common/footer.tpl'}
