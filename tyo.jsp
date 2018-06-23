
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
    <div class="container">
      
    <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
    
    <jsp:useBean id="date" class="java.util.Date"/>
 <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>
    
    <s:query var="rs" sql="select * from cart_details WHERE cart_Date = '${date}'" >
    </s:query>
        <h2><font color='green'>Track your Order here - (TYO) : FCRT-${param.tyo_num}</font></h2>
            
        <c:forEach items="${rs.rows}" var="data">
        <c:choose>
       <c:when test="${data.cart_PKey eq param.tyo_num}">
            <div class="row">
    <div id="track-order-refersh" class="span3 sidebar" style="width:800px;height:700px;margin-top: 10px ; margin-left: 20px ">
       <h2><center><b><font color="green">Track your order here with audio and visual effects: </font></b></center></h2>
       <center><h4>Please don't refresh this page.</h4></center> 
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
        <div style="width:355px;height:400px; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background-color: white ">
            <br>
            </div>    
            </c:when>
           

        <c:otherwise>
            <h3>Sorry, your order id is not present in our Today's ordered Records.</h3>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        
    <script>
        $(document).ready(function() {
$.ajaxSetup({ cache: false }); // This part addresses an IE bug. without it, IE will only load the first number and will never refresh
setInterval(function() {
$('#track-order-refersh').load('trackmyorder.jsp?orderid=${param.tyo_num}');
}, 10000); // refers to the time to refresh the div. it is in milliseconds.
});

</script>
</div>
<jsp:include page="footer.jsp" />

