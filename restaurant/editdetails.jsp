<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->
<jsp:include page="header.jsp" />
<div class="container">
    
    <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>

   <s:query var="rs" sql="select * from res_detail_${sessionScope.usercity} Where Res_PKey=${sessionScope.res_id}" ></s:query>            
    
<div class="row">
    <div class="span3 sidebar" style="width:580px;height:auto;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<h4><center><font color="red">Edit Restaurant</font></center></h4>


          <div id="fadeout-div"><p>${param.message}</p></div>
          


 <c:forEach items="${rs.rows}" var="data">
    <form class="form-horizontal" action="../RestaurantAction" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label class="control-label">Restaurant Id</label>
			<td class="">   
                            <div class='controls'><input type="text" name="res_pkey" style="width:290px" readonly="true" value="${data.Res_PKey}" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">Restaurant Name(No white space, first letter capital)</label>
			<td class="">   
                            <div class='controls'><input type="text" readonly="true" name="restaurant_name" style="width:290px" value="${data.Res_Name}" /></div>
		</div>

        
		<div class='control-group'>
		<label class="control-label">Street Name:</label>
			<td class="">   
                            <div class='controls'><input type="text" name="street_name" value="${data.Res_FullAddress}" style="width: 284px" readonly="true" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">Location:</label>
			<td class="">   
                            <div class='controls'>
                               <select style="width: 284px" readonly="true" name="rest_location" >
                                    <option value="Chandni-Chok">Chandni-Chok</option>
                                </select> 
                            </div>
		</div>


		<div class='control-group'>
		<label class="control-label">Restaurant Phone(Mobile):</label>
			<td class="">   
<div class='controls'><input value="${data.Res_Phone1}" name="restaurant_phone1" readonly="true" style="width: 284px" type="text" /></div>
		</div>

        
		<div class='control-group'>
		<label class="control-label">Restaurant Phone(Mobile):</label>
			<td class="">   
<div class='controls'><input value="${data.Res_Phone2}" name="restaurant_phone2" readonly="true" style="width: 284px" type="text" /></div>
		</div>
        
        
		<div class='control-group'>
		<label class="control-label">Restaurant Landline:</label>
			<td class="">   
                            <div class='controls'><input value="${data.Res_Phone3}" readonly="true" name="restaurant_landline" style="width: 284px" type="text" /></div>
		</div>
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Owner Name:</label>
			<td class="">   
<div class='controls'><input type="text" name="owner_name" style="width: 284px" readonly="true" value="${data.Res_Owner}" /></div>
		</div>

        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Minimum delivery cost:</label>
			<td class="">   
<div class='controls'><input type="text" name="minimum_delivery_cost" style="width: 284px" required="required" value="${data.Res_Mindelivery}" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Minimum order cost:</label>
			<td class="">   
<div class='controls'><input type="text" name="minimum_order_cost" style="width: 284px" required="required" value="${data.Res_MinOrder_Amount}" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Restaurant open time(HHMM):</label>
			<td class="">   
<div class='controls'><input type="text" name="restaurant_open_time" style="width: 284px" required="required" value="${data.Res_OpenTime}" /></div>
		</div>
        
        
		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Restaurant close time(HHMM):</label>
			<td class="">   
<div class='controls'><input type="text" name="restaurant_close_time" style="width: 284px" required="required" value="${data.Res_CloseTime}" /></div>
		</div>
        
        
        
		<div class='control-group'>
		<label class="control-label">Service type:</label>
                <c:set var="Delivery" value="false"/>
                <c:set var="Pickup" value="false"/>
                <c:if test="${data.Res_service eq 'Delivery'}">
                    <c:set var="Delivery" value="true"/>
                </c:if>
                    <c:if test="${data.Res_service eq 'Pickup'}">
                    <c:set var="Pickup" value="true"/>
                </c:if>
                <td class="">   
<div class='controls'>
                     <select style="width: 284px" readonly="true" name="service_type">
                                    <option value="Delivery" selected="${Delivery}">Delivery</option>
                                    <option value="Pickup" selected="${pickup}" >Pickup</option>
                                </select> </div>
                </div>

                                	
	<div class='control-group'>
		<label class="control-label">Food type:</label>
			<td class="">   
                <c:set var="Vegetarian" value="false"/>
                <c:set var="NonVegetarian" value="false"/>
                <c:set var="Both" value="false"/>
                <c:if test="${data.Res_service eq 'Vegetarian'}">
                    <c:set var="Vegetarian" value="true"/>
                </c:if>
                    <c:if test="${data.Res_service eq 'Non-vegetarian'}">
                    <c:set var="NonVegetarian" value="true"/>
                </c:if>
                
                    <c:if test="${data.Res_service eq 'Both'}">
                    <c:set var="Both" value="true"/>
                </c:if>
                            
                            <div class='controls'>
    
                     <select style="width: 284px" readonly="true" name="food_type" >
                         <option value="vegetarian" selected="${Vegetarian}">vegetarian</option>
                         <option value="Non-vegetarian" selected="${NonVegetarian}">Non-vegetarian</option>
                         <option value="Both" selected="${Both}">Both</option>
                                </select> </div>
                </div>
<div class='control-group'>
		
			<td class="">   
<div class='controls'><input type="submit" value="Update restaurant" class="btn btn-large btn-success" id="form_submit" name="action" /></div>
		</div>


		</form>  
          
    
    
        </c:forEach>
  

</div>

</div>
</div>
    

<jsp:include page="footer.jsp" />


                       