<?php include("inc/header.php");?>
		
		<div class="row contentarea"> <!-- content section start --> 
			
			<div class="col-md-9 content"> <!-- main content section start -->
			<?php 
			
			if(isset($_GET['catid']))
			{
			$catid=$_GET['catid'];
			
			$q=mysqli_query($con,"SELECT * FROM blog_post WHERE category='$catid'AND status=1 ORDER BY id DESC LIMIT 10");
			while($result=mysqli_fetch_array($q))
			{
				if($result['image']=="")
				{
					
				?>
				
			<div class="samepost samepost1 clear">
				<h2 class="post-title"><a href="single.php?id=<?php echo$result['id'];?>"><?php echo$result['title'];?></a></h2>
				<i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($result['date']));?> <i class="fa fa-folder"> </i> <a href="category.php?catid=<?php echo$result['category'];?>"> <?php echo$result['category'];?> </a> <i class="fa fa-comments"></i><a href="comments.php?commentid=<?php echo$result['id'];?>">  <?php echo$result['comments'];?> </a>
				
				<p>
					<?php echo substr($result['content'],0,250);?><a id="readmore"href="single.php?id=<?php echo$result['id'];?>"> Read More...</a>
				</p>
			</div>
			<?php 
			}
			else
			{
			?>
			
			<div class="samepost samepost1 clear">
				<h2 class="post-title"><a href="single.php?id=<?php echo$result['id'];?>"><?php echo$result['title'];?></a></h2>
				<i class="fa fa-clock-o"></i> <?php echo date('F d,Y',strtotime($result['date']));?> <i class="fa fa-folder"> </i> <a href="category.php?catid=<?php echo$result['category'];?>"> <?php echo$result['category'];?> </a> <i class="fa fa-comments"></i><a href="comments.php?commentid=<?php echo$result['id'];?>">  <?php echo$result['comments'];?> </a>
				 <a href=""><img src="admin/upload/<?php echo$result['image'];?>" class="img img-responsive img-thumbnail"alt=""width="300px"height="300px"/>
			<span class="fa overlay-icon"></span>
			</a>
				<p>
					<?php echo substr($result['content'],0,250);?><a id="readmore"href="single.php?id=<?php echo$result['id'];?>"> Read More...</a>
				</p>
			</div>
			
			<?php 
			}
			}
			}
			
			
			?>

			<div class="col-md-3"></div>
		
			
			
			
			</div><!-- main content section close -->
			
			
			<?php include("inc/sidebar.php");?>
			
			
			
		</div><!-- content section close -->
	
	<?php include("inc/footer.php");?>