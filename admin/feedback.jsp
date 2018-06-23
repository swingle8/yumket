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
<h4><center><font color="red">User Feedbacks</font></center></h4>
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

<s:query var="rs" sql="select * from feedback_${sessionScope.usercity} where feedback_data != 'null' "></s:query>
<table border="1" width="100%" class="table table-striped table-bordered">
    <tr>
                   <th width="95%">user-views</th>
                   <th width="5%">Delete</th>
                   
    </tr>
     
       <c:forEach items="${rs.rows}" var="data">
               <tr><td align="center">${data.feedback_data}</td>
                   <td align="center"> <a href="#delete-request" role="button" data-toggle="modal">Delete</a></td>
                   <c:set var="feedback_pkey" value="${data.feedback_PKey}" />
                   
          </tr>
       </c:forEach>
    </table>
    </div>
</div>
</div>
<jsp:include page="footer.jsp" />


<div id="delete-request" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Approve Ratings</h4>
                </div>
                <div class="modal-body">
                       <div class="cntr">
			 Do you want to delete this feedback?
                       </div>
		  <br>
   <form method="post" action="../AdminAction">
		<input type="hidden" name="feedback_pkey" value="${feedback_pkey}">
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="delete feedback">
            
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
              