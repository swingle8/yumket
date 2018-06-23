<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
    <header class="header">
	

<div class="headerSection">
<div class="container">
<div class="row">
<div class="span6 menuu" >
    
    <a href="index.jsp"> <i class="icon-home"></i>  <span>HOME </span></a>
    <a> <i class="icon-list-alt" style=" opacity: 0.3"></i>  <span>MENU </span></a>
    <a> <i class="icon-food" style=" opacity: 0.3"></i> <span>Registration</span></a>
    <a> <i class="icon-shopping-cart" style=" opacity: 0.3"></i> <span class="simpleCart_grandTotal"> </span></a>
    
</div>
<!-- // more data -->

</div>
</div>
</div>
</div>   

    </header>
    <div class="container">
    <div class="row">
    <div class="span3 sidebar" style="width:800px;height:700px;margin-top: 10px ; margin-left: 20px ">
        <h2><font color='orabge'>Feedback</font></h2>
        <br>
        <h4>we are constantly striving to provide you with a great service and are always looking for ways to improve. Please let us know what you think of our service:</h4>

        <form  class="form-horizontal" action="Feedback" accept-charset="utf-8" method="post">
            <select name="city" required="true">
                   <option>Delhi</option>
               </select>
               <br><br>
            
               <textarea name="feedback_details" rows="7" required="true" style=" width: 100%" maxlength="300" placeholder="please write what's in your heart in maximum 300 word."></textarea>
        <br><br>	    
        <input type="submit" id="btnValidate" value="Take my view" class="btn btn-large btn-success" name="action" />       
        </form>
   </div>
        
        <div style="width:355px;height:400px; margin-top: 10px; margin-left:auto ; -webkit-border-radius: 10px ; -moz-border-radius: 10px ; background-color: white ">
            <br>
            <center><h3>Is your favourite restaurant missing?</h3>
            <form  class="form-horizontal" action="Feedback" accept-charset="utf-8" method="post">
               
               <div class='control-group'>
	       <input type="text" name='restaurant_name'  placeholder="Restaurant Name"  required="required" value="" />
               <br><br>
               
               <input type="text" name='restaurant_location'  placeholder="Restaurant location" required="required" value="" />
               <br><br>
               
               
               <select name="place" required="true">
                   <option>Chandni-Chok</option>
               </select>
            <br><br>
            
               <select name="city" required="true">
                   <option>Delhi</option>
               </select>
               <br><br>
               
            
               <center>    
            <input type="submit" id="btnValidate" value="Add this restaurant" class="btn btn-large btn-success" name="action" />       
           </center>
            </form>
                </center>
            <br>
           ${param.message} 
        
        </div>    
    </div>
    </div>
<jsp:include page="footer.jsp" />

