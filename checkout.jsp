
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <c:if test="${sessionScope.usertype eq 'Admin'}">
    <c:redirect url="admin/cartadmin.jsp"/>
    </c:if>

    <c:if test="${sessionScope.usertype eq 'Restaurant'}">
    <c:redirect url="restaurant/restaurant.jsp"/>
    </c:if> 
<jsp:include page="header.jsp" />
    <header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i>  <span>HOME </span></a>
    <a href="${sessionScope.place}.jsp?location=${sessionScope.place}&place=${sessionScope.location}&service=${sessionScope.service}&cuisine=&foodtype=Both&sort=userratings"> <i class="icon-list-alt"></i>  <span>MENU </span></a>
    <a href="restaurant.jsp?place=${sessionScope.place}&id=${sessionScope.id}&location=${sessionScope.location}&service=${sessionScope.service}&offers=${sessionScope.offers}"> <i class="icon-food"></i> <span>Registration</span></a>
    <a href="${requestScope['javax.servlet.forward.query_string']}"> <i class="icon-shopping-cart"></i></a>
    
</div>

<div  class="span6 mobile" >
<div class="pull-right">
        <form method="post" id="FormToValidate" action="tyo.jsp">
            <input class="span3" id="postcode" required="true" name="tyo_num" placeholder="TYO number" type="text"/>
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
<s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
<s:query var="rs" sql="select * from res_detail_${sessionScope.place} WHERE Res_PKey = '${sessionScope.id}'" >
</s:query>
       <c:forEach items="${rs.rows}" var="data">           
        <c:set var="restraurantname" value="${data.Res_Name}" />
        <c:set var="minorder" value="${data.Res_MinOrder_Amount}" />
        <c:set var="deliverycost" value="${data.Res_Mindelivery}" />
                </c:forEach>

<div class="container">
<div class="row">
    <div class="span3 sidebar" style="width:700px;height:700px;margin-top: 10px ; margin-left: 20px ">
    
        
        
        
        <form  class="form-horizontal" id="FormToValidate" action="CartToDatabase" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label id="label_userName" for="form_userName" class="control-label">Delivery Address:</label>
			<td class="">   
<div class='controls'><input type="text" name="houseno" placeholder="house no." style="width:60px" required="required" id="form_userName" value="" />
                      <input type="text" name="streetname" placeholder="street name" style="width:210px" required="required" id="form_userName" value="" />
</div>
		</div>

		<div class='control-group'>
		<label id="label_userAddress" for="form_userAddress" class="control-label">Location:</label>
			<td class="">   
                            <div class='controls'><input type="text" name="location" value="${sessionScope.location}" readonly="true" style="width: 284px" required="required" id="form_userAddress" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userPhone" for="form_userPhone" class="control-label">City:</label>
			<td class="">   
<div class='controls'><input type="text" name="city" value='${sessionScope.place}' readonly="true" style="width: 284px" required="required" id="form_userPhone" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userPostcode" for="form_userPostcode" class="control-label">First name:</label>
			<td class="">   
<div class='controls'><input value="" name="fname" required="required" placeholder="First name" style="width: 284px" type="text" id="form_userPostcode"/></div>
		</div>

		<div class='control-group'>
		<label id="label_userCity" for="form_userCity" class="control-label">Last name:</label>
			<td class="">   
<div class='controls'><input type="text" name="lname" placeholder="Last Name" style="width: 284px" required="required" id="form_userCity" value="" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userEmail" for="form_userEmail" class="control-label">E-mail:</label>
			<td class="">   
<div class='controls'><input type="text" name='email'  placeholder="E-mail address" style="width: 284px" required="required" id="form_userEmail" value="" /></div>
		</div>

		<div class='control-group'>
		<label id="label_userPassword" for="form_userPassword" class="control-label">Company name(if delivered in office):</label>
			<td class="">   
<div class='controls'><input type="text" name="companyname"  placeholder="company" style="width: 284px" id="form_userPassword" value="" /></div>
		</div>
                
                <div class='control-group'>
		<label id="label_userPassword" for="form_userPassword" class="control-label">Mobile number:</label>
			<td class="">   
<div class='controls'><input type="text" name="mobile" required="required" placeholder="Mobile number" style="width: 284px" value="" /></div>
		</div>
                
                <div class='control-group'>
		<label id="label_userPassword" for="form_userPassword" class="control-label">Choose a payment option:</label>
			<td class="">   
                            <div class='controls'>
                                        <table width="100%">
                                                          <tr>
                                                              <th>  
                                                                  Online payment  <input type='radio' required="required" value="online payment" name="paymentoption"> 
                                                           </th>
                                                              <th>  
                                                                  Pay by cash  <input type='radio' required="required" value="pay by cash" name="paymentoption"> 
                                                           </th>
                                                              <th>  
                                                                  pay online with citibank card  <input type='radio' required="required" value="pay online with citibank card" name="paymentoption"> 
                                                           </th>
                                                            
                                                        </table>                                                        
                                                
                            </div>
		</div>
<input type='hidden' name="id" value="${sessionScope.id}">
<input type='hidden' name="deliverycost" value="${deliverycost}">
<input type='hidden' name="restraurantname" value="${restraurantname}">


<div class='control-group'>
<td class="">   
<div class='controls'><input type="submit" id="btnValidate" value="checkout" class="btn btn-large btn-success" id="form_submit" name="submit" /></div>
		</div>


		</form>                                               
    </div>
      
    <div style="width:355px;height:570px; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
    <table>
       <c:forEach items="${rs.rows}" var="data">
           <tr><td><img src="FetchImage?id=${data.Res_PKey}" width="80px" style=" -webkit-border-radius: 10px; -moz-border-radius: 10px ; border:#000 solid 1px ; " ></td>        
           <td>
               
               <form id="service" class="redirectOnChange">
               <table width="300px">
                   <tr><th>${data.Res_Name}</th>
                   <td>
                          ${sessionScope.service} </td>
                   </tr> 
                   <tr><td>YOUR ORDER</td>
                       <td></td>
                   </tr>               
                   
               </table>
                              </form>  
           </c:forEach>
           </td>
       </tr>
       </table>
                   <div style=" background-color: white ; width:335px;height:480px; margin-top: 4px; margin-left: 8px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px  ">
              <h4 style="margin-left: 10px">Delivery to : ${sessionScope.location} </h4>
              <iframe width="331" height="400" frameBorder='0' name="cartwindow" style=" max-height:400px ; overflow: scroll "></iframe>
          </div>
   </div>
              <form id="checkout" method="post" action="ShoopingCartA" target="cartwindow">
                  <s:query var="rs3" sql="select * from discount_${sessionScope.place} where discount_res_id='${sessionScope.id}' " ></s:query>
                  <c:forEach items="${rs3.rows}" var="data3"> 
                  <c:choose>
                  <c:when test="${sessionScope.offers eq 'Percentoff' }">
                  <input type='hidden' name="offername" value="Percent discount">
                  <input type='hidden' name="offervalue" value="${data3.discount_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_percent_condition}">
                  </c:when>
                 
                  <c:when test="${sessionScope.offers eq 'FreeItem'}">
                  <input type='hidden' name="offername" value="Free ${data3.discount_free_item}">
                  <input type='hidden' name="offervalue" value="0.0">
                  <input type='hidden' name="offercondition" value="${data3.discount_free_item_condition}">
                  </c:when>

                  
                  <c:when test="${sessionScope.offers eq 'Occasional'}">
                  <input type='hidden' name="offername" value="${data3.discount_name}">
                  <input type='hidden' name="offervalue" value="${data3.discount_name_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_name_condition}">
                  </c:when>
                  
                  <c:when test="${sessionScope.offers eq 'DiscountHour' && data3.discount_hour le time && time lt (data3.discount_hour+10000)}">
                   <input type='hidden' name="offername" value="Discount Hour">
                  <input type='hidden' name="offervalue" value="${data3.discount_hour_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_hour_condition}">
                  </c:when>
                  
                  <c:when test="${sessionScope.offers eq 'DiscountDate' && data3.discount_date eq date}">
                  <input type='hidden' name="offername" value="Discount Date">
                  <input type='hidden' name="offervalue" value="${data3.discount_date_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_date_condition}">
                  </c:when>
                  <c:otherwise>
                  <input type='hidden' name="offername" value="Offer name not rechognised">
                  <input type='hidden' name="offervalue" value="0">
                  <input type='hidden' name="offercondition" value="0">
                  </c:otherwise>
                  </c:choose> 
                  </c:forEach>
                  
                  <input type='hidden' name="minorder" value="${minorder}">
                  <input type='hidden' name="deliverycost" value="${deliverycost}">
                  <input type='hidden' name="id" value="${sessionScope.id}">
                  <input type='hidden' name="service" value="${sessionScope.service}">
                  <input type='hidden' value='final-show' name='action'>
              </form>
                   <script>
                   document.getElementById("checkout").submit();
                   </script>


</div>
</div>
<jsp:include page="footer.jsp" />




    <link href="css/jquery-ui-1.8.13.custom.css"   rel="stylesheet" type="text/css" />
    <link href="css/Site.css" rel="stylesheet" type="text/css" /> 
   
    <script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.wrapper.js" type="text/javascript"></script>
    <script src="js/checkout_validation.js" type="text/javascript"></script>


