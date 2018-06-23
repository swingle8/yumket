

<!-- Footer
    ================================================== -->
    

<div id="footer">
<div class="middleFooter">
<div class="container">
<div class="row">
<div class="span3">
	<h4>Contact Us</h4>
		<ul>
			<li>
				<span class="iconbox"> <i class="icon-map-marker"></i> </span>
				<span>Blah blah blah <br> 286 King St&lrm;
Banglore , INDIA</span>
			</li>
			<li><span class="iconbox"> <i class="icon-envelope-alt"></i> </span><span>Email: blah@blah.com</span></li>
		</ul>
</div>

<div class="span3">
		<h4>Customer Service</h4>
		<ul class="list">
		       
        <li><a href="menu.html">Main Menu </a> </li>
        <li><a href="contact.html">Contact Us</a> </li>
        <li><a href="about.html"> About Us</a></li>
		<li><a href="terms.html">Terms and Condition</a></li>
		</ul>
</div>
  
<div class="span3">
	<h4>My Account</h4>
		<ul class="list">
		<li><a href="index.jsp"> Home</a></li> 
		          <li><a href="register.html">SignUp </a></li>
        <li><a href="register.html">Login </a></li>
        		</ul>
</div>
				  
<div class="span3">
	<h4>Get Offer</h4>
		<p>
		Free subscription for our mind blowing offers. Dont miss it out !
		</p>

		<div class="navbar-form navbar-left">
			<div class="form-group">
			<input alt="username" class="span2" name="email" size="25" type="text" value="Type your email">
			<button class="btn btn-warning" type="submit">Send</button></div>
		</div>
	</div>

		</div>
	</div>
	</div>
	
	
	
<div id="powered">
		<div class="container">
			<div class="copyright pull-left">
			Blah blah blah, 286 King St&lrm;
                        Bangalore W6 0SP, INDIA © 2014 
			<br>Developed By <a href="#" title="Everest Web Solution">Blah blah</a>
			</div>
			<div class="paypal pull-right">
					<p><img alt="payment methods" src="img/logo-payment_methods.png"></p>
			</div>
		</div>
</div>
</div>


<a href="#mylogin" role="button" class="feedbackBtnR" data-toggle="modal">R<br>e<br>s<br>t<br>a<br>u<br>r<br>a<br>n<br>t<br> <br>l<br>o<br>g<br>i<br>n</a>

<div id="mylogin" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Restaurant Login</h4>
                </div>
                <div class="modal-body">
		
					<div class="cntr">
			<br>
	
                        <form class="form-horizontal" action="LoginCheck" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label id="label_userName" for="form_userName" class="control-label">Food-cart Id:</label>
			<td class="">   
<div class='controls'>
    <input type="text" name="userid" placeholder="Food-cart Id" style="width:284px" required="required" value="" />
</div>
		</div>

		<div class='control-group'>
		<label id="label_userAddress" for="form_userAddress" class="control-label">Password:</label>
			<td class="">   
                            <div class='controls'><input type="password" placeholder="Password" name="password" value="" style="width: 284px" required="required" /></div>
		</div>
		
                            <div class='control-group'>
                                Remember me:
			    <input type="checkbox" name="rememberme" id="remember-me" />
		  </div>
                        
								
                            <input type="submit" class="btn btn-success" value="Login"><br><br>
                        </form>
                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>









<a href="#myModal" role="button" class="loginBtnL" data-toggle="modal">A<br>d<br>d<br> <br>R<br>e<br>s<br>t<br>r<br>a<br>u<br>r<br>a<br>n<br>t</a>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Add your restraurant</h4>
                </div>
                <div class="modal-body">
		
					<div class="cntr">
        <form class="form-horizontal" action="RequestAddRestraurant" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label id="label_userName" for="form_userName" class="control-label">Restaurant name:</label>
			<td class="">   
<div class='controls'>
    <input type="text" name="restaurantname" placeholder="Restaurant name" style="width:284px" required="required" value="" />
</div>
		</div>

		<div class='control-group'>
		<label id="label_userAddress" for="form_userAddress" class="control-label">Location:</label>
			<td class="">   
                            <div class='controls'><input type="text" placeholder="Location" name="location" value="" style="width: 284px" required="required" id="form_userAddress" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userPhone" for="form_userPhone" class="control-label">City:</label>
			<td class="">   
                            <div class='controls'><select style="width: 284px" required="required" name="city" >
                                    <option value="Delhi">Delhi</option>
                                    
                                </select>
                                 </div>
		</div>

		<div class='control-group'>
		<label id="label_userPostcode" for="form_userPostcode" class="control-label">Contact name:</label>
			<td class="">   
<div class='controls'><input value="" name="contactname" placeholder="Contact name" required="required" style="width: 284px" type="text" id="form_userPostcode"/></div>
		</div>

		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Contact number:</label>
			<td class="">   
<div class='controls'><input type="text" name="contactnumber" placeholder="contact number" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userEmail" for="form_userEmail" class="control-label">E-mail:</label>
			<td class="">   
<div class='controls'><input type="text" name='contactemail'  placeholder="E-mail address" style="width: 284px" required="required" id="form_userEmail" value="" /></div>
		</div>

		<div class='control-group'>
		
			<td class="">   
                            <div class='controls'><input type="submit" value="Done" class="btn btn-large btn-success" id="signin-btn" /></div>
		</div>


		</form>                      
                                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>



</body>
</html>