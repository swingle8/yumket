<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*"%>
    <%@page  isELIgnored="false"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ page session="true" %>
    <%@ page import="cart.*"%>
    
   <s:setDataSource
    driver="${initParam.driver}"
    url="${initParam.url}"
    user="${initParam.user}"
    password="${initParam.password}"/>
  <s:query var="rs" sql="select * from res_detail_${param['place']} WHERE Res_PKey = '${param['id']}'" >
  </s:query>
      
   <jsp:include page="header.jsp" />        
         </head>
      <body>
    <header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i>  <span>HOME </span></a>
    <a href="${param['place']}.jsp?location=${param['place']}&place=${param['location']}&service=Delivery&cuisine=&foodtype=Both&sort=userratings"> <i class="icon-list-alt"></i>  <span>MENU </span></a>
    <a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}"> <i class="icon-food"></i></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i></a>
   
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
            <td><a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}"><img src="FetchImage?id=${data.Res_PKey}&offers=${param['offers']}" width="90px" style="-webkit-border-radius: 10px; -moz-border-radius: 10px ; margin-left: 20px" ></a></td>
        <td>
            <table width="100%">    
                <tr><td align=left valign=top ><h3><a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}" style="color: orangered"> ${data.Res_Name} </a></h3></td>
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
           <c:set var="overall_rating" value="${data.Res_Rating}" />
                        
                         <a href="restaurant.jsp?place=${param['place']}&id=${param['id']}&location=${param['location']}&service=${param['service']}&offers=${param['offers']}">Show menu</a></td></tr>
                <tr><td> ${data.Res_FullAddress} </td><td align="left">Minimum order cost : Rs ${minorder}</td></tr>
                <tr><td> ${data.Res_OpenTime} to ${data.Res_CloseTime} Hours </td><td align="left">Delivery cost : Rs ${data.Res_Mindelivery}</td></tr>

        </table>
            
        </td>
            </table>
    <table width="100%">
                <s:query var="rs3" sql="select * from discount_${param['place']} where discount_res_id='${param['id']}' " ></s:query>
                     <c:forEach items="${rs3.rows}" var="data3">
                     
                     <form id="offers" class="redirectOnChange">
                       <table width="100%">  
                         <tr>
                     <c:if test="${data3.discount_percent ne null}">
                      <td align="center" style="color: #000">
                          <font color="orange" class="offerheading" > Percent off </font> 
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
                     
                      <c:if test="${data3.discount_free_item ne null}">
                      <td align="center" style="color: #000">
                          <font color="orange" class="offerheading"> Free Item </font> 
                          <div class="offerdetail">
                             <h5><center>Free Item</center></h5>
                             Shop Rs. ${data3.discount_free_item_condition} to get ${data3.discount_free_item} item Free!
                             <br>
                            </div>
                      </td>
                      </c:if>
                    
                      <c:if test="${data3.discount_name ne null}">
                      <td align="center" style="color: #000">
                          <font color="orange" class="offerheading"> Occasional </font>
                          <div class="offerdetail">
                             <h5><center>${data3.discount_name}</center></h5>
                             Celebrate ${data3.discount_name} with us, and get ${data3.discount_name_percent}% off on Rs. ${data3.discount_name_condition} Purchase amount.
                             <br>
                          </div>
                      </td>
                      </c:if>  
                      
                      <c:if test="${data3.discount_hour ne null}">
                      <td align="center" style="color: #000">
                          <font color="orange" class="offerheading"> Discount Hour </font>
                           <div class="offerdetail">
                             <h5><center> Discount Hour </center></h5>
                             Celebrate Discount Hour with us, and get ${data3.discount_hour_percent}% off on Rs. ${data3.discount_hour_condition} Purchase amount at ${data3.discount_hour} hours.
                             <br>
                           </div>
                      </td>
                      </c:if>
                      
                      <c:if test="${data3.discount_date ne null}">
                      <td align="center" style="color: #000">
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
            <div class="row">
   <s:query var="rs1" sql="select * from review_restaurant Where review_res_id=${param['id']} AND admin_verify='1' ORDER BY review_Pkey Desc"></s:query>              
   <div class="span3 sidebar" style="width:700px;height:auto; margin-top: 10px; -webkit-border-radius: 10px ; -moz-border-radius: 10px ">
       <table width="80%"><tr>
               <td width="55%"><h2>Overall Rating: <font color="orange">${overall_rating} </font></h2></td>
           
           <td width="14%"> | Food : 
              <c:set var="food_rating" value="0"/>
              <c:set var="number_rows" value="0"/>
              <c:forEach var="data2" items="${rs1.rows}">
                  <c:set var="number_rows" value= "${number_rows+1}" />
                  <c:set var="food_rating" value= "${data2.review_food + food_rating}" />
              </c:forEach>
              <c:set var="final_food_rating" value="${food_rating/number_rows}" />
                  ${final_food_rating}</td>
           
           <td width="16%"> | Value : 
              <c:set var="value_rating" value="0"/>
              <c:set var="number_rows" value="0"/>
              <c:forEach var="data2" items="${rs1.rows}">
                  <c:set var="number_rows" value= "${number_rows+1}" />
                  <c:set var="value_rating" value= "${data2.review_value + value_rating}" />
              </c:forEach>
              <c:set var="final_value_rating"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2"  value="${value_rating/number_rows}" /></c:set>
                  ${final_value_rating}</td>
           
           <td width="15%"> | Service : 
              <c:set var="service_rating" value="0"/>
              <c:set var="number_rows" value="0"/>
              <c:forEach var="data2" items="${rs1.rows}">
                  <c:set var="number_rows" value= "${number_rows+1}" />
                  <c:set var="service_rating" value= "${data2.review_service + service_rating}" />
              </c:forEach>
              <c:set var="final_service_rating" value="${service_rating/number_rows}" />
                  ${final_service_rating}</td>
           
           
       </tr></table>           
               <c:forEach var="data1" items="${rs1.rows}">
           <table width="100%">
               <tr><th width="14%"><h4>Overall : ${data1.review_overall}</h4></th>
                   <td width="10%">Food : ${data1.review_food}</td>
                   <td width="10%">value : ${data1.review_value}</td>
                   <td width="10%">service : ${data1.review_service}</td>
                   <td align="right">${data1.review_date}</td>
               </tr>
           </table>
           <table width="100%">
               <tr>
               <td width="90%">${data1.review_details}</td>
               <td align="right">${data1.review_name}</td>
               </tr>
           </table>
           <hr>
               </c:forEach>
   </div>
    
                <c:if test="${sessionScope.ratings_flag == null || sessionScope.res_id ne param['id']}">            
   <div style=" margin-left: 800px; width:400px;height:auto ; margin-top: 10px;  -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background-color: white ">
          ${param.message}
    <center><h3><font color="green">Want to rate us ?</font></h3></center>   
       <form class="form-horizontal" id="FormToValidate" action="VerifyUserRatings" accept-charset="utf-8" method="post">
		    <label class="control-label">E-mail address:</label>
                    <input type="text" name='ratings_id' placeholder="E-mail address" style="width: 200px" required="required" id="form_userEmail" value="" />
	<br><br>
                <label class="control-label">Mobile number:</label>
	        <input type="text" name="ratings_mobile" required="required" placeholder="Mobile number" style="width: 200px" value="" />
	  <br><br>      
           <input type="hidden" name="ratings_place" value="${param['place']}">
           <input type="hidden" name="res_id" value="${param['id']}">
           <input type="hidden" name="ratings_location" value="${param['location']}">     
           <input type="hidden" name="ratings_service" value="${param['service']}">
           <center><input type="submit" id="btnValidate" value="verify me" class="btn btn-large btn-success" name="action" /></center>
      </form>
   </div>
           
           
</c:if>
                
   <c:if test="${sessionScope.ratings_flag == 'high' && sessionScope.res_id eq param['id']}">            
   <div style=" margin-left: 800px; width:400px;height:auto; margin-top: 10px;  -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background-color: white  ">
       <h3><font color="green">Hello ${sessionScope.ratings_name} : Add your review</font></h3>   
       Only comments directly related to your restaurant experience will be published. Swearing, personal attacks or competitor comparisons will not be published.
     <hr>
       <form class="form-horizontal" action="VerifyUserRatings" accept-charset="utf-8" method="post">

           <div class="input select rating-a">
            <label for="example-a">Rate Food :</label>   
            <label for="example-a"><font color="darkgreen"><h4>Poor--------------------------Average-----------------------Excellent</h4></font></label>
            <select id="example-a" name="rate_food">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5" selected="selected">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>
           
           <div class="input select rating-b">
            <label for="example-b">Rate Value:</label>
           <select id="example-b" name="rate_value">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5" selected="selected">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>
           
           <div class="input select rating-c">
            <label for="example-c">Rate Service:</label>
           <select id="example-c" name="rate_service">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5" selected="selected">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>
           <b>Your Experience:</b>	       
           <textarea name="rate_details" rows="5" maxlength="100" required="true" style=" width: 390px" placeholder="To make your review more relevant consider adding restaurant name, cuisine and food item to your review. (word limit is 100)"></textarea>
           <br>
           <input type="hidden" name="ratings_place" value="${param['place']}">
           <input type="hidden" name="res_id" value="${param['id']}">
           <input type="hidden" name="ratings_location" value="${param['location']}">     
           <input type="hidden" name="ratings_service" value="${param['service']}">
           <center> <input type="submit" value="Add my review" class="btn btn-large btn-success" id="form_submit" name="action" /></center>
	</form>
   </div>
</c:if>
                
                
  </div>      
   </div>
    </div>         
 <jsp:include page="footer.jsp" />
 
  <link href="css/exampleold.css" rel="stylesheet" type="text/css"/>
      <script src="js/jquery.barrating.js"></script>
      <link rel="stylesheet" type="text/css" href="css/restaurant.css">
       
   <link href="css/jquery-ui-1.8.13.custom.css"   rel="stylesheet" type="text/css" />
    <link href="css/Site.css" rel="stylesheet" type="text/css" /> 
   
    <script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.wrapper.js" type="text/javascript"></script>
    <script src="js/ratings.js" type="text/javascript"></script>
    