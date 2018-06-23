<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     

<jsp:include page="header.jsp" />
   <jsp:useBean id="date" class="java.util.Date"/>
   <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>

 <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>


<div class="container">
<div class="row">
    <div class="span3 sidebar" style="width:780px;height:auto;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
       <s:query var="rs" sql="select * from cart_details WHERE cart_Date=('${date}') AND cart_city='${sessionScope.usercity}' AND cart_PKey='${param['cartid']}' " ></s:query>
           <c:forEach items="${rs.rows}" var="data">
           <table border="1" width="100%" class="table table-striped table-bordered">
    
               <tr><th>cart Key</th><td align="center">${data.cart_PKey}</td></tr>
               <tr><th>Restaurant Key</th><td align="center">${data.cart_Rest_Id}</td></tr>
               <tr><th>Restaurant Name</th><td align="center">${data.cart_Restname}</td></tr>
               <tr><th>Restaurant Location</th><td align="center">${data.cart_location}</td></tr>
               <tr><th>Restaurant city</th><td align="center">${data.cart_city}</td></tr>
               <tr><th>First Name</th><td align="center">${data.cart_Fname}</td></tr>
               <tr><th>Last Name</th><td align="center">${data.cart_Lname}</td></tr>
               <tr><th>House Number</th><td align="center">${data.cart_Houseno}</td></tr>
               <tr><th>Company Name</th><td align="center">${data.cart_companyname}</td></tr>
               <tr><th>Street Name</th><td align="center">${data.cart_streetname}</td></tr>
               <tr><th>Email Address</th><td align="center">${data.cart_Email}</td></tr>
               <tr><th>Mobile Number</th><td align="center">${data.cart_Mobilenum}</td></tr>
               <tr><th>Payment way</th><td align="center">${data.cart_Paymentoption}</td></tr>
               <tr><th>Total Purchase</th><td align="center">${data.cart_Totalpurchase}</td></tr>
               <tr><th>Total Amount</th><td align="center">${data.cart_Totalamount}</td></tr>
               <tr><th>Service Type</th><td align="center">${data.cart_Servicetype}</td></tr>
               <tr><th>Date</th><td align="center">${data.cart_Date}</td></tr>
               <tr><th>Time</th><td align="center">${data.cart_Time}</td></tr>
               <tr><th>Offer Name</th><td align="center">${data.cart_offer_name}</td></tr>
               <tr><th>Offer value</th><td align="center">${data.cart_offer_value}</td></tr>
               <tr><th>Offer condition</th><td align="center">${data.cart_offer_condition}</td></tr>
       
           </table>
         <c:set var="offer_name" value="${data.cart_offer_name}" /> 
         <c:set var="offer_value" value="${data.cart_offer_value}" />
         <c:set var="offer_condition" value="${data.cart_offer_condition}" />
       
          <c:set var="totalpurchase" value="${data.cart_Totalpurchase}" />
          <c:set var="totalamount" value="${data.cart_Totalamount}" />
          <c:set var="servicetype" value="${data.cart_Servicetype}" />        
          <c:set var="deliverycost" value="${data.cart_Deliverycost}" /> 
           <c:set var="cart_send" value="${data.cart_send}" /> 
            <c:set var="sendtime" value="${data.cart_sendtime}" /> 
                   
       </c:forEach>
    <br>
       <center>
           <form class="form-horizontal" action="../AdminAction" accept-charset="utf-8" method="post" >
            <input type="hidden" name="cartid" value="${param['cartid']}"> 
        <c:if test="${cart_send eq '0'}">
            <input type="submit" class="btn btn-success" name="action"  value="OrderCompleted"/>
        </c:if>
       <c:if test="${cart_send eq '1'}">
      Order has been completed at 
      <br>
      <h3>${sendtime}</h3>
       </c:if>
           
          </form>
       </center>
    
       
    </div>
      
    <div style="width:380px;height:500px; overflow: scroll; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
            <s:query var="rs1" sql="select * from cart_items WHERE item_cartFKey=${param['cartid']}"></s:query>
            <h3><center><b><font color="red">User Cart</font></b></center></h3>
            <table width="100%">
                <tr><th>Quantity</th><th align="center">Item Name</th><th>Price in Rs</th></tr>
       <c:forEach items="${rs1.rows}" var="data">
      
           <tr><td align="center"><b>${data.item_quantity}</b></td><td align="center">${data.item_name}</td><td align="center">${data.item_price}</td></tr>
       </c:forEach>
           <tr><th colspan="2"><h3>Total Purchase</h3></th><td align="center"><h3>${totalpurchase}</h3></td></tr>
          <tr><th colspan="3" align="left"><b>Discounts</b></th></tr>
           <c:if test="${offer_name ne null}">
               <tr><th colspan="2" align="center">Free </th><td align="center">Item${offer_name}</td></tr>
           </c:if>
           
           <c:if test="${offer_value ne null}">
               <tr><th colspan="2" align="center">${offer_value} % Off on Rs ${offer_condition} shopping</th><td align="center">- Rs.${(offer_value/100)*totalpurchase}</td></tr>
           </c:if>
           
           <tr><th colspan="2">Total Amount</th><td align="center"><h3>${totalpurchase-((offer_value/100)*totalpurchase)}</h3></td></tr>
           
 
           <tr><th colspan="2">Vat @ 13%</th><td align="center">${(totalpurchase-((offer_value/100)*totalpurchase))*0.13}</td></tr>
           <tr><th colspan="2">Service Tax @ 1%</th><td align="center">${(totalpurchase-((offer_value/100)*totalpurchase))*0.01}</td></tr>
         
          
           <c:if test="${servicetype eq 'Delivery'}">
                  <tr><th colspan="2">Delivery cost</th><td align="center">${deliverycost}</td></tr>
           </c:if>
           
                  <tr><th colspan="2"><h3>Total Amount</h3></th><td align="center"><h3>${totalamount}</h3></td></tr>
            
            </table>
       
   </div>

</div>
</div>
    

<jsp:include page="footer.jsp" />


                       