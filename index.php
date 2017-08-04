<?php include("inc/header.php");?>
		
		<div class="row contentarea"> <!-- content section start --> 
			
			<div class="col-md-9 content"> <!-- main content section start -->
			
			<?php 
			$per_page=5;
			if(isset($_GET['page']))
			{
				$page=$_GET['page'];
			}
			else
			{
				$page=1;
			}
			$start_from=($page-1)*$per_page;
			$sel_query=mysqli_query($con,"SELECT * FROM blog_post WHERE status=1 ORDER BY id DESC LIMIT $start_from,$per_page");
			while($result=mysqli_fetch_array($sel_query))
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
			?>
			
			<div class="col-md-3"></div>
			
			
			
			<?php 
			$query=mysqli_query($con,"SELECT * FROM blog_post WHERE status=1");
			$num_of_results=mysqli_num_rows($query);
			$total_pages=ceil($num_of_results/$per_page);
			
			
			for($i=1;$i<=$total_pages;$i++)
				{
					if($i==$page)
					{
						$current_page=$i;
					}
				}
			
			$prev_btn=$current_page-1;
			$next_btn=$current_page+1;
			
			
			?>
			
			
			
			
			
			
			<nav>
				<ul class="pagination">
				<?php 
				if($page<=1)
				{
				?>
			
				<li class="disabled">
				<a href="" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
				<?php 
				}
				else
				{
					?>
					<li>
				<a href="index.php?page=<?php echo$prev_btn;?>" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
					<?php 
				}
				?>
				
				<?php 
				for($i=1;$i<=$total_pages;$i++)
				{
					if($i==$page)
					{
				?>
				<li class="active"><a href="index.php?page=<?php echo$i;?>"><?php echo$i;?></a></li>
				<?php 
				}
				else
				{
				?>
				<li><a href="index.php?page=<?php echo$i;?>"><?php echo$i;?></a></li>
				<?php 				
				}
				
				}
				?>
				
				
				<?php 
				if($page>=$total_pages)
				{
				?>
				<li class="disabled">
				<a href="" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
				</li>
				<?php 
				}
				else
				{
					?>
					<li>
					<a href="index.php?page=<?php echo$next_btn;?>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
					<?php 
				}
				?>
				</ul>
			</nav>
			
			

			
			</div><!-- main content section close -->
			
			
			<?php include("inc/sidebar.php");?>
			
			
			
		</div><!-- content section close -->
	
	<?php include("inc/footer.php");?>