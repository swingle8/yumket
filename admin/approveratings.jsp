<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->

<jsp:include page="header.jsp" />        

<div class="container">
    ${param.message}
 <div class="row">
    <div style="width:auto;height:auto;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<h4><center><font color="red">New Ratings Request</font></center></h4>
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

<s:query var="rs" sql="select * from review_restaurant WHERE review_city='${sessionScope.usercity}' AND admin_verify='0'"></s:query>
<table border="1" width="100%" class="table table-striped table-bordered">
    <tr>
                   <th>Order Key</th>
                   <th>Rest. Id</th>
                   <th>Food</th>
                   <th>Value</th>
                   <th>Service</th>
                   <th>User Email</th>
                   <th>Mobile</th>
                   <th>Date</th>
                   <th>Approve</th>
                   <th>Discard</th>
    </tr>
     
       <c:forEach items="${rs.rows}" var="data">
               <tr><td align="center">${data.review_order_id}</td>
                   <td align="center">${data.review_res_id}</td>
                   <td align="center">${data.review_food}</td>
                   <td align="center">${data.review_value}</td>
                   <td align="center">${data.review_service}</td>
                   <td align="center">${data.reviewer_email}</td>
                   <td align="center">${data.reviewer_mobile}</td>
                   <td align="center">${data.review_date}</td>
                   <c:set var="review_pkey" value="${data.review_Pkey}" />
                   <c:set var="res_id" value="${data.review_res_id}" />
                   <td>
                           <a href="#approve-ratings" data-toggle="modal">Approve</a>     
                   </td>
                   <td>
                           <a href="#discard-ratings" data-toggle="modal">Discard</a>     
                   </td>
          </tr>
          <tr>
              <td colspan="10">${data.review_details}</td>
              
          </tr>

       </c:forEach>
    </table>
    </div>
</div>
</div>
<jsp:include page="footer.jsp" />


<div id="approve-ratings" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Approve Ratings</h4>
                </div>
                <div class="modal-body">
                       <div class="cntr">
			 Do you want to approve ratings?
                       </div>
		  <br>
   <form method="post" action="../AdminAction">
		<input type="hidden" name="review_pkey" value="${review_pkey}">
                <input type="hidden" name="res_id" value="${res_id}">
                          
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Approve request">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
              
    </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>


 <div id="discard-ratings" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Discard Ratings</h4>
                </div>
                <div class="modal-body">
                       <div class="cntr">
			 Do you want to discard ratings?
                       </div>
		  <br>
   <form method="post" action="../AdminAction">
       <input type="text" name="discard_reason" placeholder="discard reason in one line." value="" required="true">
		<input type="hidden" name="review_pkey" value="${review_pkey}">
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Discard request">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
              
    </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>
               