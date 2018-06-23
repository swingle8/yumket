<%-- 
    Document   : header
    Created on : Jun 21, 2014, 5:53:50 PM
    Author     : singhals
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     


<!DOCTYPE html>
<html lang="en">
    <head>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Bootstrap restaurant - Flavours of real food</title>
	<meta name="viewport" content="width=max-device-width, user-scalable=no, initial-scale=1.0">
        <meta name="description" content="We are the best indian takeaway club in lucknow, delhi. We are proud to present our refined, flavoursome and unique inspired Indian dishes. MAIDA VALE, W9 1SH, 02072667675.">
        <meta name="keywords" content="Online order, 15% discount on online order, indian food, MAIDA VALE, post code W9 1SH, phone 02072667675, nw8, w2, nw6, nw2, w1 ">
        <meta name="author" content="">
        
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
        
        <script type="text/javascript" src="../js/jqueryb91a.js?1382559660"></script> 
	
        
    	<script type="text/javascript" src="../js/bootstrapb91a.js?1382559660"></script>
	<script type="text/javascript" src="../js/simpleCartbbb6.js?1383112740"></script>
	<script type="text/javascript" src="../js/restaurant3a1f.js?1383972120"></script>
	<script type="text/javascript" src="../js/jquery.quicksandb91a.js?1382559660"></script>
	<script type="text/javascript" src="../js/jquery.validate.minb91a.js?1382559660"></script>
	<script type="text/javascript" src="../js/function2bde.js?1389899428"></script>
	<script src="translate.google.com/translate_a/elementa0d8.html?cb=googleTranslateElementInit"></script>

  <script type="text/javascript">

    
$(document).ready(function() {
$.ajaxSetup({ cache: false }); // This part addresses an IE bug. without it, IE will only load the first number and will never refresh
setInterval(function() {
$('#newdata-refresh').load('autoload.jsp');
}, 5000); // refers to the time to refresh the div. it is in milliseconds.
});

</script>
<style>
    .restraurantmaintable tr:hover td{ background-color: white };
 </style>                                  
                               
                                   
 </head>
    <body>
 
     <header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span12 menuu" >
    
    <a href="cartadmin.jsp" title="New order request"> <i class="icon-food"></i></a>
    <a href="newrequestlist.jsp" title="Request- Add a Restaurant"> <i class="icon-envelope"></i></a>
    <a href="addrestaurant.jsp" title="Add a restaurant"> <i class="icon-plus"></i></a>
    <a href="#findrestaurant" data-toggle="modal" title="Edit restaurant"><i class="icon-search"></i></a>
    <a href="viewhistory.jsp" title="view history"> <i class="icon-time"></i></a>
    <a href="approveratings.jsp" title="Approve ratings"> <i class="icon-check"></i></a>
    <a href="discardedratings.jsp" title="Discarded ratings"> <i class="icon-remove"></i></a>
    <a href="feedback.jsp" title="View feedback"> <i class="icon-eye-open"></i></a>
    
    <a href="../Logout" style=" float: right" title="Logout"> <i class="icon-off"></i></a>
    <a href="#user-account" data-toggle="modal" style=" float: right" title="Your Account"> <i class="icon-user"></i>  <span>HOME </span></a>
    
</div>
<!-- // more data -->



</div>

</div>

</div>
    </header> 
        <h3><center><font color="red"> ${sessionScope.firstname} - Welcome to Admin Pannel of ${sessionScope.usercity}</font></center></h3>
        
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
                  <input type="submit" value="Edit restaurant" class="btn btn-success" name="action" /></td>
              <td>
                 <input type="submit" value="Edit menu" class="btn btn-success" name="action" />              
              <td>
                 <input type="submit" value="Edit Offers" class="btn btn-success" name="action" />              
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

    
 