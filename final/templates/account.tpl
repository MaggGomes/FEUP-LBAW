{include file='common/header.tpl'}

<section class="central">
    <div class="container">
        <div class="row account">
            <div class="col-md-3">
                {include file='account/accountOverview.tpl'}
            </div>

            <div class="col-md-6">
                <div id="page" class="account-content"></div>
            </div>

            <div class="account-recommended col-md-3">
                <div class="row container-category-title">
                    <h3 class="col-xs-12">Recommended <span class="glyphicon glyphicon-menu-down"></span></h3>
                </div>
                {include file='common/recommended_side.tpl'}
            </div>
        </div>
    </div>
</section>

{include file='common/footer.tpl'}