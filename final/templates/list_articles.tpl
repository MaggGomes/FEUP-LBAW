{foreach $articles as $article}
	<div class="row">
		<article class="col-xs-12 article-text">
			<div class="panel panel-default">
				<div class="panel-body article-text">
					<div class="profile-header-container">
						<div class="row">
							<div class="col-xs-10">
								<div class="profile-header-img">
									{if $article.userimage == NULL}
		                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/>
		                            {else}
		                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$article.userimage}"/>
		                            {/if}
								</div>
								<div class="article-publisher">
									<a href="../pages/read_article.php?id={$article.id}">
										<h4 class="article-author">{$article.title}</h4>
										<small>
											<a href="../pages/profile.php?id={$article.userId}">
												Publisher: {$article.name}
											</a>
										</small>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
{/foreach}
