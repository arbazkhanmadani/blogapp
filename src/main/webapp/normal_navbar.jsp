
<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.*, java.text.DateFormat, java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.tech.blog.helper.ConnectionProvider" %>
<%
   User user = (User) session.getAttribute("currentUser");
    if (user != null) {
       // response.sendRedirect("login_page.jsp");
    }
%>
<style>

nav a:hover{
	style='color:black;'
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark" style=" background-image: linear-gradient(200deg,white);box-shadow:1px 1px 4px 1px solid black;">
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
                <a style='color:purple;'' class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
            </li>
            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="login_page.jsp"> <span class="fa fa-user-circle "></span> Login</a>
            </li>
            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus "></span> Sign up</a>
            </li>
            <li class="nav-item">
            	<%
   					User user1 = (User) session.getAttribute("currentUser");
    				if (user1!= null) {
    				%>
    				  <a style='color:purple;' class="nav-link" href="private_profile.jsp"> <span class="fa fa-user-plus "></span>profile</a>
            
       			<%}%>
            
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button style='outline:purple;border:1px solid purple;background:transparent;' class="btn my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
