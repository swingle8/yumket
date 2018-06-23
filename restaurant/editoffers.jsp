<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!-- <% // response.addHeader("Refresh","10"); %> -->
<jsp:include page="header.jsp" />
<div class="container">
   <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
   
    <!-- Response message from the servlet--> 
<div id="fadeout-div"><p>${param.message}</p></div>
<!-- Response message from the servlet-->

<center><h2>Offers</h2></center>
<br>
<div style="width:100%;height:auto; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<s:query var="rs" sql="select * from discount_${sessionScope.usercity} Where discount_res_id='${sessionScope.res_id}'" ></s:query>            
       <c:forEach items="${rs.rows}" var="data">
       <table width="100%">
       
       <form action="../RestaurantAction" accept-charset="utf-8" method="post">
        <input type="hidden" name="res_pkey" value="${data.discount_res_id}">
	     <tr>
                <th>
                    <label class="control-label">Discount Percent</label>
                    </th>
                <td>
                    <input type="text" name="discount_percent" maxlength="2" style="width:20px" required="required" value="${data.discount_percent}" />%
                </td>
                   <th>
                    <label class="control-label">Discount Percent condition Rs.</label>
                    </th>
                <td>
                    <input type="text" name="discount_percent_condition" style="width:70px" required="required" value="${data.discount_percent_condition}" />
                </td>
            </tr>
        
             <tr>
                    <th>
                    <label class="control-label">Free item name</label>
                    </th>
                <td>
                    <input type="text" name="discount_item_name" style="width:100px" required="required" value="${data.discount_free_item}" />
                </td>
                   <th>
                    <label class="control-label">Free item condition Rs.</label>
                    </th>
                <td>
                    <input type="text" name="discount_item_condition" style="width:70px" required="required" value="${data.discount_free_item_condition}" />
                </td>
            </tr>

             <tr>
                    <th>
                    <label class="control-label">Discount event name</label>
                    </th>
                <td>
                    <input type="text" name="discount_event_name" style="width:100px" required="required" value="${data.discount_name}" />
                </td>
                    <th>
                    <label class="control-label">Discount Event Off</label>
                    </th>
                <td>
                    <input type="text" name="discount_event_off" maxlength="2" style="width:30px" required="required" value="${data.discount_name_percent}" />%
                </td>
                   <th>
                    <label class="control-label">Discount condition Rs.</label>
                    </th>
                <td>
                    <input type="text" name="discount_event_condition" style="width:70px" required="required" value="${data.discount_name_condition}" />
                </td>
            </tr>
                    
             <tr>
                    <th>
                    <label class="control-label">Discount Hour(HHMMSS)</label>
                    </th>
                <td>
                    <input type="text" name="discount_hour" max="240000" min="000000" style="width:100px" required="required" value="${data.discount_hour}" />
                </td>
                    <th>
                    <label class="control-label">Discount Hour off</label>
                    </th>
                <td>
                    <input type="text" name="discount_hour_percent" style="width:30px" required="required" value="${data.discount_hour_percent}" />%
                </td>
                   <th>
                    <label class="control-label">Discount Hour condition Rs.</label>
                    </th>
                <td>
                    <input type="text" name="discount_hour_condition" style="width:70px" required="required" value="${data.discount_hour_condition}" />
                </td>
            </tr>

             <tr>
                    <th>
                    <label class="control-label">Discount Date(YYYY-MM-DD)</label>
                    </th>
                <td>
                    <input type="text" name="discount_date" style="width:100px" required="required" value="${data.discount_date}" />
                </td>
                    <th>
                    <label class="control-label">Discount Date percent off</label>
                    </th>
                <td>
                    <input type="text" name="discount_date_off" style="width:30px" required="required" value="${data.discount_date_percent}" />%
                </td>
                   <th>
                    <label class="control-label">Discount Date condition Rs.</label>
                    </th>
                <td>
                    <input type="text" name="discount_date_condition" style="width:70px" required="required" value="${data.discount_date_condition}" />
                </td>
            </tr>
            
            <tr>
                <th>Meal Deals</th>
                <td>
                    <c:if test="${data.discount_mealdeals eq 1}">
                        <input type="checkbox" name="mealdeals" checked="true">
                    </c:if>
                    
                    <c:if test="${data.discount_mealdeals eq 0}">
                        <input type="checkbox" name="meal-deals" >
                    </c:if>    
                    </td>
            </tr>

                <tr>
                    <th align="center" colspan="6">
                <input type="submit" value="Update Offers" class="btn btn-success" id="form_submit" name="action" />
            </th>
                </tr>

		</form>  
        </table>  
    
    
           
   </c:forEach>
</div>
</div>
<jsp:include page="footer.jsp" />
                       