<div class="account-sidebar">
    <form id="advancedSearchForm">
        <div class="account-usertitle">
    		<label for="">Name</label>
    		<br>
            <input type="text" name="name" onkeyup="advancedSearch()" value="">
        </div>
        <div class="account-usermenu">

		    <label for="">Minimum Rating</label>
            <input type="range" name="minRating" value="0" min=0 max=5000 onchange="rangeValue.value = minRating.valueAsNumber;advancedSearch()">
            <output name="rangeValue" for="minRating">0</output>
            {if $info.permission != "Publisher"}
    			<label for="">User types</label>
    			<br>
                <input type="checkbox" name="publisher" onchange="advancedSearch()" value="true"> Publisher
    			<br>
    			<input type="checkbox" name="moderator" onchange="advancedSearch()" value="true"> Moderator
    			<br>
    			<input type="checkbox" name="administrator" onchange="advancedSearch()" value="true"> Administrator
            {/if}

    		<br>

    		<label for="">Users per page</label>
    		<select class="" name="limit" onchange="advancedSearch()">
    			<option value="10">10</option>
    			<option value="20">20</option>
    			<option value="50">50</option>
    		</select>

            <label for="">Order <body>
                <select class="" name="order" onchange="advancedSearch()">
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
