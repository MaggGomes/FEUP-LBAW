<div class="account-sidebar">
    <div class="account-usertitle">
		<label for="">Name</label>
		<br>
        <input type="text" name="name" value="">
    </div>
    <div class="account-usermenu">

		<label for="">Rating</label>
        <input type="range" name="" value="">
        {if $info.permission != "Publisher"}
			<label for="">User types</label>
			<br>
            <input type="checkbox" name="publisher" value=""> Publisher
			<br>
			<input type="checkbox" name="moderator" value=""> Moderator
			<br>
			<input type="checkbox" name="administrator" value=""> Administrator
        {/if}

		<br>

		<label for="">Users per page</label>
		<select class="" name="">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="50">50</option>
		</select>

		<br>

		<label for="">Page</label>
		<select class="" name="">
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
    </div>

</div>
