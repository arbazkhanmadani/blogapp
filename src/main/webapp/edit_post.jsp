
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <style>
  
  		body{
  				background-image: radial-gradient( circle farthest-corner at 74.2% 50.9%,  rgba(14,72,222,1) 5.2%, rgba(3,22,65,1) 75.3% );
  			
  		}
  </style>      
 
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark" style=" background:white;box-shadow:1px 1px 4px 1px solid black;">
    <a style='color:purple;' class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Bloggy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
           

            <li class="nav-item dropdown">
                <a style='color:purple;' class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a style='color:purple;' class="dropdown-item" href="#">Programming Language</a>
                    <a style='color:purple;' class="dropdown-item" href="#">Project Implementation</a>
                    <div class="dropdown-divider"></div>
                    <a style='color:purple;' class="dropdown-item" href="#">Data Structure and <br/>algorithm</a>
                </div>
            </li>

            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="profile.jsp"> <span class="	fa fa-address-card-o"></span>Home Profile</a>
            </li>
            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="private_profile.jsp"> <span class="	fa fa-address-card-o"></span>Profile</a>
            </li>
            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span>Logout</a>
            </li>
          
        </ul>
       
    </div>
</nav>

<%     
 			int pid = Integer.parseInt(request.getParameter("post_id"));
		
 			Connection con = ConnectionProvider.getConnection();
 			String q ="select * from posts where pid=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,pid);
            ResultSet rs = ps.executeQuery();
            
            String t = "";
            String c = "";
            String cod = "";
            
            
            while(rs.next()){
            
            	t = rs.getString("pTitle");
            	c = rs.getString("pContent");
            	cod = rs.getString("pCode");
            	
            }
            /*if(!rs){
            	System.out.println("ddfwwfeewfefefef"+"+++++++++++++++++++++++++++++++++++=");
            	Message msg1 = new Message("post deleted Successfully", "success", "alert-success");
            	session.setAttribute("msg1", msg1);
            	response.sendRedirect("private_profile.jsp");
            	
            }
            else{
            	
            	Message msg2 = new Message("Invalid Details ! try with another", "error", "alert-danger");
            	session.setAttribute("msg1", msg2);
            	response.sendRedirect("private_profile.jsp");
            	 
            }*/
    %>
    
    
    <div class="container mt-5" style="background:white;border-radius:5px;">
    	<div class="row">
    		<form action="updatePostServlet" method="post" enctype="multipart/form-data">
    			
    			<div class="col-md-12 mb-2 mt-4">
    					<input class="form-control" type="hidden" value="<%=pid%>" name="post_id" />
    			</div>
    			<div class="col-md-12 mb-2">
    					<input class="form-control" type="text" value="<%=t%>" name="t" />
    			</div>
    			<div class="col-md-12 mb-2">
    					<input class="form-control" type="file" value="" name="img"/>
    			</div>
    			<div class="col-md-12 mb-2">
    					<textarea name="cd" style="resize:none;" class="form-control" rows="7" cols=85"><%=c %></textarea>
    			</div>
    			<div class="col-md-12 mb-2">
    					<textarea name="c" style="resize:none;" class="form-control" rows="7" cols="85"><%=cod %></textarea>
    			</div>
    		
    		<div class="col-md-12 mb-2">
    					<input  class="btn btn-warning mt-3 mb-3" type="submit" value="update"  style="color:white;"/>
    			</div>
    			
    		
    		</form>
    	</div>
    </div>
    

</body>
</html>