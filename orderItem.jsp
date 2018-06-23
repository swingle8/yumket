<%-- 
    Document   : orderItem
    Created on : Oct 28, 2011, 2:36:26 PM
    Author     : Mark Pendergast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cart.*"%>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
   <%
    //
    // set the session's inactive interval
    //
       session.setMaxInactiveInterval(1800); // 30 minutes
       
   //
   // get the action
   //
    String action = request.getParameter("action");
    if(action.equals("Add"))   // process add item 
    {      
     //
    // first get the data from the html form
    //     
    try{               
      String name = request.getParameter("name");
      int id = Integer.parseInt(request.getParameter("id"));               
      int minorder = Integer.parseInt(request.getParameter("minorder"));
      int deliverycost = Integer.parseInt(request.getParameter("deliverycost"));
      int quantity = Integer.parseInt(request.getParameter("quantity"));
      double price = Double.parseDouble(request.getParameter("price"));
      String service = request.getParameter("service");    
       
      
    // create an item to add to the cart
    // 
      Item item = new Item(name, minorder, deliverycost , quantity ,price, service);
    //
    // now access the cart and add the item
    //
      
     
       synchronized(session)  // lock session protect this from multiple threads
      {
           
       Integer sessionid = (Integer)session.getAttribute("Id");
       TotalAmount cart = (TotalAmount)session.getAttribute("Cart");
       if(cart == null || sessionid != id)  // new sesssion, just create a cart
       {
        cart = new TotalAmount();
        session.setAttribute("Cart", cart);
       }
       
       cart.add(item); // cart uses ArrayList which is not thread safe so we locked
       cart.display(out); // tell the cart to send its contents to the browser
      } // end synchronization lock
      }
      catch(Exception ex)
      {
       out.println(ex.toString()); // show the exception for now
      }
     }
    
     else if(action.equals("Remove"))
     {
     try{               
      int id = Integer.parseInt(request.getParameter("id"));               
      String name = request.getParameter("name");
      int minorder = Integer.parseInt(request.getParameter("minorder"));
      int deliverycost = Integer.parseInt(request.getParameter("deliverycost"));
      int quantity = Integer.parseInt(request.getParameter("quantity"));
      double price = Double.parseDouble(request.getParameter("price"));
      String service = request.getParameter("service");    
    
    //
    // create an item to add to the cart
    //
      Item item = new Item(name, minorder, deliverycost, quantity ,price, service);
    //
    // now access the cart and add the item
    //
       synchronized(session)  // lock session protect this from multiple threads
      {
        Integer sessionid = (Integer)session.getAttribute("Id");
        TotalAmount cart = (TotalAmount)session.getAttribute("Cart");
       if(cart == null || sessionid != id)  // new sesssion, just create a cart
       {
        cart = new TotalAmount();
        session.setAttribute("Cart", cart);
       }
       cart.remove(item); // cart uses ArrayList which is not thread safe so we locked
       cart.display(out); // tell the cart to send its contents to the browser
      } // end synchronization lock
      }
      catch(Exception ex)
      {
       out.println(ex.toString()); // show the exception for now
      }
    
    
    
    }
    
    else if(action.equals("show")){
    try{
      int id = Integer.parseInt(request.getParameter("id"));               
      int minorder = Integer.parseInt(request.getParameter("minorder"));
      int deliverycost = Integer.parseInt(request.getParameter("deliverycost"));
      String service = request.getParameter("service");        
     //out.println(service);
      ItemDisplay itemdisplay = new ItemDisplay(minorder, deliverycost, service);
   
        
     synchronized(session)  // lock session protect this from multiple threads
      {
       Integer sessionid = (Integer)session.getAttribute("Id");
       TotalAmount cart = (TotalAmount)session.getAttribute("Cart");
      //out.println(sessionid);   
        
       if(cart == null || sessionid != id)  // new sesssion, just create a cart
       {
        //out.println(sessionid);    
        cart = new TotalAmount();
        session.setAttribute("Cart", cart);
        session.setAttribute("Id", id);
       }
       cart.firstdisplay(itemdisplay);
       cart.display(out); // tell the cart to send its contents to the browser
      }
    }
    catch(Exception ex){
    out.println(ex.toString());
    }
    
    }
    

        %>
    </body>
</html>
