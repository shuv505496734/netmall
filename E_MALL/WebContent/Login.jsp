<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | Net-Mall</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css">
    </style>
</head><!--/head-->

<body>

	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i>24x7 Call Centre</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>Track Order</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="https://www.facebook.com/netmall2015"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
				  <div class="col-sm-4">
				    <div align="center"><span class="search_box pull-right">
				      <input name="text" type="text" placeholder="Search" width="1000"/>
				    </span>
			        </div>
				    <div class="logo pull-left">
				      <p><a href="Home.jsp"><img src="images/home/logo.png" alt="" width="125" height="35" /></a> </p>
			        </div>
				  </div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="Login.jsp"><i class="fa fa-user"></i>MyAccount</a></li>
								<li><a href="Login.jsp"><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="Checkout.jsp"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="Cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li class="dropdown"><a href="#">Electronics<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">Laptops </a></li>
										<li><a href="#">Televisions </a></li>
										<li><a href="#">Air Conditions</a></li>
										<li><a href="#">Refrigerators </a></li>
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Men<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">Formal Shirts</a></li>
										<li><a href="#">Jeans</a></li>
										<li><a href="#">Trousers</a></li>
										<li><a href="#">Footwear</a></li>
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Women<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">Shirts & Tops</a></li>
										<li><a href="#">Jeans</a></li>
										<li><a href="#">Sarees</a></li>
										<li><a href="#">Kurta & Kurti</a></li>
										<li><a href="#">Footwear</a></li>
                                    </ul>
                                </li> 
								<li><a href="index.html">Baby & Kids</a></li>
								<li><a href="index.html">Books</a></li>
								<li><a href="index.html">Home & Kitchen</a></li>
								<li><a href="index.html">Offers Zone</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right"></div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<h9><font color='red'>${msg1}</font></h9>
						<h9><font color='green'>${msg6}</font></h9>
						<h9><font color='red'>${msg9}</font></h9>
						<h9><font color='green'>${msg10}</font></h9>
						<form action="LoginServlet" method="post">
							<input type="email" placeholder="Email Address" name="email" />
							<input type="password" placeholder="Password" name="pwd" />
							
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							<br><br><a href ="ForgotPassword.jsp">Forgot Password?</a>
							
							<button type="submit" class="btn btn-default">Login</button>
						</form>
						
						<br>
						<h2>Admin Login</h2>
						<h9><font color='red'>${msg1}</font></h9>
						<h9><font color='green'>${msg6}</font></h9>
						<h9><font color='green'>${msg12}</font></h9>						
						<form action="AdminLoginServlet" method="post">
							<input type="email" placeholder="Email Address" name="aemail" />
							<input type="password" placeholder="Password" name="apwd" />
							
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
					
					<script src="jquery.min.js"></script>
					<script>
						$(document).ready(function(){
						//alert("inside jquery");
						var fname=$("#fname");
						var lname=$("#lname");
						var email=$("#email");
						var pwd=$("#pwd");
						var rpwd=$("#rpwd");
						var phone=$("#phone");
						var street=$("#street");
						var city=$("#city");
						var state=$("#state");
						var zip=$("#zip");
						
						$("#fname").blur(function()
						{
						    var letters = /^[A-Za-z]+$/;
						   
							if(fname.val().match(letters))  
							{ 
							   $("#fn").html("<font color='green'></font>");
							}  
							
							else
							{  
							   $("#fn").html("<font color='red'>Only Alphabets are allowed</font>");  
							   fname.val("");         	
				         	   fname.focus();
				         	}
						});

						$("#lname").blur(function()
						{
						    var letters = /^[A-Za-z ]+$/;
					   		if(lname.val().match(letters))  
							{ 
				   			   $("#ln").html("<font color='green'></font>");
							} 
					   		
							else
							{  
							   $("#ln").html("<font color='red'>Only Alphabets are allowed</font>");  
				         	   lname.val("");
				         	   lname.focus();
				         	}
						});
						
						
						$("#email").blur(function()
						{
						    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
							if(email.val().match(mailformat))  
							{
							   $("#em").html("<font color='green'></font>");
							}  
						
							else
							{  
							   $("#em").html("<font color='red'>Not a valid Email Address</font>");
							   email.val("");  
				         	   email.focus();
				         	}
						});

						$("#pwd").blur(function()
						{
							if(pwd.val().length<7)  
							{ 
							   $("#pd").html("<font color='red'>Password length must be more than 6</font>");
							   pwd.val("");
							   pwd.focus();
							}  
							else
							{  
							   $("#pd").html("<font color='green'></font>");  
				            }
				       });
						
					   $("#rpwd").blur(function()
					   {
						   if(pwd.val()!=rpwd.val())
						   {
							   $("#rpd").html("<font color='red'>Password does not match </font>");
							   rpwd.val("");
							   rpwd.focus();
							}
							
							else
							{  
							   $("#rpd").html("<font color='green'></font>");  
					        }
					   });
 

					   $("#phone").blur(function()
					   {
						    var numbers = /^[0-9]+$/;
						    
							if(!phone.val().match(numbers))  
							{ 			
							   $("#ph").html("<font color='red'>Only Numbers are allowed</font>");
							   phone.val("");
							   phone.focus();
							}   
							
							else if(phone.val().length != 10)
							{
							   $("#ph").html("<font color='red'>Phone Number must be 10 digits</font>");
							   phone.val("");  
						       phone.focus();
							}
							
							else
							{  
				               $("#ph").html("<font color='green'></font>");									  
						    }
						});
						
					   
						$("#street").blur(function()
						{
						   var letters = /^[A-Za-z ]+$/; 
						   
						   if(street.val().match(letters))  
						   {
							  $("#str").html("<font color='green'></font>");
						   } 
						   
						   else
						   {  
							  $("#str").html("<font color='red'>Only Alphabets are allowed</font>");  
							  street.val("");         	
				         	  street.focus();
				           }
						});
						
						$("#city").blur(function()
						{
						   var letters = /^[A-Za-z ]+$/; 
						   
						   if(city.val().match(letters))  
					       {
							  $("#ct").html("<font color='green'></font>");
						   } 
						   
						   else
						   {  
							  $("#ct").html("<font color='red'>Only Alphabets are allowed</font>");  
							  city.val("");         	
				         	  city.focus();
				           }
						});

						
						$("#state").blur(function()
						{
						   var letters = /^[A-Za-z ]+$/;
						   
						   if(state.val().match(letters))  
						   {
							  $("#sta").html("<font color='green'></font>");
						   }
						   
						   else
						   {  
							  $("#sta").html("<font color='red'>Only Alphabets are allowed</font>");  
							  state.val("");         	
				         	  state.focus();
				           }
						});

						
						$("#zip").blur(function()
						{
						    var numbers = /^[0-9]+$/;
						    
							if(!zip.val().match(numbers))  
							{ 			
							   $("#zp").html("<font color='red'>Only Numbers are allowed</font>");
							   zip.val("");
							   zip.focus();
							} 
							
							else if(zip.val().length != 6)
							{
							   $("#zp").html("<font color='red'>Zip must be of 6 digits</font>");
							   zip.val("");  
				       	       zip.focus();
							}
							
							else
							{  
							   $("#zp").html("<font color='green'></font>");										  
				         	}
						});	
						
						
					/*	$("#code").blur(function()
								{
								   //var letters = /^[A-Za-z ]+$/;
								  
								   if(code.val().match())  
								   {
									  $("#cd").html("<font color='green'></font>");
								   }
								   
								   else
								   {  
									  $("#cd").html("<font color='red'>Only Alphabets are allowed</font>");  
									  state.val("");         	
						         	  state.focus();
						           }
								});*/

							
					  });
				 </script>
					
						<h2>New User Signup!</h2>
						<h9><font color='red'>${msg}</font></h9>
						<h9><font color='green'>${msg5}</font></h9>
						
						<form action="RegServlet" method="post">
							<select name="gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
							<input type="text" placeholder="First Name" name="fname" value='${fname}' id="fname"/><p id="fn"></p>
							<input type="text" placeholder="Last Name" name="lname" value='${lname}' id="lname"/><p id="ln"></p>					
							<input type="email" placeholder="Email Address" name="email" value='${email}' id="email"/><p id="em"></p>
							<input type="password" placeholder="Password" name="pwd" id="pwd"/><p id="pd"></p>
							<input type="password" placeholder="Reenter Password" name="rpwd" id="rpwd"/><p id="rpd"></p>
							<input type="text" placeholder="Phone" name="phone" value='${phone}' id="phone"/><p id="ph"></p>
							<input type="text" placeholder="Street" name="street" value='${street}' id="street"/><p id="str"></p>
							<input type="text" placeholder="City" name="city" value='${city}' id="city"/><p id="ct"></p>
							<input type="text" placeholder="State" name="state" value='${state}' id="state"/><p id="sta"></p>
							<input type="text" placeholder="Zip" name="zip" value='${zip}' id="zip"/><p id="zp"></p>
							
							<table>
								<td><img src="http://netmall.mybluemix.net/CaptchaServlet"/><a href="Login.jsp">Refresh</a></td>
								<td><input type="text" placeholder="Enter the above Code" name="code"/><h9><font color='red'>${msg2}</font></h9></td>
								
							</table>
							<br>
							<button type="submit" class="btn btn-default">SignUp</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span class="style1">n</span>et-mall</h2>
							<p>THE ONLINE MEGA STORE</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>24/6 Sector 211, New Dehli, India</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">Change Location</a></li>
								<li><a href="">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-Shirt</a></li>
								<li><a href="">Mens</a></li>
								<li><a href="">Womens</a></li>
								<li><a href="">Gift Cards</a></li>
								<li><a href="">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privecy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Careers</a></li>
								<li><a href="">Store Location</a></li>
								<li><a href="">Affillate Program</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About NETMALL</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2015 NET-MALL Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.shuvrajyoti-debroy.com">Net Mall Pvt. Ltd.</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>