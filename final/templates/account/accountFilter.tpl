<<<<<<< Updated upstream
<div class="row">
    <div class="account-sidebar">
        <form id="advancedSearchForm">
            <div class="account-usertitle">
                <label for="">Name</label>
                <br>
                <input type="text" name="name" onkeyup="advancedSearch()" value="">
            </div>
            <div class="account-usermenu">

                <label for="">Minimum Rating</label>
                <input type="range" name="minRating" value="0" min=0 max=5000 onchange="rangeValue.value = minRating.valueAsNumber;accountPageNumber=0; advancedSearch()">
                <output name="rangeValue" for="minRating">0</output>

                <br>

                <label for="">Users per page</label>
                <select class="" name="limit" onchange="advancedSearch()">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                </select>


            <label for="">Order <body>
                <select class="" name="order" onchange="accountPageNumber=0; advancedSearch()">
                        <option value="1">A <i class="fa fa-arrow-right" aria-hidden="true"></i>
                            Z </option>
                        <option value="2">Z <i class="fa fa-arrow-right" aria-hidden="true"></i>
                            A </option>
                        <option value="3">Higher Rating <i class="fa fa-arrow-down" aria-hidden="true"></i></option>
                        <option value="4">Lower Rating <i class="fa fa-arrow-up" aria-hidden="true"></i></option>
                    </select>
                    </body></label>

            </div>
        </form>
    </div>
</div>
