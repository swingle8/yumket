<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->

<!DOCTYPE html>
<html lang="en">
 <head>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Bootstrap restaurant - Flavours of real food</title>
	<link type="text/css" rel="stylesheet" href="../css/bootstrap.min3e5c.css?1388355641" />
	<link type="text/css" rel="stylesheet" href="../css/bootstrap-responsive.min26e1.css?1354579200" />
	<link type="text/css" rel="stylesheet" href="../css/main5088.css?1389437229" />
	<link type="text/css" rel="stylesheet" href="../css/font-awesome6dd5.css?1358035200" /> 
       
        
        <link rel="stylesheet" type="text/css" href="../css/DT_bootstrap.css">
        
        <link charset="utf-8" href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" media="screen" rel="stylesheet">
        <link charset="utf-8" href="http://fonts.googleapis.com/css?family=Roboto%20Condensed:400" media="screen" rel="stylesheet">
        <script charset="utf-8" src="../www.gstatic.com/external_hosted/modernizr/modernizr.js"></script>
	
        <style>
	body, h1, h2 {	font-family: -webkit-body;font-family: 'Roboto';font-weight: 300;}
	</style>
	
        <link rel="shortcut icon" href="../img/favicon.ico">
        
        <!-- javascript
================================================== -->
        <script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
        <script type="text/javascript"  src="../js/jquery.dataTables.js"></script>  
	<script type="text/javascript"  src="../js/DT_bootstrap.js"></script>
        
        <script type="text/javascript" src="../js/bootstrapb91a.js?1382559660"></script>
	
       
 </head>
    <body>
<header class="header">
<div class="headerSection">
<div class="container">
<div class="row">
<div class="span12 menuu" >
    
  <a href="cartadmin.jsp" title="New order request"> <i class="icon-food"></i>  <span>HOME </span></a>
    <a href="newrequestlist.jsp" title="Request- Add a Restaurant"> <i class="icon-envelope"></i>  <span>List </span></a>
    <a href="addrestaurant.jsp" title="Add a restaurant"> <i class="icon-plus"></i>  <span>List </span></a>
    <a href="#findrestaurant" data-toggle="modal" title="Edit restaurant"><i class="icon-search"></i></a>
    <a href="viewhistory.jsp" title="view history"> <i class="icon-time"></i>  <span>List </span></a>
    <a href="approveratings.jsp" title="Approve ratings"> <i class="icon-check"></i></a>
    <a href="discardedratings.jsp" title="Discarded ratings"> <i class="icon-remove"></i></a>
    <a href="feedback.jsp" title="View feedback"> <i class="icon-eye-open"></i></a>
   
    
    <a href="../Logout" style=" float: right" title="Logout"> <i class="icon-off"></i>  <span>HOME </span></a>
    <a href="#user-account" data-toggle="modal" style=" float: right" title="Your Account"> <i class="icon-user"></i>  <span>HOME </span></a>

    
</div>
<!-- // more data -->

</div>
</div>
</div>

    </header> 
<!-- header popups -->

<div id="user-account" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">


      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Update your account</h4>
                </div>
            <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>       
    <s:query var="rs" sql="select * from cart_login Where cart_Pkey=${sessionScope.cart_pkey}" ></s:query>            
   
                <div class="modal-body">
		
					<div class="cntr">
			<br>
                        
                                        <c:forEach items="${rs.rows}" var="data">
                
                 <form class="form-horizontal" action="../AdminAction" accept-charset="utf-8" method="post">
 	<div class='control-group'>
		<label class="control-label">Enter current password to Update</label>
			<td class="">   
                            <div class='controls'><input type="password" name="current_password" style="width:290px" required="required" value="" /></div>
		</div>  		
                
		<div class='control-group'>
		<label class="control-label">Name:</label>
			<td class="">   
                            <div class='controls'><h4>${data.cart_Name}</h4></div>
		</div>
             
                     
                <div class='control-group'>
		<label class="control-label">cart Id</label>
			<td class="">   
                            <div class='controls'><input type="text" name="cart_id" style="width:290px" readonly="true" value="${data.cart_Id}" /></div>
		</div>
        
		<div class='control-group'>
		<label class="control-label">cart Password</label>
			<td class="">   
                            <div class='controls'><input type="password" name="new_password" style="width:290px" required="required" value="${data.cart_Password}" /></div>
		</div>
<div class='control-group'>
		
			<td class="">   
<div class='controls'><input type="submit" value="Update account" class="btn btn-large btn-success" name="action" /></div>
		</div>
		</form>  
    </c:forEach>
                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>
        

        
<div id="findrestaurant" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <s:query var="rs" sql="select * from res_detail_${sessionScope.usercity}" ></s:query>            
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Search Restaurant</h4>
                </div>
    
     <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>       
                <div class="modal-body">
		
					<div class="cntr">
			<br>
	
                       <form class="form-horizontal" action="../AdminRedirect" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label class="control-label">Restaurant Name</label>
			<td class="">   
                            <div class='controls'>
                                <select style="width: 284px" required="required" name="res_name" >
                                <c:forEach items="${rs.rows}" var="data">
                                    <option value="${data.Res_Name}">${data.Res_Name}</option>
                                 </c:forEach>   
                                </select>
                            </div>
		</div>
    
		<div class='control-group'>
		<label class="control-label">Restaurant Location</label>
			<td class="">   
                            <div class='controls'>
                                <select style="width: 284px" required="required" name="res_location" >
                                    <option value="Chandni-Chok">Chandni Chok</option>
                                </select>
                            </div>
		</div>
    

    
    <div class='control-group'>
		<td class="">   
   <div class='controls'>
      <table><tr><td>
                  <input type="submit" value="Edit restaurant" class="btn btn-large btn-success" id="form_submit" name="action" /></td>
              <td>
                 <input type="submit" value="Edit menu" class="btn btn-large btn-success" id="form_submit" name="action" />              
              </td>
      </table>
   </div>
		</div>                   
                       
                       </form>

                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>

    


<!-- header popups -->
        
        

<div class="container">
 <div class="row">
    <div style="width:auto;height:auto;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<h4><center><font color="red">History</font></center></h4>
<!--
<form method="get" action="viewhistory.jsp">
<table width="100%">
    <tr>
        <td>Order Key
           <br>
           <input type="text" name="order_key" value="">
           <input type="hidden" name="order_key" value="%">
        </td>
        <td>Date(yyyy-MM-dd)
           <br>
           <input type="text" name="date" value="">
           <input type="hidden" name="date" value="%">
        </td>
        <td>Restaurant name
           <br>
         <select name="restaurant_name">
             <option value="%">All</option>
             <option value="Chula-Choka">Chula Choka</option>
         </select>
        </td>
        <td>location
           <br>
           <select name="location">
             <option value="Chandni-Chok">Chandni Chok</option>
         </select>
        </td>
        <td>
           <br>
           <input type="submit" class="btn btn-success" value="Sort">
        </td>
    </tr>
</table>
</form>
-->
<s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>

<s:query var="rs" sql="select * from cart_details WHERE cart_city='${sessionScope.usercity}' ORDER BY cart_PKey DESC"></s:query>
<table border="1" width="100%" id="example" class="table table-striped table-bordered">
    <thead>           
    <tr><th>Order Key</th>
                   <th>Rest. Id</th>
                   <th>Payment Way</th>
                   <th>Restaurant Name</th>
                   <th>Total purchase</th>
                   <th>Total amount</th>
                   <th>Date</th>
                   <th>Service type</th>
               <th>Show</th></tr>
     </thead>
       <c:forEach items="${rs.rows}" var="data">
               <tr><td align="center">${data.cart_PKey}</td>
                   <td align="center">${data.cart_Rest_Id}</td>
                   <td align="center">${data.cart_Paymentoption}</td>
                   <td align="center">${data.cart_Restname}</td>
                   <td align="center">${data.cart_Totalpurchase}</td>
                   <td align="center">${data.cart_Totalamount}</td>
                   <td align="center">${data.cart_Date}</td>
                   <td align="center">${data.cart_Servicetype}</td>
                       <td>
                           <a href="cartdetail.jsp?cartid=${data.cart_PKey}&date=${data.cart_Date}" target="#">Detail</a>     
                   </td>
          </tr>
       </c:forEach>
    </table>
    </div>
      

</div>
</div>
    

<jsp:include page="footer.jsp" />


                       