<%@ page import="java.sql.*"%>
<%@ page import="com.ibm.dao.EMallDAO"%>
<%@ page import="com.ibm.models.CartModel"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | Net-Mall</title>
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
</head><!--/head-->

<body>
<%! CartModel[] cm = new CartModel[10];
int x = 0, sum=0;
%>

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
								<li><a href="Account.jsp"><i class="fa fa-user"></i>Hi ${fname}</a></li>
								<li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="#"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="Cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
								<li><a href="#">Baby & Kids</a></li>
								<li><a href="#">Books</a></li>
								<li><a href="#">Home & Kitchen</a></li>
								<li><a href="#">Offers Zone</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			
			<script src="jquery.min.js"></script>
					<script>
						$(document).ready(function(){
						//alert("inside jquery");
						var holder=$("#holder");
						var number=$("#number");
						var cvv=$("#cvv");
					
						
						$("#holder").blur(function()
						{
						    var letters = /^[A-Za-z ]+$/;
						   
							if(holder.val().match(letters))  
							{ 
							   $("#hol").html("<font color='green'></font>");
							}  
							
							else
							{  
							   $("#hol").html("<font color='red'>Only Alphabets are allowed</font>");  
							   holder.val("");         	
				         	   holder.focus();
				         	}
						});


						$("#canu").blur(function()
						   {
							    var numbers = /^[0-9]+$/;
							    
								if(!canu.val().match(numbers))  
								{ 			
								   $("#cn").html("<font color='red'>Only Numbers are allowed</font>");
								   canu.val("");
								   canu.focus();
								}   
								
								else if(canu.val().length != 16)
								{
								   $("#cn").html("<font color='red'>CVV must be 16 digits</font>");
								   canu.val("");  
							       canu.focus();
								}
								
								else
								{  
					               $("#cn").html("<font color='green'></font>");									  
							    }
							});	
						
					   
					   		   $("#cvv").blur(function()
							   {
								    var numbers = /^[0-9]+$/;
								    
									if(!cvv.val().match(numbers))  
									{ 			
									   $("#cv").html("<font color='red'>Only Numbers are allowed</font>");
									   cvv.val("");
									   cvv.focus();
									}   
									
									else if(cvv.val().length != 3)
									{
									   $("#cv").html("<font color='red'>CVV must be 3 digits</font>");
									   cvv.val("");  
								       cvv.focus();
									}
									
									else
									{  
						               $("#cv").html("<font color='green'></font>");									  
								    }
							   });
					   
						});				
					</script>
			
			
			
			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Shopper Information</p>
							<form>
								<input type="text" placeholder="Display Name">
								<input type="text" placeholder="User Name">
								<input type="password" placeholder="Password">
								<input type="password" placeholder="Confirm password">
							</form>
							
							<a class="btn btn-primary" href="#">Continue</a>
						</div>
					</div>
					
					
					
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>Bill To</p>
							<div class="form-one">
								<form>
									<input type="text" placeholder="Company Name">
									<input type="text" placeholder="Email*">
									<input type="text" placeholder="Title">
									<input type="text" placeholder="First Name *">
									<input type="text" placeholder="Middle Name">
									<input type="text" placeholder="Last Name *">
									<input type="text" placeholder="Address 1 *">
									<input type="text" placeholder="Address 2">
								</form>
							</div>
							<div class="form-two">
								<form>
									<input type="text" placeholder="Zip / Postal Code *">
									<select>
										<option>-- Country --</option>
										<option>United States</option>
										<option>Bangladesh</option>
										<option>UK</option>
										<option>India</option>
										<option>Pakistan</option>
										<option>Ucrane</option>
										<option>Canada</option>
										<option>Dubai</option>
									</select>
									<select>
										<option>-- State / Province / Region --</option>
										<option>United States</option>
										<option>Bangladesh</option>
										<option>UK</option>
										<option>India</option>
										<option>Pakistan</option>
										<option>Ucrane</option>
										<option>Canada</option>
										<option>Dubai</option>
									</select>
									<input type="password" placeholder="Confirm password">
									<input type="text" placeholder="Phone *">
									<input type="text" placeholder="Mobile Phone">
									<input type="text" placeholder="Fax">
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>Shipping Order</p>
							<textarea name="message"  placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
							<label><input type="checkbox"> Shipping to bill address</label>
						</div>	
					</div>					
				</div>
			</div>
			<div class="table-responsive cart_info">
			<%
							
								CartModel cobj = (CartModel)session.getAttribute("cobj");
								if(cobj != null)
								{
									cm[x]=cobj;
									x++;
									session.removeAttribute("cobj");
								}
%>
				<form>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image"><center><b>Item</b></center></td>
							<td class="description"><b>Description</b></td>
							<td class="price"><b>Price</b></td>
							<td class="quantity"><b>Quantity</b></td>
							<td class="total"><b>Total</b></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<%
					int i;
					for(i=0;i<x;i++)
					{
					%>
						<tr>
							<td class="cart_product">
								<a href=""><img src="
								<%
									if(cm[i].getItemid().equals("IT01"))
										out.println("images/cart/one.jpg");
									else if(cm[i].getItemid().equals("IT02"))
										out.println("images/cart/two.jpg");
									else if(cm[i].getItemid().equals("IT03"))
										out.println("images/cart/three.jpg");
									else if(cm[i].getItemid().equals("IT04"))
										out.println("images/cart/four.jpg");
									else if(cm[i].getItemid().equals("IT05"))
										out.println("images/cart/five.jpg");
									else
										out.println("images/cart/six.jpg");
								%>" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%out.println(cm[i].getItemname());%></a></h4>
								<p><%out.println("Item Id : "+cm[i].getItemid());%></p>
							</td>
							<td class="cart_price">
								<p>$<%out.println(cm[i].getItemprice());%></p>
							</td>
							<td class="cart_quantity">
							
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<!--<form action="QtyUpdateServlet" method="post">
									<input type="hidden" name="updateBtn" value="+"/>&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default add-to-cart">+</button>
									</form>-->
									<input class="cart_quantity_input" type="text" name="quantity" value="<%out.println(cm[i].getItemqty());%>" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
									<!--<form action="QtyUpdateServlet" method="post">
									<input type="hidden" name="updateBtn" value="-"/>&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default add-to-cart">-</button>
									</form>-->
								</div>
		
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%out.println(cm[i].getItemprice());%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<%
					}
						%>
						

						<!--<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/two.jpg" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/three.jpg" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>-->
					</tbody>
				</table>
				
				</form>

			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Payment Procedure</h3>
				
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
						<%
						
						for(i=0;i<x;i++)
						{
							sum+=cm[i].getItemprice();
						}
					%>
							<li>Cart Sub Total <span><%=sum%></span></li>
							<li>Eco Tax <span>$2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span><%=sum+2%></span></li>
						</ul>
						
							
					</div>
				</div>
				
			
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Payment Details</h2>
												
						<form action="CheckoutServlet" method="post">
							<select name="Card Type">
								<option value="State Bank of India (VISA)">State Bank of India (VISA)</option>
								<option value="Bank of Baroda">Bank of Baroda</option>
								<option value="Axis Bank">Axis Bank</option>
								<option value="HDFC Bank">HDFC Bank</option>
								<option value="United Commercial Bank">United Commercial Bank</option>
							</select>
							<input type="text" placeholder="Card Holder Name" name="holder" value='' id="holder"/><p id="hol"></p>
							<input type="text" placeholder="Card Number" name="canu" value='' id="canu"/><p id="cn"></p>
							<input type="password" placeholder="CVV" name="cvv" value='' id="cvv"/><p id="cv"></p>
							<input type="date" placeholder="Date" name="date" value='' id="date"/><p id="dt"></p>
							
						 	<table>
								<td><img src="http://netmall.mybluemix.net/CaptchaServlet"/><a href="Login.jsp">Refresh</a></td>
								<td><input type="text" placeholder="Enter the above Code" name="code"/><h9><font color='red'>${msg2}</font></h9></td>
								
							</table> 
							
							<button type="submit" class="btn btn-default">Make Payment</button>
						</form>
						
						
					</div><!--/login form-->
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