<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
                    String sn=request.getParameter("pkey");
                    //int a = Integer.parseInt(sn);
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/res_db","root","root");
                    Statement s=c.createStatement();
                     ResultSet rs = s.executeQuery("select * from res_detail_delhi where Res_PKey='"+sn+"'");  // this is for name
                    if(rs.next())
                    { 
   %>                     
          <h3> 
                      <% out.println(rs.getString(2));%>  
          </h3>           
                      <h4> 
                      <% out.println(rs.getString(18)); %>
 </h4>
                      <% out.println(rs.getString(19)); %>   
    <h4>
                      <% out.println(rs.getString(20)); %>
    </h4>
                      <%  out.println(rs.getString(21)); %> 
    <h4>                   
                      <%    out.println(rs.getString(22)); %>
   </h4>
                      <%  out.println(rs.getString(23)); %>
    <h4>                  
                       <% out.println(rs.getString(24)); %>
    </h4>                   
                       <% out.println(rs.getString(25)); %>
    <h4>                   
                       <% out.println(rs.getString(26)); %>
    </h4>                   
                       <% out.println(rs.getString(27));                    
 
                    }
 
rs.close();
s.close();
c.close();
 
%>