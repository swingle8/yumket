<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->
<jsp:include page="header.jsp" />
<div class="container">
    <p>${param.message}</p><br>
    <p>${param.id}</p><br>
    <p>${param.password}</p>
    <div class="row">
    <div class="span3 sidebar" style="width:580px;height:auto;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<h4><center><font color="red">Add New Restaurant</font></center></h4>

    <form enctype='multipart/form-data' id="registrationForm" class="form-horizontal" action="../AddRestaurant" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label class="control-label">Restaurant Name(No white space, first letter capital)</label>
			<td class="">   
<div class='controls'><input type="text" name="Restaurant_Name" placeholder="Restaurant Name" style="width:290px" required="required" id="form_userName" value="" /></div>
		</div>

        
		<div class='control-group'>
		<label class="control-label">Street Name:</label>
			<td class="">   
                            <div class='controls'><input type="text" name="Street_Name" placeholder="Street Name" value='' style="width: 284px" required="required" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">Location:</label>
			<td class="">   
                            <div class='controls'>
                               <select style="width: 284px" required="required" name="rest_location" >
                                    <option value="Chandni-Chok">Chandni-Chok</option>
                                </select> 
                            </div>
		</div>


		<div class='control-group'>
		<label class="control-label">Restaurant Phone(Mobile):</label>
			<td class="">   
<div class='controls'><input value="" name="Restaurant_Phone1" required="required" placeholder="Restaurant Phone(Mobile)" style="width: 284px" type="text" /></div>
		</div>

        
		<div class='control-group'>
		<label class="control-label">Restaurant Phone(Mobile):</label>
			<td class="">   
<div class='controls'><input value="" name="Restaurant_Phone2" placeholder="Restaurant Phone(Mobile)" style="width: 284px" type="text" /></div>
		</div>
        
        
		<div class='control-group'>
		<label class="control-label">Restaurant Landline:</label>
			<td class="">   
<div class='controls'><input value="" name="Restaurant_Landline" required="required" placeholder="Restaurant Landline" style="width: 284px" type="text" /></div>
		</div>
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Owner Name:</label>
			<td class="">   
<div class='controls'><input type="text" name="Owner_Name" placeholder="Owner Name" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>

        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Minimum delivery cost:</label>
			<td class="">   
<div class='controls'><input type="text" name="Minimum_delivery_cost" placeholder="Minimum delivery cost" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Minimum order cost:</label>
			<td class="">   
<div class='controls'><input type="text" name="Minimum_order_cost" placeholder="Minimum order cost" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Restaurant open time(HHMM):</label>
			<td class="">   
<div class='controls'><input type="text" name="Restaurant_open_time" placeholder="Restaurant open time(HHMM)" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Restaurant close time(HHMM):</label>
			<td class="">   
<div class='controls'><input type="text" name="Restaurant_close_time" placeholder="Restaurant close time(HHMM)" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>
        
        
        <div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">E-mail Id:</label>
			<td class="">   
<div class='controls'><input type="text" name="restaurant_email" placeholder="E-mail Id" style="width: 284px" required="required" value="" /></div>
		</div>
        
        <div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Password:</label>
			<td class="">   
<div class='controls'><input type="password" name="restaurant_password" placeholder="Password" style="width: 284px" required="required" value="" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">Restaurant Image:</label>
			<td class="">   
<div class='controls'><input type="file" name="Restaurant_Image"  style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">Service type:</label>
			<td class="">   
<div class='controls'>
                     <select style="width: 284px" required="required" name="service_type">
                                    <option value="Delivery">Delivery</option>
                                    <option value="Pickup">Pickup</option>
                                </select> </div>
                </div>
        
          
	<div class='control-group'>
		<label class="control-label">Cuisine type:</label>
			<td class="">   
<div class='controls'>
                <input type="checkbox" name="biryani" value="Biryani," >  Biryani<br>
                 <input type="checkbox" name="chinese" value="Chinese," >  Chinese<br>
                 <input type="checkbox" name="continental" value="Continental,">  Continental<br>
                 <input type="checkbox" name="cuisinetype" value="Fast-Food," >  Fast Food (Wraps, Burgers & more)<br>
                 <input type="checkbox" name="hyderabadi" value="Hyderabadi," >  Hyderabadi<br>
                 <input type="checkbox" name="italian" value="Italian," >  Italian<br>
                 <input type="checkbox" name="japanese" value="Japanese," >  Japanese<br>
                 <input type="checkbox" name="mexican" value="Mexican," >  Mexican<br>
                 <input type="checkbox" name="middleeastern" value="Middle-Eastern," >  Middle Eastern<br>
                 <input type="checkbox" name="northindian" value="North-Indian-Mughlai," >  North Indian - Mughlai<br>
                 <input type="checkbox" name="panasian" value="Pan-Asian,">  Pan-Asian<br>
                 <input type="checkbox" name="pizza" value="Pizza,">  Pizza<br>
                 <input type="checkbox" name="saladssandwiches" value="Salads-Sandwiches,">  Salads & Sandwiches<br>
                 <input type="checkbox" name="southindian" value="South-Indian," >  South Indian<br>

                 <input type="hidden" name="biryani" value="" > 
                 <input type="hidden" name="chinese" value="" >
                 <input type="hidden" name="continental" value="">
                 <input type="hidden" name="cuisinetype" value="" >
                 <input type="hidden" name="hyderabadi" value="" >
                 <input type="hidden" name="italian" value="" >
                 <input type="hidden" name="japanese" value="" >
                 <input type="hidden" name="mexican" value="" >
                 <input type="hidden" name="middleeastern" value="" >
                 <input type="hidden" name="northindian" value="" >
                 <input type="hidden" name="panasian" value="">  
                 <input type="hidden" name="pizza" value="">
                 <input type="hidden" name="saladssandwiches" value=""> 
                 <input type="hidden" name="southindian" value="" >

</div>
                </div>

        
                
	<div class='control-group'>
		<label class="control-label">Food type:</label>
			<td class="">   
<div class='controls'>
                     <select style="width: 284px" required="required" name="Food_type" >
                                    <option value="vegetarian">vegetarian</option>
                                    <option value="Non-vegetarian">Non-vegetarian</option>
                                    <option value="Both">Both</option>
                                </select> </div>
                </div>
<div class='control-group'>
		
			<td class="">   
<div class='controls'><input type="submit" value="Add restaurant" class="btn btn-large btn-success" id="form_submit" name="action" /></div>
		</div>


		</form>  
          
    
    
      

</div>

</div>
</div>
    

<jsp:include page="footer.jsp" />


                       