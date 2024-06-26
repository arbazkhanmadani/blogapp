
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

<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
</head>
<body style="  background-image: radial-gradient( circle farthest-corner at 74.2% 50.9%,  rgba(14,72,222,1) 5.2%, rgba(3,22,65,1) 75.3% );
">


<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
	int id = Integer.parseInt(request.getParameter("id"));

%>

<nav class="navbar navbar-expand-lg " style=" background-color:white;box-shadow:1px 1px 4px 1px solid black;">
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

<div class="container rounded bg-white mt-5">
    	<form action="EditServlet" method="post" enctype="multipart/form-data">       
        <div class="col-md-9 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Please Edit Carefully</h4>
                </div>
                
                <div class="row mt-2">
                 <div class="col-md-12"><input name="id" type="hidden" class="form-control" placeholder="first name" value="<%=user.getId()%>"></div>
                   
                    <div class="col-md-12"><label class="labels">Name</label><input name="name" type="text" class="form-control" placeholder="first name" value="<%= user.getName()%>"></div>
                    <div class="col-md-12"><label class="labels">Email</label><input name="email" type="email" class="form-control" value="<%=user.getEmail()%>" placeholder="surname"></div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Gender</label><input name="gender" type="text" class="form-control" placeholder="enter phone number" value="<%=user.getGender().toUpperCase()%>"></div>
                <br/>
                <br/>
                <br/>
                    <div class="col-md-12 mt-4" ><label class="labels">Image</label><input name="image" type="file"/></div>
                
                </div>
                <div class="row mt-3">
                    <div class="col-md-12" ><label class="labels">Bio</label><hr/> <textarea name="about" style="resize:none;" cols="100" rows="5"><%=user.getAbout()%></textarea></div>
                
                </div>
                
                  <div class="modal-footer">
                        
                       <button  id="edit-profile-button" type="submit" class="btn btn-warning">SAVE</button>
                    
                    </div>
                     
             </div>
		</div>
		</form>
	</div>

</div>
</body>
</html>