<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%     
 			int pid = Integer.parseInt(request.getParameter("post_id"));
 			Connection con = ConnectionProvider.getConnection();
 			String q ="delete from posts where pid=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,pid);
            boolean rs = ps.execute();
            
            
            if(!rs){
            	System.out.println("ddfwwfeewfefefef"+"+++++++++++++++++++++++++++++++++++=");
            	Message msg1 = new Message("post deleted Successfully", "success", "alert-success");
            	session.setAttribute("msg1", msg1);
            	response.sendRedirect("private_profile.jsp");
            	
            }
            else{
            	
            	Message msg2 = new Message("Invalid Details ! try with another", "error", "alert-danger");
            	session.setAttribute("msg1", msg2);
            	response.sendRedirect("private_profile.jsp");
            	 
            }
            
            
            
    %>
                   

</body>
</html>