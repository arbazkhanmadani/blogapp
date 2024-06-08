
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

</head>
<body>


<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
	int id = Integer.parseInt(request.getParameter("id"));

%>

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
                    <div class="col-md-12" ><label class="labels">Image</label><input name="image" type="file"/></div>
                
                </div>
                <div class="row mt-3">
                    <div class="col-md-12" ><label class="labels">Bio</label><hr/> <textarea name="about" style="resize:none;" cols="120" rows="5"><%=user.getAbout()%></textarea></div>
                
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