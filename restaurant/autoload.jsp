<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    
    <h4><center><font color="red">New Request</font></center></h4>
<jsp:useBean id="date" class="java.util.Date"/>
   <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>

    <jsp:useBean id="date1" class="java.util.Date"/>
<fmt:formatDate var="date1" value="${date1}" pattern="HHmmss"/>

 <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>


        <s:query var="rs" sql="select * from cart_details WHERE cart_Date=('${date}') AND cart_Rest_Id='${sessionScope.res_id}' AND cart_requesttorestraurant = '1' AND cart_send='0'" ></s:query>
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
                       <a href="orderdetail.jsp?cartid=${data.cart_PKey}&date=${date}"  target="_blank">Detail</a>     
                   </td>
                <c:if test="${data.cart_epochsecond <= date1 && date1 <= data.cart_epochsecond+5 }">
                <embed src="beep.mp3" hidden="true">
          </c:if>   
              
          </tr>
       </c:forEach>
    </table>
