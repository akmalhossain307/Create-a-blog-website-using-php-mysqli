<?php include("inc/header.php");?>
		
		<div class="row contentarea"> <!-- content section start --> 
			
			<div class="col-md-9 content"> <!-- main content section start -->
			
			<?php 
			if(!isset($_GET['id']))
			{
				header("location: 404.php");
			}
			else 
			{
			$postID=$_GET['id'];
			
			$q=mysqli_query($con,"SELECT * FROM blog_post WHERE id=$postID");
			while($result=mysqli_fetch_array($q))
			{
				
				if($result['image']=="")
				{
				
				//for counting popular posts
				
					$pp_count=$result['pp_count'];
					$pp_count++;
					$postID=$result['id'];
					$pp_q=mysqli_query($con,"UPDATE blog_post SET pp_count=$pp_count WHERE id=$postID");
					
					
					
				
				
				
				
				
				
				
				?>
			<div class="samepost clear">
				<h2 class="post-title"><?php echo$result['title'];?></h2>
				<i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($result['date']));?> <i class="fa fa-folder"></i> <a href="category.php?catid=<?php echo$result['category'];?>"> <?php echo$result['category'];?> </a> <i class="fa fa-comments"></i> <a href="comments.php?commentid=<?php echo$result['id'];?>">  <?php echo$result['comments'];?> </a>
				
				<p>
					<?php echo$result['content'];?>
				</p>
			</div>
			<?php 
				}
				else
				{
					//for counting popular posts
				
					$pp_count=$result['pp_count'];
					$pp_count++;
					$postID=$result['id'];
					$pp_q=mysqli_query($con,"UPDATE blog_post SET pp_count=$pp_count WHERE id=$postID");
				
				?>
			<div class="samepost clear">
				<h2 class="post-title"><?php echo$result['title'];?></h2>
				<i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($result['date']));?> <i class="fa fa-folder"></i> <a href="category.php?catid=<?php echo$result['category'];?>"> <?php echo$result['category'];?> </a> <i class="fa fa-comments"></i> <a href="comments.php?commentid=<?php echo$result['id'];?>">  <?php echo$result['comments'];?> </a>
				 <a href=""><img src="admin/upload/<?php echo$result['image']; ?>" class="img img-responsive img-thumbnail"alt=""width="700px"height="500px"/>
			<span class="fa overlay-icon"></span>
			</a>
				<p>
					<?php echo$result['content'];?>
				</p>
			</div>
					
					
					<?php 
					
				}
			?>
			
			<h2 id="relatedpost">Related Posts:</h2>
			<hr id="line"/>
			<div class="row rpost"> 
			<?php
			/* if(isset($_GET['id']))
			{ */
			$cat=$result['category'];
			$cat_q=mysqli_query($con,"SELECT * FROM blog_post WHERE category='$cat'");
			while($re=mysqli_fetch_array($cat_q))
			{
				if($re['image']=="")
				{
			?>
			
				<div class="col-md-4">
				<a href="single.php?id=<?php echo$re['id'];?>"><h3><?php echo$re['title'];?></h3></a>
				</div>
				
				<?php 
				}
				else 
				{
				?>
				<div class="col-md-4">
				<a href=""><img src="admin/upload/<?php echo$re['image'];?>" alt="" class="img img-responsive img-thumbnail"/></a>
				<a href="single.php?id=<?php echo$re['id'];?>"><h3><?php echo$re['title'];?></h3></a>
				</div>
				
				<?php 				
				}	
				
				
			}
			/* } */
				?>
				
				<br /> 
				<br /> 
				
				
				<div class="col-md-12">
				
					<div class="row"> 
					<div class="col-md-1"></div>
					<div class="col-md-10">
					
					<h2><?php 
					if($result['comments']=='0')
					{
					?>
				Comment:<?php echo$result['comments'];
					}
					else
					{
					?>
					
					Comments:(<?php echo$result['comments'];
						 
					}
				?>
				)
				
					</h2><br />
					
					
					<form action="" method="post">
						<div class="form-group">
						<label for="author_name">Username</label>
						<input type="text" class="form-control" id="author" name="user"required>
						</div>
						<div class="form-group">
						<label for="author_name">Comment</label>
						<textarea name="comment" id="" cols="30" rows="10"class="form-control" placeholder="Enter your comment here..."required></textarea>
						</div>
						<div class="form-group">
						<input type="submit" style="background:green;color:white"class="form-control"value="Post Comment"id="comment" name="cmt">
						</div>
					</form>
					</div>
					<div class="col-md-1"></div>
					</div>
					</div>
					<br />
					<br />
					
					<?php 
					if(isset($_POST['cmt']))
					{
					$cmt_id=$result['id'];
					$blog_user=$_POST['user'];
					$comment=$_POST['comment'];
					$cmt_insert=mysqli_query($con,"INSERT INTO blog_comments (cmt_id,user,comment,status) VALUES ('$cmt_id','$blog_user','$comment','0')");
					$cmt_number=$result['comments'];
					if($cmt_insert)
						{
							$cmt_number++;
							echo"<script>alert('Thanks! Your comment taken for Moderation')</script>";
							//echo"<script>window.location='user_reg.php'</script>";
							$update_cmt_num=mysqli_query($con,"UPDATE blog_post SET comments='$cmt_number' WHERE id=$cmt_id");
							echo"<script>window.location='index.php'</script>";	
						}
						else 
						{
						echo"<script>alert('Comment Failed! Plz try Again')</script>";	
						}
						
						
						
					/* 
					$q=mysqli_query($con,"SELECT * FROM blog_comment");
					while($re=mysqli_fetch_array($q))
					{
						if(!$re['username']==$blog_user)
						{
							echo"<script>alert('Plz signup first to post comment')</script>";
							echo"<script>window.location='user_reg.php'</script>";
						}
						else
						{
							
						$que=mysqli_query($con,"INSERT INTO blog_comment (post_id,comment,username) VALUES ('$postID','$comment','$blog_user')");
						if($que)
						{
							@$result['comments']++;
							$increment=$result['comments']; 
							echo"<script>alert('Thanks for commenting! Your comment will be published after Moderation')</script>";
							$qqq=mysqli_query($con,"UPDATE blog_post SET comments=$increment WHERE id=$postID");
							echo"<script>window.location='single.php';</script>";
							
						}
						else
						{
							echo"<script>alert('Sorry! Something went wrong with your comment. Plz try again.')</script>";
							
						}
						
						}
					} */
					}
					
					?>
					
					<div class="row">
					
				
					
			
					
					
					
					<?php 
					if(isset($_GET['id']))
					{
					 $cmt_id=$_GET['id'];
					 $sel_cmt=mysqli_query($con,"SELECT * FROM blog_comments WHERE cmt_id=$cmt_id AND status=1");
					while($com=mysqli_fetch_array($sel_cmt))
					{
						?>
						
						
						
	<article class="row">
            <div class="col-md-1 col-sm-1 hidden-xs"> 
            </div>
            <div class="col-md-10 col-sm-10">
			
			 
              <div class="panel panel-default arrow left">
                <div class="panel-body">
                  <header class="text-left">
                    <div class="comment-user"><i class="fa fa-user"></i> <?php echo$com['user'];?></div>
                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($com['date']));?></time>
                  </header>
                  <div class="comment-post">
                    <p>
                   <?php echo$com['comment'];?>
                    </p>
                  </div>
         
				  
                </div>
              </div>
			  
            </div>
			<div class="col-md-1 col-sm-1 hidden-xs"> 
            </div>
          </article>
		  
		  
						
						
						<?php 
					}
				?>

				<?php 
					
					}
					?>
					
				
					
				



				
					
					
					
					
					
					
					
					
				</div>
					
					
				
				
					<?php 
					
					
					}
					}
					?>
					
					
					
					
		
					
					
					
					
					
					
					
					
					
			</div>

			
			</div><!-- main content section close -->
			
			
			<?php include("inc/sidebar.php");?>
			
			
		</div><!-- content section close -->
	<?php include("inc/footer.php");?>