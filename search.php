<?php include("inc/header.php");?>
		
		<div class="row contentarea"> <!-- content section start --> 
			
			<div class="col-md-9 content"> <!-- main content section start -->
			<?php 
					if(isset($_GET['submit']))
					{
					
				
					if(!isset($_GET['s'])||$_GET['s']==null)
					{
					echo" <h1>You didn't type anything</h1>";
					
					}
					else
					{
					$pattern=$_GET['s'];
					$q=mysqli_query($con,"SELECT * FROM blog_post WHERE title LIKE '%$pattern%' or content LIKE '%$pattern%' or tags LIKE '%$pattern%'");
					$re=mysqli_num_rows($q);
					if($re>0)
					{
					while($result=mysqli_fetch_array($q))
					{
					?>
			<div class="samepost clear">
				<h2 class="post-title"><a href="single.php?id=<?php echo$result['id'];?>"><?php echo$result['title'];?></a></h2>
				<i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($result['date']));?> <i class="fa fa-folder"> </i> <a href="category.php?catid=<?php echo$result['category'];?>"> <?php echo$result['category'];?> </a> <i class="fa fa-comments"></i><a href="comments.php?commentid=<?php echo$result['id'];?>">  <?php echo$result['comments'];?> </a>
				 <a href=""><img src="admin/upload/<?php echo$result['image'];?>" class="img img-responsive img-thumbnail"alt=""width="125px"height="110px"/>
			<span class="fa overlay-icon"></span>
			</a>
				<p>
					<?php echo substr($result['content'],0,500);?><a id="readmore"href="single.php?id=<?php echo$result['id'];?>">Read More »</a>
				</p>
			</div>
			<?php 
			}
			}
			else 
			{
				echo"Nothing found";
			}
			}
			}
			?>
			
		
			

			
			</div><!-- main content section close -->
			
			
			<?php include("inc/sidebar.php");?>
			
			
		</div><!-- content section close -->
	<?php include("inc/footer.php");?>