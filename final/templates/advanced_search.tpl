{include file='common/header.tpl'}

<section class="central advanced-central">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="input-group" id="adv-search">
                    <input type="text" class="form-control input-lg" placeholder="Search for articles"/>
                    <div class="input-group-btn">
                        <div class="btn-group" role="group">
                            <div class="dropdown dropdown-lg">
                                <button type="button" id="advanced-dropdown" class="btn btn-default dropdown-toggle btn-lg" data-toggle="dropdown" aria-expanded="false"><span id="advanced-text">Advanced</span> <span class="caret"></span></button>
                                <div class="dropdown-menu dropdown-menu-right" role="menu">
                                    <form class="form-horizontal" role="form">
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
                                    </form>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </div>
                    </div>
                </div>
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
                    <a href="#" class="col-xs-3">Rating</a>
                    <a href="#" id="advanced-publisher" class="col-xs-3">Publisher</a>
                    <a href="#" class="col-xs-3">Views</a>
                </div>
            </div>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Short</div>
                    <div class="col-xs-3">4.95</div>
                    <div class="col-xs-3">Rui Andrade</div>
                    <div class="col-xs-3">83</div>
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Small</div>
                    <div class="col-xs-3">4.34</div>
                    <div class="col-xs-3">Chaler Albin</div>
                    <div class="col-xs-3">59</div>
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Small</div>
                    <div class="col-xs-3">4.34</div>
                    <div class="col-xs-3">Chaler Albin</div>
                    <div class="col-xs-3">59</div>
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Small</div>
                    <div class="col-xs-3">4.34</div>
                    <div class="col-xs-3">Chaler Albin</div>
                    <div class="col-xs-3">59</div>
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Small</div>
                    <div class="col-xs-3">4.34</div>
                    <div class="col-xs-3">Chaler Albin</div>
                    <div class="col-xs-3">59</div>
                </div>
            </a>
            <a href="#" class="list-group-item list-group-item-action">
                <div class="row">
                    <div class="col-xs-3">Big Small</div>
                    <div class="col-xs-3">4.34</div>
                    <div class="col-xs-3">Chaler Albin</div>
                    <div class="col-xs-3">59</div>
                </div>
            </a>


        </div>
    </div>

</section>

{include file='common/footer.tpl'}