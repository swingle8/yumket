<%-- 
    Document   : index
    Created on : Jun 19, 2014, 4:19:49 PM
    Author     : singhals
--%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:if test="${sessionScope.usertype eq 'Admin'}">
    <c:redirect url="admin/cartadmin.jsp"/>
    </c:if>

    <c:if test="${sessionScope.usertype eq 'Restaurant'}">
    <c:redirect url="restaurant/restaurant.jsp"/>
    </c:if>


    
<%@ page isErrorPage="true" %>
<jsp:include page="header.jsp" />
 
<header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i></a> 
    <a> <i class="icon-list-alt" style=" opacity: 0.3"></i></a>
    <a> <i class="icon-food" style=" opacity: 0.3"></i></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i></a>
    
    
    
    <!-- <span class="pull-right" id="google_translate_element"></span> -->

</div>
<div  class="span6 mobile" >
<div class="pull-right">
        <form method="post" id="FormToValidate" action="tyo.jsp">
	<input class="span3" id="postcode" name="tyo_num" placeholder="TYO number" type="text"/>
	<button id="btnValidate" class="btn btn-large btn-success" type="submit">CHECK STATUS</button>
        </form>
</div>
</div>

    <!-- // more data -->

</div>
</div>
</div>
</div>   

    </header> 




<!-- Carousel
    ================================================== -->

        <div id="bodySection">
            <div class="container">
<p>${param.message}</p>                
<section id="mainCarousel">
<div class="row">
<div class="span12">
		<div id="myCarousel" class="carousel slide" >
			<div class="carousel-inner">

				<div class="item active">
					<img src="img/carousel/banner2.png" alt="Open For Lunch" >
				  </div>
				<div class="item ">
					<img src="img/carousel/banner1.png" alt="Open For Lunch" >
				  </div>
				<div class="item ">
					<img src="img/carousel/banner5_free_delivery.png" alt="Open For Lunch" >
				  </div>
				<div class="item ">
					<img src="img/carousel/banner6.png" alt="Open For Lunch" >
				  </div>
				<div class="item ">
					<img src="img/carousel/bombay_carousel_banner-new.png" alt="Open For Lunch" >
				  </div>

                            <div class="carousel-control">
                                <table align="center" style=" margin-left: 300px">
						<tr>
                                                    <td>
                                                            <select  style=" height: 60px ; opacity: 1" name="city">
                                                              <option selected="selected" >Select your city</option>
					                      <option value="delhi"> Delhi </option>
                                                            </select>
                                                      	</td>
                                                        <td>
                                                            <select onchange="window.location = this.options[this.selectedIndex].value;" style=" height: 60px" name="place">
					                      <option selected="selected">Select your place</option>
                                                              <option value="delhi.jsp?location=delhi&place=Aiims&service=Delivery&cuisine=&foodtype=Both&sort=userratings"> AIIMS </option>
                                                              <option value="delhi.jsp?location=delhi&place=Chandni-Chok&service=Delivery&cuisine=&foodtype=Both&sort=userratings"> Chandni Chok </option>
                                                              
                                                            </select>
							</td>
                                                        													
						</tr>					
				</table>	
             

               </div>

                        </div>
	</div>


</div>
	

</div>
</section>
            



                    <section id="featuredProduct">
        <div class="row">
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/Special%20Lemon%20Rice.jpg" alt="61. SPECIAL LEMON RICE (Serve 1)"></a>
                        <p class="item_name">61. SPECIAL LEMON RICE (Serve 1)</p>
						<span class ="item_id" style="display:none;">5</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">2.75</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/rsz_naan.jpg" alt="62. PLAIN NAAN"></a>
                        <p class="item_name">62. PLAIN NAAN</p>
						<span class ="item_id" style="display:none;">21</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">2.75</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/rsz_papadums_0.jpg" alt="74. PLAIN POPADOMS"></a>
                        <p class="item_name">74. PLAIN POPADOMS</p>
						<span class ="item_id" style="display:none;">38</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">0.65</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/peroni%20(1).jpg" alt="76. PERONI BEER 660ML"></a>
                        <p class="item_name">76. PERONI BEER 660ML</p>
						<span class ="item_id" style="display:none;">40</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">3.95</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/Paneetikka.jpg" alt="3. TANDOORI PANEER TIKKA ( recommended)"></a>
                        <p class="item_name">3. TANDOORI PANEER TIKKA ( recommended)</p>
						<span class ="item_id" style="display:none;">45</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">5.95</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                                <div class="span2 simpleCart_shelfItem">
                        <div class="well well-small">
                        <a class="displayImg item_add" href="javascript:;"><img src="upload/images/somosa-nepali.jpg" alt="4. VEGETABLE SAMOSA"></a>
                        <p class="item_name">4. VEGETABLE SAMOSA</p>
						<span class ="item_id" style="display:none;">46</span>
                        <a class="orderBtn item_add" href="javascript:;"><span class="price"><small>£</small><span class="item_price">3.5</span></span>  add to <i class="icon-shopping-cart"></i></a>
                        </div>
                </div>
                        </div>
</section>
						

					</div>
<div class="footer-top">
<div class="container">
		<div class="row">
		

<div class="span5">
<h3>Welcome to restaurent</h3>
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy 
text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. <br><br>
It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
</p>
	 <ul class="followUs">
        <li><a class="mail" href="contact.html" title="Email"></a></li>
        <li><a class="facebook qtip" href="#" target="_blank" title="facebook"></a></li>
        <li><a class="twitter" href="#" target="_blank" title="Twitter"></a></li>
    </ul>
</div>

<div class="span4">
<style>
.gallery a{width:18%}
</style>
  <h3>Our Food Gallery</h3>
    <div>
			<a href="img/img-gallery1.jpg" class="group320975601" title="Gallery1">
			<img src="img/img-gallery1-80x80.jpg" title="Gallery1">
			</a>
			<a href="img/img-gallery2.jpg" class="group320975601" title="Gallery2">
			<img src="img/img-gallery2-80x80.jpg" title="Gallery2">
			</a>
					<a href="img/img-gallery3.html" class="group320975601" title="Gallery3">
			<img src="img/img-gallery3-80x80.jpg" title="Gallery3">
			</a>
					<a href="img/img-gallery4.jpg" class="group320975601" title="Gallery4">
			<img src="img/img-gallery4-80x80.jpg" title="Gallery4">
			</a>
					<a href="img/img-gallery5.jpg" class="group320975601" title="Gallery5">
			<img src="img/img-gallery5-80x80.jpg" title="Gallery5">
			</a>
					<a href="img/img-gallery6.jpg" class="group320975601" title="Gallery6">
			<img src="img/img-gallery6-80x80.jpg" title="Gallery6">
			</a>
					<a href="img/img-gallery7.jpg" class="group320975601" title="Gallery7">
			<img src="img/img-gallery7-80x80.jpg" title="Gallery7">
			</a>
					<a href="img/img-gallery8.jpg" class="group320975601" title="Gallery8">
			<img src="img/img-gallery8-80x80.jpg" title="Gallery8">
			</a>
					<a href="img/img-gallery9.jpg" class="group320975601" title="Gallery9">
			<img src="img/img-gallery9-80x80.jpg" title="Gallery9">
			</a>
			<a href="img/img-gallery7.jpg" class="group320975601" title="Gallery7">
			<img src="img/img-gallery7-80x80.jpg" title="Gallery7">
			</a>
					<a href="img/img-gallery8.jpg" class="group320975601" title="Gallery8">
			<img src="img/img-gallery8-80x80.jpg" title="Gallery8">
			</a>
					<a href="img/img-gallery9.jpg" class="group320975601" title="Gallery9">
			<img src="img/img-gallery9-80x80.jpg" title="Gallery9">
			</a>
</div> 

</div>

		<div class="span3">
				<h3>Customer Reviews</h3>
				<p>
				"West Londoners are fortunate to have The Bombay Takeaway Club nearby. The chefs create both high-impact and delicate flavours that celebrate Indian's traditional cleverness with spices, 
				without relying on heavy, oily sauces. The food is fresh and familiar, but not formulaic- a genuine taste of India and Nepal to be relished at home. Order extra for leftovers- it just gets better!"
				</p>
				<p>
				<strong>- Celia Brooks </strong> <em>7th June, 2013</em>
				</p>
		</div>
	</div>
</div>
</div>


</div>
           
        
    
 <link href="css/jquery-ui-1.8.13.custom.css"   rel="stylesheet" type="text/css" />
 <link href="css/Site.css" rel="stylesheet" type="text/css" /> 
       
    
<script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.wrapper.js" type="text/javascript"></script>    

<script type="text/javascript" src="js/validation_index.js"></script>
    
      
<jsp:include page="footer.jsp" />
 

   
