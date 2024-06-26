
<!-- com.tech.blog.helper.ConnectionProvider -->

<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.*, java.text.DateFormat, java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style><%@ include file='css/mystyle.css'%> </style>
		<style>
		


/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
   background-color: white;
   padding: 20px;
   margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

		
		</style>
    </head>
    <body>



        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--//banner-->

        <div class="container-fluid p-0 m-0" id="jmb" >

            <div class="jumbotron text-white banner-background" >
                <div class="container">
                    <h3 class="display-3">Welcome To The Bloggy </h3>

                    <p>Welcome to technical blog, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>

                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa fa-user-plus"></span>  Start ! its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>

                </div>
            </div>






        </div>



        <!--//cards-->

       <!--  <div class="container">

            <div class="row mb-2">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>


            </div>




            <div class="row">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn">Read more</a>
                        </div>
                    </div>
                </div>


            </div>

        </div>
 -->



<%     
 			Connection con = ConnectionProvider.getConnection();
 			String q ="SELECT pPic, pid from posts limit 10";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ResultSet rs = ps.executeQuery();
            
            
            String pic;
            int pid;
            Map<Integer, String> al = new TreeMap<Integer, String>();
             while(rs.next()){
            	
            	pic = rs.getString("pPic");
            	pid = rs.getInt("pid");
            	al.put(pid,pic.toString());
            	System.out.println(pic);
            	
            }    
            
    %>

<div class="rightcolumn container">
   
    
    <div class="card" style="color:black;background:white;">
      <h3>Popular Post</h3>
      
      <%for(Map.Entry<Integer, String> post: al.entrySet()){ %>
      <div class="fakeimg mb-1" style="background:#fff;display:flex;justify-content:space-between;border-bottom:1px solid black;">
      	<a href="">
      		<img src="pics/<%=post.getValue() %>" width="50px"/>
      	</a>
      	<%
   			User u = (User) session.getAttribute("currentUser");
    		if (u!= null) {
    		%>
    		<a href="show_blog_page.jsp?post_id=<%=post.getKey() %>" style="color:blue;">read now...</a>
            
       		<%}else{%>
       		<a href="login_page.jsp" style="color:blue;">login to read the post</a>
            
       		<%} %>
      </div>
      <%} %>
      <br>
      
    </div>
    
     <div class="card">
      <h2 align="center">About Me</h2>
      <div class="fakeimg" style="width:30%;height:20%;"><img src="pics/pp.png" style="width:100%;"/></div>
      <h3>Hyy, Im Arbaz Khan</h3>
      <p style="font-size:1.5em;">I fell in love with programming and I have at least learnt something, I think… 🤷‍♂️<br/>
			I have a passion for DSA and Problem Solving
			I am proficint in classics like Java, Javascript and Python.<br/>

			My field of Interest's are building latest Web applications and also in domain related to
			Data Analytics.<br/><br/>

			Whenever possible, I also apply my passion for developing products with Node.js, ExpressJs and java Full Stack and like to put my hands in Latest Technologies.  I also like React.js and Frontend Technologies</p>
    </div>
    
  
  </div>


        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
