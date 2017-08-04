<?php 
include("inc/header.php");
?>
		
		<div class="row contentarea"> <!-- content section start --> 
			
			<div class="col-md-9 content"> <!-- main content section start -->
		<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<?php 
		if(isset($_POST['send']))
		{
			$name		=$_POST['Name'];
			$email		=$_POST['Email'];
			$contact	=$_POST['Mobile'];
			$sub		=$_POST['Subject'];
			$msg		=$_POST['Message'];
			$q=mysqli_query($con,"INSERT INTO blog_contact (name,email,mobile,subject,message) VALUES ('$name','$email','$contact','$sub','$msg')");
			if($q)
			{
				echo"Contact details sent successfully!";
			}
			else
			{
				echo"Contact details not sent!";
			}
		}
		?>
		<h2 id="contact-form">Contact Form</h2>
			<form action="" method="post"name="myform"class="form" onsubmit="return validateform()">
				
				<label for="name" class="col-xs-3 control-label">Name</label>
				<input type="text" class="form-control" id="name" name="Name"placeholder="name">
				<label for="email" class="col-xs-3 control-label">E-mail</label>
				<input type="email" class="form-control" id="email" name="Email" placeholder="email">
				<label for="mobile" class="col-xs-3 control-label">Mobile</label>
				<input type="text" class="form-control" id="mobile" name="Mobile" placeholder="mobile number">
				<label for="subject" class="col-xs-3 control-label">Subject</label>
				<input type="text" class="form-control" id="subject" name="Subject" placeholder="subject">
				<label for="message" class="col-xs-3 control-label">Message</label>
				<textarea name="Message" class="form-control" id="message" cols="30" rows="10"placeholder="Enter message here..."></textarea>
				<button type="submit" name="send"class="btn btn-default submit">Submit</button>
				
			
			</form>
			</div>
			
			
			
			<div class="col-md-2"></div>
		</div>
			
			</div><!-- main content section close -->
			<div class="col-md-3"> <!-- content sidebar start -->
			<h2 id="address">Address</h2>
			<address>Bahubal R/A,<br/>Road No:02, House No:01,Shahporan Gate,Khadim Nagar,Sylhet.<br/>
			E-mail:akmalhossain307@gmail.com<br/>
			</address>
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d115820.44337407804!2d91.8689542559371!3d24.884714408081578!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3750533dd53e27c5%3A0x895ba75fb29dd1ae!2stmss+ict+innovation+center%2C+sylhet!5e0!3m2!1sen!2s!4v1496299320165" width="280" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
			
			</div>
			<!-- content sidebar close -->
			
		</div><!-- content section close -->
	<div class="row footerarea"> <!-- footer section start -->
	
	
		<div class="col-md-4"><p>&copy; Copyright 2017, All Rights Reserved</p>  </div>
		<div class="col-md-6">Footer section two </div>
		<div class="col-md-2 socialicons">
		<a class="ttip-none" title="Google+" href="https://plus.google.com/u/1/" target="_blank">
		<i class="fa fa-google-plus"></i>
		</a>
		<a class="ttip-none" title="Facebook" href="https://www.facebook.com/akmal.hossain.33" target="_blank">
		<i class="fa fa-facebook"></i>
		</a>
		<a class="ttip-none" title="Twitter" href="https://twitter.com/" target="_blank">
		<i class="fa fa-twitter"></i>
		</a>
		<a class="ttip-none" title="Youtube" href="https://www.youtube.com/dashboard?o=U" target="_blank">
		<i class="fa fa-youtube"></i>
		</a>
</div>
	</div><!-- footer section close -->
		
  </div>
  
  
  <script type="text/javascript">
   <!--
      // Form validation code will come here.
      function validateform(){  

var Name=document.myform.Name.value;  
 
var Mobile=document.myform.Mobile.value;  
var Subject=document.myform.Subject.value;  
var Email=document.myform.Email.value;  
var Message=document.myform.Message.value;  
  
  var emailID = document.myform.Email.value;
         atpos = emailID.indexOf("@");
         dotpos = emailID.lastIndexOf(".");
		 
	 if(Name==""||Name.length<4){  
  alert("Name can't be empty and should be at least 4 characters long!");  
   document.myform.Name.focus() ;
  return false;
	
  } 
  if(Subject==""||Subject.length<4){  
  alert("Subject can't be empty and should be at least 4 characters long!");  
   document.myform.Subject.focus() ;
  return false;
	
  }
  if(Message==""||Message.length<4){  
  alert("Plz Write something!");  
   document.myform.Message.focus() ;
  return false;
	
  } 	 
		 
 if (atpos < 1 || ( dotpos - atpos < 2 )||emailID=="null"||emailID=="") 
         {
            alert("Please provide a valid email");  
            document.myform.Email.focus() ;
            return false;
         } 
		 
		 if(Mobile == "" ||
         isNaN(Mobile ) ||
         Mobile.length != 11 )
         {
		alert("Please provide a valid mobile number");  
            document.myform.Mobile.focus() ;
            return false;
         }
 
 

} 
   //-->
</script>
  
  
  
  
  <!-- JavaScript: placed at the end of the document so the pages load faster -->
  <!-- JQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>