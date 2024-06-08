<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%     
 			int gid = Integer.parseInt(request.getParameter("id"));
 			Connection con = ConnectionProvider.getConnection();
 			String q ="delete from user where id=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,gid);
            boolean rs = ps.execute();
            
            
            if(!rs){
            	response.sendRedirect("register_page.jsp");	
            }
            else{
            	response.sendRedirect("private_profile.jsp");		
            }
            
            
            
    %>
                   

</body>
</html>