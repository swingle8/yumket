<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->
<jsp:include page="header.jsp" />
<h3><center><font color="red"> ${sessionScope.firstname} ${sessionScope.lastname} - Welcome to Restaurant Pannel of ${sessionScope.userlocation}</font></center></h3>
   
<div class="container">
 <!-- Response message from the servlet--> 
<div id="fadeout-div"><p>${param.message}</p></div>
<!-- Response message from the servlet-->

    <div class="row">
    <div id="newdata-refresh" class="span3 sidebar" style="width:580px;height:500px;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
<h4><center><font color="red">New Request</font></center></h4>
<jsp:useBean id="date" class="java.util.Date"/>
   <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>

 <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>


        <s:query var="rs" sql="select * from cart_details WHERE cart_Date=('${date}') AND cart_Rest_Id='${sessionScope.res_id}' AND cart_requesttorestraurant = '1' AND cart_send = '0'" ></s:query>
           <table border="1" width="100%">
               <tr><th>Order Key</th>
                   <th>Rest. Id</th>
                   <th>Payment Way</th>
                   <th>Total purchase</th>
                   <th>Total amount</th>
                   <th>Date</th>
                   <th>Service type</th>
               <th>Show</th></tr>
     
       <c:forEach items="${rs.rows}" var="data">
               <tr><td align="center">${data.cart_PKey}</td>
                   <td align="center">${data.cart_Rest_Id}</td>
                   <td align="center">${data.cart_Paymentoption}</td>
                   <td align="center">${data.cart_Totalpurchase}</td>
                   <td align="center">${data.cart_Totalamount}</td>
                   <td align="center">${data.cart_Date}</td>
                   <td align="center">${data.cart_Servicetype}</td>
                       <td>
               <a href="orderdetail.jsp?cartid=${data.cart_PKey}&date=${date}" target="_blank">Detail</a>     
                   </td>
                   
                   
              
          </tr>
       </c:forEach>
    </table>
    </div>
      
    <div style="width:580px;height:500px; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
     <h4><center><font color="Green">Request Completed</font></center></h4>

     
     <s:query var="rs" sql="select * from cart_details WHERE cart_Date=('${date}') AND cart_Rest_Id='${sessionScope.res_id}' AND cart_requesttorestraurant = '1' AND cart_send = '1'" ></s:query>
           <table border="1" width="100%">
               <tr><th>Order Key</th>
                   <th>Rest. Id</th>
                   <th>Payment Way</th>
                   <th>Total purchase</th>
                   <th>Total amount</th>
                   <th>Date</th>
                   <th>Service type</th>
               <th>Show</th></tr>
     
       <c:forEach items="${rs.rows}" var="data">
               <tr><td align="center">${data.cart_PKey}</td>
                   <td align="center">${data.cart_Rest_Id}</td>
                   <td align="center">${data.cart_Paymentoption}</td>
                   <td align="center">${data.cart_Totalpurchase}</td>
                   <td align="center">${data.cart_Totalamount}</td>
                   <td align="center">${data.cart_Date}</td>
                   <td align="center">${data.cart_Servicetype}</td>
                   <td>
               <a href="orderdetail.jsp?cartid=${data.cart_PKey}" target="_blank">Detail</a>     
                   </td>
                   
                   
              
          </tr>
       </c:forEach>
    </table>
    </div>

</div>
</div>
    

<jsp:include page="footer.jsp" />


                       