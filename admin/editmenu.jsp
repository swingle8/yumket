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
   
   <a href="#add-new-category" role="button" data-toggle="modal">Add new Category</a>
   <div id="add-new-category" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Add new Category</h4>
                </div>
                <div class="modal-body">
		
					<div class="cntr">
  
  <s:query var="rs1" sql="select * from item_category_${sessionScope.usercity} Where FK_resDetail_PKey='${param['res_id']}'" ></s:query>            
   <table width="100%">
       <tr><th>Category Name</th><th>Category Display Rank</th></tr>
    <c:forEach items="${rs1.rows}" var="data">
           <tr><td>${data.item_Category}</td><td>${data.Category_Rank}</td></tr>
    </c:forEach>
 </table>
   
     <br>
                       <form class="form-horizontal" action="../AddMenu" accept-charset="utf-8" method="post">

		<div class='control-group'>
		<label class="control-label">Category Name</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="Category_Name" value="" required="true" />   
                            </div>
		</div>
    
                           
		<div class='control-group'>
		<label class="control-label">Category Rank</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="Category_Rank" value="" required="true" />   
                            </div>
		</div>
                           
                           <input type="hidden" name="res_id" value="${param['res_id']}">
		
    <div class='control-group'>
		
			<td class="">   
<div class='controls'><input type="submit" value="Add new category" class="btn btn-large btn-success" name="action" /></div>
		</div>
                           
                           
                           
</form>

                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>
<br>




<a href="#add-new-item" role="button" data-toggle="modal">Add new Item</a>
   <div id="add-new-item" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    
    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Add new item</h4>
                </div>
                <div class="modal-body">
		
					<div class="cntr">
 
   <s:query var="rs1" sql="select * from item_category_${sessionScope.usercity} Where FK_resDetail_PKey='${param['res_id']}'" ></s:query>            
   <form enctype="multipart/form-data" class="form-horizontal" action="../AddItem" accept-charset="utf-8" method="post">
   <input type="hidden" name="res_id" value="${param['res_id']}">
   <div class='control-group'>
		<label class="control-label">Select Category</label>
			<td class="">   
                            <div class='controls'>
                                <select style="width: 284px" required="required" name="item_catagory" >
                                <c:forEach items="${rs1.rows}" var="data">
                                    <option value="${data.item_Category}">${data.item_Category}</option>
                                </c:forEach>
                                </select>
</div>
		</div>
   
     <br>

		<div class='control-group'>
		<label class="control-label">Item Name *</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_name" value="" required="true" />   
                            </div>
		</div>
    
                           
		<div class='control-group'>
		<label class="control-label">Item details</label>
			<td class="">   
                            <div class='controls'>
                                <textarea name="item_details" rows="3" cols="30"></textarea>
                                <input type="hidden" name="item_details" value="null" />
                            </div>
		</div>
		
                
		<div class='control-group'>
		<label class="control-label">Item pieces</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_pieces" value="0"/>
                            </div>
		</div>
     
               <div class='control-group'>
		<label class="control-label">Item price *</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_pricefull" value="" required="true" />   
                            </div>
		</div>
     
                <div class='control-group'>
		<label class="control-label">price comments</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="pricea_comments" value="" />
                                <input type="hidden" name="pricea_comments" value="null" />
                            </div>
		</div>
     
               <div class='control-group'>
		<label class="control-label">Item price (half)</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_pricehalf" value="0" />
                                
                            </div>
		</div>
     
                <div class='control-group'>
		<label class="control-label">price comments</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="priceb_comments" value="" />
                                <input type="hidden" name="priceb_comments" value="null" />
                            </div>
		</div>

                     <div class='control-group'>
		<label class="control-label">Item price (having offer)</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_price_offer" value="0" />
                            </div>
		</div>
     
                <div class='control-group'>
		<label class="control-label">price comments</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="pricec_comments" value="" />
                                <input type="hidden" name="pricec_comments" value="null" />
                            </div>
		</div>           
     
                <div class='control-group'>
		<label class="control-label">Item Ingredients</label>
			<td class="">   
                            <div class='controls'>
                                <input type="text" name="item_ingredients" value="" />
                                 <input type="hidden" name="item_ingredients" value="null" />
                            </div>
		</div>
     
     
               <div class='control-group'>
		<label class="control-label">Item Image *</label>
			<td class="">   
                            <div class='controls'>
                                <input type="file" name="item_image" value="" required="true" />   
                            </div>
		</div>
     
    <div class='control-group'>
		
			<td class="">   
                            <div class='controls'><input type="submit" name="action" value="Add new item" class="btn btn-large btn-success"  /></div>
		</div>
           
   </form>

                        </div>
		                </div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>

   
<div style="width:100%;height:auto; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
<s:query var="rs2" sql="select * from item_category_${sessionScope.usercity} Where FK_resDetail_PKey='${param['res_id']}' ORDER BY Category_Rank Asc" ></s:query>            
 <table class="restraurantmaintable" width="100%" cellpadding="2">
       <c:forEach items="${rs2.rows}" var="data2">
           <tr>
           <form method="post" action="../AddMenu">
               <td colspan="2" align="center" style=" background-color: seagreen; color: white ">
                <input type="text" name="category_name" value="${data2.item_Category}">    
                </td>
                <td colspan="2" align="center" style=" background-color: seagreen; color: white ">
                   <input type="text" name="category_rank" value="${data2.Category_Rank}">    
                </td>
                <input type="hidden" name="res_id" value="${param['res_id']}">
                <input type="hidden" name="category_pkey" value="${data2.item_Catagory_PKey}">
                <c:set var="itemCatagoryPKey" value="${data2.item_Catagory_PKey}" />
                <td style=" background-color: seagreen; color: white "><input type="submit" class="btn btn-success" name="action" value="Update category"></td>
                <td style=" background-color: seagreen"><a style=" color: white" href="#delete-menu" role="button" data-toggle="modal">Delete menu</a></td>
           </form>
           </tr>
            <c:set var="itemcatagorypkey" value="${data2.item_Catagory_PKey}"></c:set>
             <s:query var="rs3" sql="select * from menu_item_${sessionScope.usercity} Where FK_resDetails_PKey=${param['res_id']} AND FK_resCategory_PKey=${itemcatagorypkey}">
             </s:query>
            <c:forEach items="${rs3.rows}" var="data3">
                <tr id="${data3.menuItem_PKey}">
                <form method="post" action="../AddItem">  
                <td align="center">
                     <img src="../ItemImage?id=${data3.menuItem_PKey}" width="80px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" >    
                </td>
                <td align="center">
                    <input type="text" name="item_name" value="${data3.item_Name}" required="true">
                   <br>
                   <textarea name="item_details" rows="2" cols="30">${data3.item_Details}</textarea>
                    <input type="hidden" name="item_details" value="null">
                </td>
                <td align="center">
                   <input type="text" name="item_quantity" value="${data3.item_Quantity}">
                </td>
                <td align="center">
                   <input type="text" name="item_price" value="${data3.item_Price}" required="true">
                   <br>
                    <input type="text" name="item_price_half" value="${data3.item_Price_Half}">
                </td>
                <input type="hidden" name="res_id" value="${param['res_id']}">
                <input type="hidden" name="menuitem_pkey" value="${data3.menuItem_PKey}">
                <c:set var="menuitempkey" value="${data3.menuItem_PKey}"/>
                <td><input type="submit" class="btn btn-success" name="action" value="Update item"></td>
                <td><a href="#delete-item" role="button" data-toggle="modal">Delete item</a></td>
</form>
              </tr> 
            
            </c:forEach>
   </c:forEach>
</table>

        





</div>
   
   
   
   






</div>

<jsp:include page="footer.jsp" />

<div id="delete-item" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Delete Item-${menuitempkey}</h4>
                </div>
                <div class="modal-body">
		<h5>Are you sure want to delete this item?</h5>
        <form method="post" action="../AddItem">
		<input type="hidden" name="res_id" value="${param['res_id']}">
                <input type="hidden" name="menuitem_pkey" value="${menuitempkey}">
                          
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Delete item">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
	
                </div>
</div>
   
<div id="delete-menu" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Delete Menu</h4>
                </div>
                <div class="modal-body">
		<h5>Are you sure want to delete this Menu?</h5>
                <h5>All items inside this menu will be deleted.</h5>
        <form method="post" action="../AddMenu">
		<input type="hidden" name="res_id" value="${param['res_id']}">
                <input type="hidden" name="category_pkey" value="${itemCatagoryPKey}">
                          
      <table align="right" width="50%">  
          <tr><td align="center">
               <input type="submit" class="btn btn-danger" name="action" value="Delete category">
            
              </td><td align="center">
                        <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</button>
              </td></tr> 
      </table>       
            </form>          
	
                </div>
</div>                       