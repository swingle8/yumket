<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    

    <jsp:useBean id="date" class="java.util.Date"/>
 <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>
   

<jsp:useBean id="date1" class="java.util.Date"/>
<fmt:formatDate var="time" value="${date1}" pattern="HHmmss"/>

 <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>

       <h2><center><b><font color="green">Track your order here with audio and visual effects: </font></b></center></h2>
       <center><h4> Please don't refresh this page.. </h4></center>                                                                                                             
       <hr>
     
      <s:query var="rs" sql="select * from cart_details WHERE cart_PKey='${param['orderid']}'"></s:query>
       <c:forEach items="${rs.rows}" var="data">
           <c:choose>
            <c:when test="${data.cart_requesttorestraurant eq 1 && data.cart_requesttocostumer eq 1 && data.cart_send eq 1}">
              <table width="100%">
               <tr>
                <td width='80%'><h3><font color="orange">Your order is sent to Restaurant.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                 <td width="10%">${data.cart_requesttorestrauranttime}</td>
               </tr>
               <tr>
                <td width='80%'><h3><font color="orange">Call confirmation with delivery time.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                <td width="10%">${data.cart_requesttocostumertime}</td>
               </tr>
               <tr>
                <td width='80%'><h3><font color="orange">Restaurant delivers your order to door.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                <td width="10%">${data.cart_sendtime}</td>
               </tr>
               </table>
               <c:if test="${data.cart_epochfourth <= time && time <= data.cart_epochfourth+10 }">
               <embed src="door.mp3" hidden="true">
               </c:if>
               </c:when>
    
               
               <c:when test="${data.cart_requesttorestraurant eq 1 && data.cart_requesttocostumer eq 1 && data.cart_send eq 0}">
              <table width="100%">
               <tr>
                <td width='80%'><h3><font color="orange">Your order is sent to Restaurant.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                <td width="10%">${data.cart_requesttorestrauranttime}</td>
               </tr>
               <tr>
                <td width='80%'><h3><font color="orange">Call confirmation with delivery time.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                <td width="10%">${data.cart_requesttocostumertime}</td>
               </tr>
               <tr>
                <td width='90%'><h3><font color="orange">Restaurant delivers your order to door.</font></h3></td>
                <td width='10%'><img src="img/loader.gif"/></td>        
               </tr>
               </table>
               <c:if test="${data.cart_epochthird <= time && time <= data.cart_epochthird+10 }">
               <embed src="customer.mp3" hidden="true">
               </c:if>
               </c:when>
    
               
               <c:when test="${data.cart_requesttorestraurant eq 1 && data.cart_requesttocostumer eq 0 && data.cart_send eq 0}">
              <table width="100%">
               <tr>
                <td width='80%'><h3><font color="orange">Your order is sent to Restaurant.</font></h3></td>
                <td width='10%'><img src="img/check.png"/></td>        
                <td width="10%">${data.cart_requesttorestrauranttime}</td>
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
               <c:if test="${data.cart_epochsecond <= time && time <= data.cart_epochsecond+10 }">
               <embed src="restaurant.mp3" hidden="true">
               </c:if>
               </c:when>
    
               
               <c:otherwise>
                <table width="100%">
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
                </c:otherwise>
</c:choose>           
     </c:forEach>
