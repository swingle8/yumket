<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ page session="true" %>

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
    <a> <i class="icon-list-alt" style=" opacity: 0.3"></i>  <span>MENU </span></a>
    <a> <i class="icon-food" style=" opacity: 0.3"></i> <span>Registration</span></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i> <span class="simpleCart_grandTotal"> </span></a>
    
</div>

<!-- // more data -->

</div>
</div>
</div>
</div>   

    </header>
<c:set var="order_id" value="${sessionScope.order_id}" />
    <div class="container">
    <div class="row">
    <div class="span3 sidebar" style="width:800px;height:700px;margin-top: 10px ; margin-left: 20px ">
        <h2><center><b>Thank you, your order was placed successfully at <font color="green"> '${sessionScope.restaurantname}' </font></b></center></h2>
        <br>
        <h3><center><b>Your order number is <font color="green"> 'FCRT${sessionScope.order_id}'</font>, please note it down.</b></center></h3>
        <c:set var="cartid" value="${sessionScope.order_id}" />       
        <br>
        <% request.getSession().invalidate(); %>
    
        <a href='feedback.jsp'target='_blank'><img src='img/feedback_banner.png'></a>
    
    
    
    
    
    </div>
        <div id="track-order-refersh" style="width:355px;height:auto; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background-color: white ">
        <h2><center><b><font color="green">Track your order here with audio and visual effects: </font></b></center></h2>
        <center> Please don't refresh this page.. </center>                                                                                                             
        <hr>
        
        <table width='100%'>
            <tr>
                <td width='90%'><h3><font color="orange">Your order is sent to Restaurant.</font></h3></td>
                <td width='10%'><img src="img/loader.gif"/></td>        
            </tr>
            <tr>
                <td width='90%'><h3><font color="orange">Call confirmation with delivery time.</font></h3></td>
                <td width='10%'><img src="img/loader.gif"/></td>        
            </tr>
            <tr>
                <td width='90%'><h3><font color="orange">Restaurant delivers your order to door.</font></h3></td>
                <td width='10%'><img src="img/loader.gif"/></td>        
            </tr>
        </table>
        
        
        </div>       
    </div>
    </div>
        
<jsp:include page="footer.jsp" />



<script type="text/javascript">
jQuery(document).ready(function($) {

      if (window.history && window.history.pushState) {

        $(window).on('popstate', function() {
          var hashLocation = location.hash;
          var hashSplit = hashLocation.split("#!/");
          var hashName = hashSplit[1];

          if (hashName !== '') {
            var hash = window.location.hash;
            if (hash === '') {
             // $( "#dialog" ).dialog();
               
                window.location.href='index.jsp';
                return false;
                }
          }
        });

        window.history.pushState('forward', null, 'done.jsp');
      }

    });


    
$(document).ready(function() {
$.ajaxSetup({ cache: false }); // This part addresses an IE bug. without it, IE will only load the first number and will never refresh
setInterval(function() {
$('#track-order-refersh').load('trackmyorder.jsp?orderid=${order_id}');
}, 10000); // refers to the time to refresh the div. it is in milliseconds.
});

</script>
