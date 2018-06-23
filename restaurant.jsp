<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ page session="true" %>
    <%@ page import="cart.*"%>
   
    <c:if test="${sessionScope.usertype eq 'Admin'}">
    <c:redirect url="admin/cartadmin.jsp"/>
    </c:if>

    <c:if test="${sessionScope.usertype eq 'Restaurant'}">
    <c:redirect url="restaurant/restaurant.jsp"/>
    </c:if>
    
    <jsp:useBean id="date" class="java.util.Date"/>
   <fmt:formatDate var="date" value="${date}" pattern="yyyy-MM-dd"/>
   
   <jsp:useBean id="date1" class="java.util.Date"/>
   <fmt:formatDate var="time" value="${date1}" pattern="HHmmss"/> 
   
   <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
   <s:query var="rs" sql="select * from res_detail_${param['place']} WHERE Res_PKey = '${param['id']}'" >
   </s:query>
     
    <jsp:include page="header.jsp" /> 
    <header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i>  <span>HOME </span></a>
    <a href="${param['place']}.jsp?location=${param['place']}&place=${param['location']}&service=Delivery&cuisine=&foodtype=Both&sort=userratings"> <i class="icon-list-alt"></i>  <span>MENU </span></a>
    <a href="${requestScope['javax.servlet.forward.query_string']}"> <i class="icon-food"></i></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i></a>
   
</div>
    
<div  class="span6 mobile" >
<div class="pull-right">
        <form method="post" id="FormToValidate" action="tyo.jsp">
            <input class="span3" id="postcode" name="tyo_num" required="true" placeholder="TYO number" type="text"/>
	<button id="btnValidate" class="btn btn-large btn-success" type="submit">CHECK STATUS</button>
        </form>
</div>
</div>

<!-- // more data -->

</div>
</div>
</div>
</div>   

    </header>

    <div class="container"> 
   
    
       <c:forEach items="${rs.rows}" var="data">           
       <c:if test="${data.Res_Rating <= 2.0}">
                            <c:set var="stara" value="selected" />
                        </c:if>
                       
                   <c:if test="${data.Res_Rating > 2.0 && data.Res_Rating <= 4.0}">
                            <c:set var="starb" value="selected" />
                        </c:if>
                        
                         <c:if test="${data.Res_Rating > 4.0 && data.Res_Rating <= 6.0}">
                            <c:set var="starc" value="selected" />
                        </c:if>
                        
                        <c:if test="${data.Res_Rating > 6.0 && data.Res_Rating <= 8.0}">
                            <c:set var="stard" value="selected" />
                        </c:if>
                        
                         <c:if test="${data.Res_Rating > 8.0 && data.Res_Rating <= 10.0}">
                            <c:set var="stare" value="selected" />
                        </c:if>     
       
       <div style=" background-color: white; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: seagreen solid 1px;">
            
            <table width="100%" >   
        <c:set var="minorder" value="${data.Res_MinOrder_Amount}" />
        <c:set var="deliverycost" value="${data.Res_Mindelivery}" />
        <tr>
            <td><a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}"><img src="FetchImage?id=${data.Res_PKey}" width="90px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" ></a></td>
        <td>
            <table width="100%">    
                <tr><td align=left valign=top ><h3><a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}" style="color: orange"> ${data.Res_Name} </a></h3></td>
                           <td align="left"> 
              <div class="input select rating-f">
            <select id="example-f" name="rating">
                <option value="1" ${stara} >1</option>
                <option value="2" ${starb} >2</option>
                <option value="3" ${starc} >3</option>
                <option value="4" ${stard} >4</option>
                <option value="5" ${stare} >5</option>
            </select>
        </div>
           ${data.Res_Rating}/10.0
                        
                        
                <a href="ratings.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}">Rate this restaurant</a></td></tr>
                <tr><td> ${data.Res_FullAddress} </td><td align="left">Minimum order cost : Rs ${minorder}/-</td></tr>
                <tr><td> ${data.Res_OpenTime} to ${data.Res_CloseTime} Hours </td><td align="left">Delivery cost : Rs ${data.Res_Mindelivery}/-</td></tr>

        </table>
            
        </td>
            </table>
                <%
                 String whichoffer = request.getParameter("offers");
                 String percentoff_checked = "";
                 String freeitem_checked = "";
                 String occasional_checked = "";
                 String discounthour_checked = "";
                 String discountdate_checked = "";
                
                 if(whichoffer.equals("Percentoff"))
                   percentoff_checked = "checked" ;
                 if(whichoffer.equals("FreeItem"))
                   freeitem_checked = "checked" ;
                 if(whichoffer.equals("Occasional"))
                   occasional_checked = "checked" ;
                 if(whichoffer.equals("DiscountHour"))
                   discounthour_checked = "checked" ;
                 if(whichoffer.equals("DiscountDate"))
                   discountdate_checked = "checked" ;
               
                 %>
                <s:query var="rs3" sql="select * from discount_${param['place']} where discount_res_id='${param['id']}' " ></s:query>
                     <c:forEach items="${rs3.rows}" var="data3">
                     
                     <form id="offers" class="redirectOnChange">
                       <table width="100%">  
                         <tr>
                     <c:if test="${data3.discount_percent ne 0}">
                      <td align="center" style="color: #000">
                          <input type="radio" name="offername" value="Percentoff" <%= percentoff_checked %>><font color="orange" class="offerheading" > Percent off </font> 
                          <div class="offerdetail">
                             <h5><center>${data3.discount_percent}% off</center></h5>
                             <c:if test="${data3.discount_percent_condition eq 0}">
                             Get ${data3.discount_percent}% off on the purchase price.
                             </c:if>
                             <c:if test="${data3.discount_percent_condition != 0}">
                             Shop Rs. ${data3.discount_percent_condition} to get ${data3.discount_percent}% off on the purchase price.
                             </c:if>
                             <br>
                           </div>
                      </td>
                      </c:if>
                     
                      <c:if test="${data3.discount_free_item ne 'null'}">
                      <td align="center" style="color: #000">
                          <input type="radio" name="offername" value="FreeItem" <%= freeitem_checked %>><font color="orange" class="offerheading"> Free Item </font> 
                          <div class="offerdetail">
                             <h5><center>Free Item</center></h5>
                             Shop Rs. ${data3.discount_free_item_condition} to get ${data3.discount_free_item} item Free!
                             <br>
                            </div>
                      </td>
                      </c:if>
                    
                      <c:if test="${data3.discount_name ne 'null'}">
                      <td align="center" style="color: #000">
                          <input type="radio" name="offername" value="Occasional" <%= occasional_checked %>><font color="orange" class="offerheading"> Occasional </font>
                          <div class="offerdetail">
                             <h5><center>${data3.discount_name}</center></h5>
                             Celebrate ${data3.discount_name} with us, and get ${data3.discount_name_percent}% off on Rs. ${data3.discount_name_condition} Purchase amount.
                             <br>
                          </div>
                      </td>
                      </c:if>  
                      
                      <c:if test="${data3.discount_hour ne 'null'}">
                      <td align="center" style="color: #000">
                          <c:if test="${data3.discount_hour le time && time lt (data3.discount_hour+10000)}">
                          <input type="radio" name="offername" value="DiscountHour" <%= discounthour_checked %>>
                          </c:if>
                          <font color="orange" class="offerheading"> Discount Hour </font>
                           <div class="offerdetail">
                             <h5><center> Discount Hour </center></h5>
                             Celebrate Discount Hour with us, and get ${data3.discount_hour_percent}% off on Rs. ${data3.discount_hour_condition} Purchase amount at ${data3.discount_hour} hours.
                             <br>
                           </div>
                      </td>
                      </c:if>
                      
                      <c:if test="${data3.discount_date ne 'null'}">
                      <td align="center" style="color: #000">
                           <c:if test="${data3.discount_date eq date}">
                           <input type="radio" name="offername" value="DiscountDate" <%= discountdate_checked %>>
                           </c:if>
                           <font color="orange" class="offerheading"> Discount Date </font>
                           <div class="offerdetail">
                             <h5><center> Discount Date </center></h5>
                             Celebrate Discount Date with us on ${data3.discount_date}, and get ${data3.discount_date_percent}% off on Rs. ${data3.discount_date_condition} Purchase amount.
                             <br>
                           </div>
                      </td>
                      </c:if>
                      
                      <c:if test="${data3.discount_mealdeals eq 1}">
                      <td align="center" style="color: #000">
                          <font color="orange" class="offerheading"> Meal Deals </font>
                          <div class="offerdetail">
                             <h5><center> Meal Deals </center></h5>
                             Save money on our special meal deal off, lets check it out!
                             <br>
                           </div>
                      </td>
                      </c:if>
                      
                      </tr>
                </table>
                     </form>
                     </c:forEach>
                
       </c:forEach>
           
           <script>

    // presuming you've already included a reference to the jQuery library...

    $('.offerheading').hover( function () {
        // show the adjacent bubble content
       $(this).parent().find('.offerdetail').fadeIn("slow");
       
    
    },   
    function () {
        // hide the adjacent bubble content
        $(this).parent().find('.offerdetail').fadeOut("slow");

    });

</script>

       
       </div>
       

        <div id="main">
 
   <s:query var="rs1" sql="select * from item_category_${param['place']} Where FK_resDetail_PKey=${param['id']} ORDER BY Category_Rank Asc">
   </s:query>
   
   <div class="sticker" style=" width:180px;height: auto; margin-top: 10px; float: left ; -webkit-border-radius: 10px ; -moz-border-radius: 10px">
     <ul>
       <c:forEach items="${rs1.rows}" var="data1">
           
           <li><a href="#${data1.item_Category}" style=" color: black"> ${data1.item_Category}</a></li>
       </c:forEach>
     </ul>
   </div>     
            <div class="row">
            <div class="span3 sidebar">  
   <div class="sticker2" style="width:580px;height:auto; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
       <c:forEach items="${rs1.rows}" var="data1">
            <table width="100%" cellpadding="2">
                <tr> <th id="${data1.item_Category}" align="left" style=" background-color: seagreen; color: white "> ${data1.item_Category}</th></tr>
             </table>
            
                <c:set var="itemcatagorypkey" value="${data1.item_Catagory_PKey}"></c:set>
             <s:query var="rs2" sql="select * from menu_item_${param['place']} Where FK_resCategory_PKey=${itemcatagorypkey}">
             </s:query>
                           
             <table class="restraurantmaintable" width="100%" cellpadding="12">
                        <c:forEach items="${rs2.rows}" var="data2">
                            <c:if test="${data2.item_Price != 0}">        
                                    <tr style="background-color: white"> 
                                    <td><img src="ItemImage?id=${data2.menuItem_PKey}" width="80px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" ></td>
                                    <td align="left"><b>${data2.item_Name}(${data2.item_Quantity} Pcs)</b><br>${data2.item_Details}</td>
                                    <form name="orderform" id="FormToValidate" method="post" action="ShoopingCartA" target="cartwindow"> 
                                    <td align="right">
                                    <input type='text' name="quantity" maxlength="2" value="1" style=" width:30px">
                                    </td>
                                    <td align="center"><img src="img/rupee.jpg">${data2.item_Price}
                                    <br>
                                    ${data2.item_price_comments}
                                     
                                    <td><br><input type='hidden' name="name" value="<font size=2><b>${data2.item_Name}(${data2.item_Quantity} Pcs)</b></font><br><font size=2> ${data2.item_Details}</font> <br><font size=2>${data2.item_price_comments}</font>">
                                    <input type='hidden' name="price" value="${data2.item_Price}">
                                    <input type='hidden' name="minorder" value="${minorder}">
                                    <input type='hidden' name="id" value="${param['id']}">
                                    <input type='hidden' name="deliverycost" value="${deliverycost}">
                                    <input type='hidden' name="service" value="${param['service']}">
                                    <button class="image-button" id="btnValidate" name="action" title="Add to cart" value="Add"><img src="img/add_to_cart.png"></button>
                                   </tr>
                                    </form> 
                                    
                                    </c:if>
                                    <c:if test="${data2.item_Price_Half != 0}">
                                   <form name="orderform" id="FormToValidate" method="post" action="ShoopingCartA" target="cartwindow"> 
                                       <tr style="background-color: white">
                                           <tr style="background-color: white"> 
                                            <td><img src="ItemImage?id=${data2.menuItem_PKey}" width="80px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" ></td>
                                             <td align="left"><b>${data2.item_Name}(${data2.item_Quantity} Pcs)</b><br>${data2.item_Details}</td>
                                    
                                           <td align="right">
                                       <input type='text' name="quantity" style=" width: 30px" maxlength="2" value="1">
                                           </td>
                                           <td>
                                           <img src="img/rupee.jpg">${data2.item_Price_Half}
                                            <br>
                                              ${data2.item_price_half_comments}    
                                           </td>
                                           <td>
                                       <input type='hidden' name="city" value="${param['place']}">
                                    <input type='hidden' name="name" value="<font size=2><b>${data2.item_Name}(${data2.item_Quantity} Pcs)</b></font><br> ${data2.item_Details}<br><font size=2>${data2.item_price_half_comments}</font>">
                                    <input type='hidden' name="price" value="${data2.item_Price_Half}">
                                    <input type='hidden' name="minorder" value="${minorder}">
                                    <input type='hidden' name="id" value="${param['id']}">
                                    <input type='hidden' name="deliverycost" value="${deliverycost}">
                                    <input type='hidden' name="service" value="${param['service']}">
                                    <button class="image-button" id="btnValidate" name="action" title="Add to cart" value="Add"><img src="img/add_to_cart.png"></button>
                                           </td>
                                       </tr>
                                   </form>
                                   </c:if>
                                  
                                   <c:if test="${data2.item_price_discount != 0}">
                                   <form name="orderform" id="FormToValidate" method="post" action="ShoopingCartA" target="cartwindow"> 
                                     <tr style="background-color: white">
                                           <tr style="background-color: white"> 
                                            <td><img src="ItemImage?id=${data2.menuItem_PKey}" width="80px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" ></td>
                                             <td align="left"><b>${data2.item_Name}(${data2.item_Quantity} Pcs)</b><br>${data2.item_Details}</td>
                                    <td align="right">
                                       <input type='text' name="quantity" style=" width: 30px" maxlength="2" value="1">
                                           </td>
                                           <td>
                                           <img src="img/rupee.jpg">${data2.item_price_discount}
                                           <br>
                                            ${data2.item_price_discount_comments}
                                           </td>
                                           <td>
                                       <input type='hidden' name="city" value="${param['place']}">
                                    <input type='hidden' name="name" value="<font size=2><b>${data2.item_Name}(${data2.item_Quantity} Pcs )</b></font><br> ${data2.item_Details}<br><font size=2>${data2.item_price_discount_comments}</font>">
                                    <input type='hidden' name="price" value="${data2.item_price_discount}">
                                    <input type='hidden' name="minorder" value="${minorder}">
                                    <input type='hidden' name="id" value="${param['id']}">
                                    <input type='hidden' name="deliverycost" value="${deliverycost}">
                                    <input type='hidden' name="service" value="${param['service']}">
                                    <button class="image-button" id="btnValidate" name="action" title="Add to cart" value="Add"><img src="img/add_to_cart.png"></button>
                                           </td></tr>
                                   </form>
                                   </c:if>
                               </td>
                                 
                                </tr>
                                
                        
                        
                        </c:forEach>
             </table>
       </c:forEach>
   
   </div>
     </div>
              
   <div class="sticker1" style=" margin-left: 845px; width:350px;height:630px; margin-top: 10px;  -webkit-border-radius: 10px ; -moz-border-radius: 10px ; border: seagreen solid 2px ">
       <table width="100%">
       <c:forEach items="${rs.rows}" var="data">
           <tr><td><img src="FetchImage?id=${data.Res_PKey}" width="50px" style=" -webkit-border-radius: 10px; -moz-border-radius: 10px ; border:#000 solid 1px ; " ></td>        
           <td>
               <%
                 String whichservice = request.getParameter("service");
                 String delivery_checked = "";
                 String pickup_checked = "";
                 if(whichservice.equals("Delivery"))
                   delivery_checked = "checked" ;
                     else
                        pickup_checked = "checked";
               %>
               <form id="service" class="redirectOnChange">
               <table width="100%">
                   <tr><th>${data.Res_Name}</th>
                   <td>
                          <input type="radio" name="servicetype" value="Delivery" <%= delivery_checked%>><b> Delivery </b> 
                   </td>
                   </tr> 
                   <tr><td>YOUR ORDER</td>
                   <td>
                              <input type="radio" name="servicetype" value="Pickup"  <%= pickup_checked%>><b> Pickup </b> 
                   
                   </td>
                   
                   </tr>               
                   
               </table>
                              </form>
           </c:forEach>
           </td>
       </tr>
       </table>
       <div id="cart" style=" background-color: white ; width:335px;height:420px; margin-top: 4px; margin-left: 8px ; -webkit-border-radius: 10px ; -moz-border-radius: 10px  ">
              <h4 style="margin-left: 10px">Delivery to : ${param['location']} </h4>
              <iframe id="cartframe" width="335" height="400" frameBorder='0' name="cartwindow" style=" overflow: scroll ">
                 
              </iframe>
          
       </div>
              <br>
          <c:set var="offers" value="${param['offers']}" scope="session" />
          <c:set var="service" value="${param['service']}" scope="session" />
          <c:set var="id" value="${param['id']}" scope="session" />
          <c:set var="place" value="${param['place']}" scope="session" />
          <c:set var="location" value="${param['location']}" scope="session" />
        
          <c:if test="${message != null}">
          <div id="error-msg"><p>${message}</p>
          <div id="fadeout-div"></div>
          </div>
          <c:remove var="message" scope="session" /> 
          </c:if>
        <form name="placeorder" method="post" action="PlaceOrder">
            <input type="hidden" name="place" value="${param['place']}">
            <input type="hidden" name="location" value="${param['location']}">
            <input type="hidden" name="id" value="${param['id']}">
            <input type="hidden" value="${param['service']}" name="service">
            <input type="hidden" value="${minorder}" name="minorder">
            <input type="hidden" value="${param['offers']}" name="offers">
            <center><input type="submit" class="btn btn-large btn-success" id="submitcart" value="PLACE MY ORDER" /></center>
        </form>
          
   </div>
              <form id="checkout" method="post" action="ShoopingCartA" target="cartwindow">
                  
                  <c:forEach items="${rs3.rows}" var="data3"> 
                  <c:choose>
                  <c:when test="${param['offers'] eq 'Percentoff' && data3.discount_percent ne 0 }">
                      <c:set var="offer_percent" value="${data3.discount_percent}" scope="session" />
                      <c:set var="offer_condition" value="${data3.discount_percent_condition}" scope="session" />
                  <input type='hidden' name="offername" value="Percent discount">
                  <input type='hidden' name="offervalue" value="${data3.discount_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_percent_condition}">
                  </c:when>
                 
                  <c:when test="${param['offers'] eq 'FreeItem' && data3.discount_free_item ne 'null'}">
                      <c:set var="offer_percent" value="${data3.discount_initialize}" scope="session" />
                      <c:set var="offer_item_name" value="${data3.discount_free_item}" scope="session" />
                      <c:set var="offer_condition" value="${data3.discount_free_item_condition}" scope="session" />
                  <input type='hidden' name="offername" value="Free ${data3.discount_free_item}">
                  <input type='hidden' name="offervalue" value="${data3.discount_initialize}">
                  <input type='hidden' name="offercondition" value="${data3.discount_free_item_condition}">
                  </c:when>

                  
                  <c:when test="${param['offers'] eq 'Occasional' && data3.discount_name ne 'null'}">
                      <c:set var="offer_percent" value="${data3.discount_name_percent}" scope="session" />
                      <c:set var="offer_condition" value="${data3.discount_name_condition}" scope="session" />
                  <input type='hidden' name="offername" value="${data3.discount_name}">
                  <input type='hidden' name="offervalue" value="${data3.discount_name_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_name_condition}">
                  </c:when>
                  
                  <c:when test="${param['offers'] eq 'DiscountHour' && data3.discount_hour le time && time lt (data3.discount_hour+10000) && data3.discount_hour ne 'null'}">
                      <c:set var="offer_percent" value="${data3.discount_hour_percent}" scope="session" />
                      <c:set var="offer_condition" value="${data3.discount_hour_condition}" scope="session" />

                   <input type='hidden' name="offername" value="Discount Hour">
                  <input type='hidden' name="offervalue" value="${data3.discount_hour_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_hour_condition}">
                  </c:when>
                  
                  <c:when test="${param['offers'] eq 'DiscountDate' && data3.discount_date eq date && data3.discount_date ne 'null'}">
                      <c:set var="offer_percent" value="${data3.discount_date_percent}" scope="session" />
                      <c:set var="offer_condition" value="${data3.discount_date_condition}" scope="session" />

                  <input type='hidden' name="offername" value="Discount Date">
                  <input type='hidden' name="offervalue" value="${data3.discount_date_percent}">
                  <input type='hidden' name="offercondition" value="${data3.discount_date_condition}">
                  </c:when>
                  <c:otherwise>
                  <c:set var="offer_percent" value="${data3.discount_initialize}" scope="session"  />
                  <c:set var="offer_condition" value="${data3.discount_initialize}" scope="session" />

                  <input type='hidden' name="offername" value="Offer name not rechognised">
                  <input type='hidden' name="offervalue" value="${data3.discount_initialize}">
                  <input type='hidden' name="offercondition" value="${data3.discount_initialize}">
                  </c:otherwise>
                  </c:choose>
                  
                  </c:forEach>
                  
                  <input type='hidden' name="minorder" value="${minorder}">
                  <input type='hidden' name="deliverycost" value="${deliverycost}">
                  <input type='hidden' name="service" value="${param['service']}">
                  <input type='hidden' name="id" value="${param['id']}">
                  <input type='hidden' value='show' name='action'>
              </form>

                   <script>
                   document.getElementById("checkout").submit();
                   </script>

            </div>      
   </div>
    </div>
                  
                <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
                <link href="css/exampleold.css" rel="stylesheet" type="text/css"/>
                <script src="js/jquery.barrating.js"></script>
                <script>
                $(function () {
                $('#example-f').barrating('show', {
            showSelectedRating:false,        
            readonly:true
                });
            });
                 </script>
       
       <jsp:include page="footer.jsp" />
        
         
        <link rel="stylesheet" type="text/css" href="css/restaurant.css">
        <link href="css/jquery-ui-1.8.13.custom.css"   rel="stylesheet" type="text/css" />
        <link href="css/Site.css" rel="stylesheet" type="text/css" /> 
   
    <script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.wrapper.js" type="text/javascript"></script>
    <script src="js/stick_kers.js" type="text/javascript"></script>