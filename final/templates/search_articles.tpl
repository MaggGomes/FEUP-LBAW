{foreach $articles as $article}
	<div class="row">
		<article class="col-xs-12 article-text">
			<div class="panel panel-default">
				<div class="panel-body article-text article-result" onclick="location.href='../pages/read_article.php?id={$article.id}'">
					<div class="profile-header-container">
						<div class="row">
							<div class="col-xs-10">
								<div class="profile-header-img">
									{if $article.userimage == NULL}
		                                <a href="{$BASE_URL}pages/profile.php?id={$article.userid}"><img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/></a>
									{else}
										{if strpos($article.userimage, '://')}
											<a href="{$BASE_URL}pages/profile.php?id={$article.userid}"><img class="img-circle" src="{$article.userimage}"/></a>
										{else}
											<a href="{$BASE_URL}pages/profile.php?id={$article.userid}"><img class="img-circle" src="{$BASE_URL}upload/user_profile/{$article.userimage}"/></a>
										{/if}
		                            {/if}
								</div>
								<div class="article-publisher">
									<a href="{$BASE_URL}pages/read_article.php?id={$article.id}">
										<h4 class="article-author">{$article.title}</h4>
										<small>
											<a href="{$BASE_URL}pages/profile.php?id={$article.userid}">
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
