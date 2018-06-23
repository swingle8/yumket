<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     

<jsp:include page="header.jsp" />

 <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>


<div class="container">
<p>${param.message}</p>
    <div class="row">
    <div class="span3 sidebar" style="width:880px;height:500px;margin-top: 10px ; margin-left: 20px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
<h4><center><font color="red">Add My Restaurant</font></center></h4>

<jsp:useBean id="date" class="java.util.Date"/>
   <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>

        <s:query var="rs" sql="select * from new_restraurant_request WHERE res_City='${sessionScope.usercity}' " ></s:query>
           <table border="1" width="100%" class="table table-striped table-bordered">
               <tr><th>Request PKey</th>
                   <th>Restaurant Name</th>
                   <th>Restaurant Location</th>
                   <th>Restaurant City</th>
                   <th>Contact Name</th>
                   <th>Contact Number</th>
                   <th>Contact Email</th>
                   <th>Request Date</th>
                   <th>Delete</th>
                   
               </tr>
       <c:forEach items="${rs.rows}" var="data">
           
               <tr><td align="center">${data.res_PKey}</td>
                   <td align="center">${data.res_Name}</td>
                   <td align="center">${data.res_Location}</td>
                   <td align="center">${data.res_City}</td>
                   <td align="center">${data.res_Contact_Name}</td>
                   <td align="center">${data.res_Contact_Number}</td>
                   <td align="center">${data.res_Contact_Email}</td>
                   <td align="center">${data.res_Req_Date}</td>
                   <c:set var="request_id" value="${data.res_PKey}" />
                   <td> <a href="#delete-request" role="button" data-toggle="modal">Delete</a></td>
          </tr>
       </c:forEach>
    </table>
    </div>
      
    <div style="width:280px;height:500px; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: #62c462 solid 2px ">
     <h4><center><font color="red">Suggested Restaurant</font></center></h4>     
       <s:query var="rs1" sql="select * from feedback_${sessionScope.usercity} where feedback_name!= 'null' " ></s:query>
           <table border="1" width="100%">
               <tr><th>Restaurant Name</th>
                   <th>Restaurant Location</th>
                   <th>Restaurant Place</th>
                   <th>Delete</th>
               </tr>
           <c:forEach items="${rs1.rows}" var="data1">
           
               <tr><td align="center">${data1.feedback_name}</td>
                   <td align="center">${data1.feedback_location}</td>
                   <td align="center">${data1.feedback_place}</td>
                    <c:set var="feedback_pkey" value="${data.feedback_PKey}" />
                   <td> <a href="#delete-user-request" role="button" data-toggle="modal">Delete</a></td>
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
                        <h4 id="myModalLabel">Delete Menu</h4>
                </div>
                <div class="modal-body">
		<h5>Are you sure want to delete this request?</h5>
        <form method="post" action="../AdminAction">
		<input type="hidden" name="requestid" value="${request_id}">          
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Delete request">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
	
                </div>
</div> 
      
<div id="delete-user-request" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Delete Menu</h4>
                </div>
                <div class="modal-body">
		<h5>Are you sure want to delete this user request?</h5>
        <form method="post" action="../AdminAction">
		<input type="hidden" name="feedback_pkey" value="${feedback_pkey}">          
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Delete user request">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
	
                </div>
</div>      