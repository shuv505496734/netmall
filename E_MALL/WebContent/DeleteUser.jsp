<%@ page import="java.sql.*"%>
<%@ page import="com.ibm.dao.EMallDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>AdminAccount | Net-Mall</title>
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
				      <p><a href="home.jsp"><img src="images/home/logo.png" alt="" width="125" height="35" /></a> </p>
			        </div>
				  </div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="Settings.jsp"><i class="fa fa-user"></i>Hi ${fname}</a></li>
								<li><a href="Logout.jsp"><i class="fa fa-lock"></i> Logout</a></li>
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
	
	<%
		Connection con=EMallDAO.connect();
		String sql = "select * from Customer";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		out.println("<form action='AdminDelUserServlet' method='post'>");
	%>
	
	
		<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3 class="style1">ADMIN CONTROL PANEL</h3>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><a href="AdminAccount.jsp">DISPLAY ALL USERS</a></h3>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><a href="DispSingUser.jsp">DISPLAY SELECTED USER</a></h3>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><a href="DeleteUser.jsp">DEACTIVATE ACCOUNT</a></h3>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Deactivate User Information</h2>
						<form>
							<table width="1200">
								<tr>
								<td></td>
									
								
									<td><left><b>CID</b></left></td>
									<td><left><b>GENDER</b></left></td>
									<td><left><b>FNAME</b></left></td>
									<td><left><b>LNAME</b></left></td>									
									<td><left><b>EMAIL</b></left></td>
									<td><left><b>PHONE</b></left></td>
									<td><left><b>STREET</b></left></td>
									<td><left><b>CITY</b></left></td>
									<td><left><b>STATE</b></left></td>
									<td><left><b>ZIP</b></left></td>
								</tr>
								<tr>
								<td></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>									
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
								</tr>
								
								<%
									while(rs.next())
									{
								%>
								
								<tr>
								<td>
									<% 
										out.println("<input type='checkbox' name='ch1' value='"+rs.getString(1)+"'></input>");
									%>
								</td>

									
									<td><left><%out.println(rs.getString(1));%></left></td>
									<td><left><%out.println(rs.getString(2));%></left></td>
									<td><left><%out.println(rs.getString(3));%></left></td>
									<td><left><%out.println(rs.getString(4));%></left></td>
									<td><left><%out.println(rs.getString(5));%></left></td>
									<td><left><%out.println(rs.getString(7));%></left></td>
									<td><leftr><%out.println(rs.getString(8));%></left></td>
									<td><left><%out.println(rs.getString(9));%></left></td>
									<td><left><%out.println(rs.getString(10));%></left></td>
									<td><left><%out.println(rs.getString(11));%></left></td>
								</tr>
														
								<%
									}
								%>
								<tr>
								<td></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>									
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
									<td><left><b>&nbsp;</b></left></td>
								</tr>
															
							</table>
							<button type="submit" class="btn btn-default">Delete</button>	
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
	
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