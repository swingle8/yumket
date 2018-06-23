<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<c:if test="${sessionScope.usertype eq 'Admin'}">
    <c:redirect url="admin/cartadmin.jsp"/>
    </c:if>

    <c:if test="${sessionScope.usertype eq 'Restaurant'}">
    <c:redirect url="restaurant/restaurant.jsp"/>
    </c:if>
  
<jsp:include page="header.jsp" />
 <link rel="stylesheet" type="text/css" href="css/demo_table.css">
                <link href="css/jquery-ui-1.8.13.custom.css"   rel="stylesheet" type="text/css" />
                <link href="css/Site.css" rel="stylesheet" type="text/css" /> 
       
    
                 <script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
                 <script src="js/jquery.validate.min.js" type="text/javascript"></script>
                 <script src="js/jquery.validate.wrapper.js" type="text/javascript"></script> 
                <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		
                <link href="css/exampleold.css" rel="stylesheet" type="text/css"/>
                <script src="js/jquery.barrating.js"></script>
                <script src="js/redirect_on_change.js"></script> 
	</head>
        <body  class="ex_highlight_row">

<header class="header">
<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i></a>
    <a href="${requestScope['javax.servlet.forward.query_string']}"> <i class="icon-list-alt"></i></a>
    <a> <i class="icon-food" style=" opacity: 0.3"></i></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i></a>
   
</div>
<div  class="span6 mobile" >
<div class="pull-right">
        <form method="post" id="FormToValidate" action="tyo.jsp">
	<input class="span3" id="postcode" name="tyo_num" placeholder="TYO number" type="text"/>
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
 <jsp:useBean id="date" class="java.util.Date"/>
          <fmt:formatDate var="time"  
                          value="${date}"
                          pattern="HHMM"/>
   <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
<c:choose>
   <c:when test="${param['sort'] =='userratings'}" >
   <s:query var="rs" sql="select * from res_detail_delhi WHERE Res_Location = '${param['place']}' AND Res_service = '${param['service']}' AND Res_cuisine LIKE '%${param['cuisine']}%' AND Res_foodtype = '${param['foodtype']}' AND Res_OpenTime < ${time} AND Res_CloseTime > ${time} ORDER BY Res_Rating Desc" >
   </s:query>
   </c:when>
    
<c:when test="${param['sort'] =='minordercost'}">
   <s:query var="rs" sql="select * from res_detail_delhi WHERE Res_Location = '${param['place']}' AND Res_service = '${param['service']}' AND Res_cuisine LIKE '%${param['cuisine']}%' AND Res_foodtype = '${param['foodtype']}' AND Res_OpenTime < ${time} AND Res_CloseTime > ${time} ORDER BY Res_MinOrder_Amount Asc" >
   </s:query>
</c:when>

 <c:when test="${param['sort'] =='mindeliverycost'}">
   <s:query var="rs" sql="select * from res_detail_delhi WHERE Res_Location = '${param['place']}' AND Res_service = '${param['service']}' AND Res_cuisine LIKE '%${param['cuisine']}%' AND Res_foodtype = '${param['foodtype']}' AND Res_OpenTime < ${time} AND Res_CloseTime > ${time} ORDER BY Res_Mindelivery Asc" >
   </s:query>
 </c:when>

 </c:choose>
         
	
<div class="container">
                    
                     
           <div style="height:auto;position:relative">
	    
               <div class="span3 sidebar" style=" margin-left: 0px; width:16%;height:auto;margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background: #e6e6e6 ; display: inline-block; position: relative">
            <h5>
                <%
                 String whichservice = request.getParameter("service");
                 String delivery_checked = "";
                 String pickup_checked = "";
                 if(whichservice.equals("Delivery"))
                   delivery_checked = "checked" ;
                     else
                        pickup_checked = "checked";
                %>
                <form id="service" class="redirectOnChange" style=" margin-left: 5px" >
                    <input type="radio" name="servicetype" value="Delivery" <%= delivery_checked%>> Delivery/Pickup <br>
                    <input type="radio" name="servicetype" value="Pickup" <%= pickup_checked%>>  Pickup
                </form>
            </h5>
                
                <h5>select cuisine : </h5>
                <%
                 String whichcuisine = request.getParameter("cuisine");
                 String cuisine_all=" ", cuisine_biryani=" ", cuisine_chinese=" ", cuisine_continental=" ", cuisine_ff=" ", cuisine_hyderabadi=" ", cuisine_italian=" ", cuisine_japanese=" ", cuisine_mexican=" ", cuisine_me=" ", cuisine_nim=" ", cuisine_pa=" ", cuisine_pizza=" ", cuisine_ss=" ", cuisine_si=" ", cuisine_sweets=" " ;
                 if(whichcuisine.equals("Biryani"))
                 cuisine_biryani="checked";
                 else if(whichcuisine.equals("Chinese"))
                 cuisine_chinese="checked";
                 else if(whichcuisine.equals("Continental"))
                 cuisine_continental="checked";
                 else if(whichcuisine.equals("Fast-Food"))
                 cuisine_ff="checked";
                 else if(whichcuisine.equals("Hyderabadi"))
                 cuisine_hyderabadi="checked";
                 else if(whichcuisine.equals("Italian"))
                 cuisine_italian="checked";
                 else if(whichcuisine.equals("Japanese"))
                 cuisine_japanese="checked";
                 else if(whichcuisine.equals("Mexican"))
                 cuisine_mexican="checked";
                 else if(whichcuisine.equals("Middle-Eastern"))
                 cuisine_me="checked";
                 else if(whichcuisine.equals("North-Indian-Mughlai"))
                 cuisine_nim="checked";
                 else if(whichcuisine.equals("Pan-Asian"))
                 cuisine_pa="checked";
                 else if(whichcuisine.equals("Pizza"))
                 cuisine_pizza="checked";
                 else if(whichcuisine.equals("Salads-Sandwiches"))
                 cuisine_ss="checked";
                 else if(whichcuisine.equals("South-Indian"))
                 cuisine_si="checked";
                 else if(whichcuisine.equals("Sweets"))
                 cuisine_sweets="checked";
                 else
                 cuisine_all ="checked" ;

                 %>
                
                <form id="cuisine" class="redirectOnChangeCuisine" style=" margin-left: 5px">
                    <input type="radio" name="cuisinetype" value="" <%= cuisine_all%>>  All Cuisine<br>
                 <input type="radio" name="cuisinetype" value="Biryani" <%= cuisine_biryani%>>  Biryani<br>
                 <input type="radio" name="cuisinetype" value="Chinese" <%= cuisine_chinese%>>  Chinese<br>
                 <input type="radio" name="cuisinetype" value="Continental" <%= cuisine_continental%>>  Continental<br>
                 <input type="radio" name="cuisinetype" value="Fast-Food" <%= cuisine_ff%>>  Fast Food (Wraps, Burgers & more)<br>
                 <input type="radio" name="cuisinetype" value="Hyderabadi" <%= cuisine_hyderabadi%>>  Hyderabadi<br>
                 <input type="radio" name="cuisinetype" value="Italian" <%= cuisine_italian%>>  Italian<br>
                 <input type="radio" name="cuisinetype" value="Japanese" <%= cuisine_japanese%>>  Japanese<br>
                 <input type="radio" name="cuisinetype" value="Mexican" <%= cuisine_mexican%>>  Mexican<br>
                 <input type="radio" name="cuisinetype" value="Middle-Eastern" <%= cuisine_me%>>  Middle Eastern<br>
                 <input type="radio" name="cuisinetype" value="North-Indian-Mughlai" <%= cuisine_nim%>>  North Indian - Mughlai<br>
                 <input type="radio" name="cuisinetype" value="Pan-Asian" <%= cuisine_pa%>>  Pan-Asian<br>
                 <input type="radio" name="cuisinetype" value="Pizza" <%= cuisine_pizza%>>  Pizza<br>
                 <input type="radio" name="cuisinetype" value="Salads-Sandwiches" <%= cuisine_ss%>>  Salads & Sandwiches<br>
                 <input type="radio" name="cuisinetype" value="South-Indian" <%= cuisine_si%>>  South Indian<br>
                 <input type="radio" name="cuisinetype" value="Sweets" <%= cuisine_sweets%>>  Sweets<br>
                </form>
                <hr>
                                <h5>Food Type : </h5>
                <%
                 String whichfood = request.getParameter("foodtype");
                 String ft_both = " ";
                 String ft_vegetarian = " ";
                 String ft_nonvegetarian = " ";
                 if(whichfood.equals("Both"))
                   ft_both = "checked" ;
                 else if(whichfood.equals("Vegetarian"))
                   ft_vegetarian = "checked";
                 else if(whichfood.equals("Non-Vegetarian"))
                   ft_nonvegetarian = "checked";
                %>
                <form id="foodtype" class="redirectOnChangeft" style=" margin-left: 5px">
                 <input type="radio" name="food" value="Both" <%= ft_both%> >  Both Types<br>
                 <input type="radio" name="food" value="Vegetarian" <%= ft_vegetarian%> >  Vegetarian<br>
                 <input type="radio" name="food" value="Non-Vegetarian" <%= ft_nonvegetarian%> >  Non-Vegetarian<br>
                </form>
                <hr>
                
                <h5>Show Restaurants by : </h5>
                  <%
                 String whichsort = request.getParameter("sort");
                 String sort_reviews = " ";
                 String sort_ordercost = " ";
                 String sort_deliverycost = " ";
                 if(whichsort.equals("userratings"))
                   sort_reviews = "checked" ;
                 else if(whichsort.equals("minordercost"))
                   sort_ordercost = "checked";
                 else if(whichsort.equals("mindeliverycost"))
                   sort_deliverycost = "checked";
                %>
                <form id="sort" style=" margin-left: 5px">
                    <input type="radio" name="sorttype" value="userratings" <%= sort_reviews%> >  User Ratings<br>
                  <input type="radio" name="sorttype" value="minordercost" <%= sort_ordercost%> >  Min Order Cost<br>
                <input type="radio" name="sorttype" value="mindeliverycost" <%= sort_deliverycost%> >  Min Delivery Cost<br>
                </form>
                
                
            </div>
               
               
                         
             <div style="width:84%;height:auto ; margin-left: auto; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background: white; display: inline-block;">            
				
			<div id="demo">
<table width='100%' cellpadding="0" cellspacing="0" border="0" class="display" id="example" style=" table-layout: fixed">
	<thead>
                <tr>
                     <th></th>
                     <th></th>
                    <th align="center">Cuisine</th>
                    <th align="center">Min Order</th>
                    <th align="center">Delivery cost</th>
                    <th align="center">Speed</th>
                    <th align="center">Offers</th>
                    <th align="center">Rating</th> 
                </tr>
        </thead>
<tbody>
<c:forEach items="${rs.rows}" var="data">
     <c:set var="stara" value="" />
     <c:set var="starb" value="" />
     <c:set var="starc" value="" />
     <c:set var="stard" value="" />
     <c:set var="stare" value="" />
                  
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
       
     
     <tr>
     <td align="center" width="10%"><a href="restaurant.jsp?place=delhi&id=${data.Res_PKey}&location=${data.Res_Location}&service=${param['service']}&offers=Percentoff"><img src="FetchImage?id=${data.Res_PKey}" width="80" style="-webkit-border-radius: 10px ; -moz-border-radius: 10px" /></a></td>
     <td><b><a href="restaurant.jsp?place=delhi&id=${data.Res_PKey}&location=${data.Res_Location}&service=${param['service']}&offers=Percentoff"> ${data.Res_Name} </a></b>
             <br> ${data.Res_FullAddress} 
             <br> ${data.Res_Location}
             <br> ${data.Res_OpenTime} to ${data.Res_CloseTime} Hours
     </td>
                     <td align="center" style=" overflow: hidden; text-overflow: ellipsis "> ${data.Res_cuisine}</td>
                     <td align="center"><img src="img/rupee.jpg"> ${data.Res_MinOrder_Amount}/-</td>
                     <td align="center"><img src="img/rupee.jpg"> ${data.Res_Mindelivery}/-</td>
                     <td align="center"> ${data.Res_servicetime}/10.0</td>
                     
                     <td align="center"> 

                      
                    <a href="#my-offers" data-toggle="modal">
                     <s:query var="rs2" sql="select * from discount_delhi where discount_res_id='${data.Res_PKey}' " ></s:query>
                     <c:forEach items="${rs2.rows}" var="data2">
                        
                         
                     <font color="red">
                     <c:if test="${data2.discount_percent ne 0}">
                      ${data2.discount_percent}% off 
                     </c:if>
                     
                      <c:if test="${data2.discount_free_item ne 'null'}">
                      <br>
                      Free Item 
                      </c:if>
                    
                      <c:if test="${data2.discount_name ne 'null'}">
                      <br>
                      ${data2.discount_name}
                      </c:if>  
                      
                      <c:if test="${data2.discount_hour ne 'null'}">
                      <br>
                      Discount Hour
                      </c:if>
                      
                      <c:if test="${data2.discount_date ne 'null'}">
                      <br>
                      Discount Date
                      </c:if>
                      
                      <c:if test="${data2.discount_mealdeals eq 1}">
                      <br>
                      Meal Deals
                      </c:if>
                      </font>
                     </c:forEach>
                     </a>
                     
                     </td>
                     <td align="center">
                         
            <div class="input select rating-f">
            <select class="example-f">
                <option value="1" ${stara} >1</option>
                <option value="2" ${starb} >2</option>
                <option value="3" ${starc} >3</option>
                <option value="4" ${stard} >4</option>
                <option value="5" ${stare} >5</option>
            </select>
            </div>
                         ${data.Res_Rating}/10.0</td>
        </tr>
</c:forEach>
    </tbody>  
    <tfoot>
                    <tr>
                    <th></th>
                    <th></th> 
                    <th>Cuisine</th>
                    <th>Min Order</th>
                    <th>Delivery cost</th>
                    <th>Speed</th>
                    <th>Offers</th>
                    <th>Rating</th> 
                </tr>
                </tfoot>
</table>
			</div>
                 
             </div>
                </div>	
		</div>
	<jsp:include page="footer.jsp" />

        <div id="my-offers" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Offers</h4>
                </div>

                <div class="modal-body">
                <div class="cntr">
		<br>
                 
                </div>
		</div>
                <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
</div>