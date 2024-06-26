<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.*, java.time.*,java.text.DateFormat"%>
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
<title></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
<style><%@ include file="css/generalProfile.css" %></style>
 <style><%@ include file='css/profile.css'%> </style>
</head>
<body>


<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>


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
 			int gid = Integer.parseInt(request.getParameter("gid"));
 			Connection con = ConnectionProvider.getConnection();
 			String q ="SELECT userID from posts where pid=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,gid);
            ResultSet rs = ps.executeQuery();
            int uid=-1;
            
            while(rs.next()){
            	uid = rs.getInt("userId");
            }
            System.out.println(gid+"gid");
            System.out.println(uid+"uid");
            String q1 ="SELECT * from user where id=?";
 			PreparedStatement ps1 = con.prepareStatement(q1);	
 			ps1.setInt(1,uid);
 			ResultSet rs1 = ps1.executeQuery();
 			
            String name = "";
       	 	String email = "";
       		String gender = "";
       	 	String about = "";
       	 	String date = "";
       	 	String pic = "";
       	 
            while(rs1.next()){
            	 name = rs1.getString("name");
            	 email = rs1.getString("email");
            	 gender = rs1.getString("gender");
            	 about = rs1.getString("about");
            	 date = rs1.getString("datetime");
            	 pic = rs1.getString("profile");
            	 
          }
            
    %>
                   



<div class="container rounded bg-white mt-5">
    	
    	<div class="row">
        	<div class="col-md-3 col-sm-12 border-right">
            	<div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="pics/<%=pic%>"><span class="font-weight-bold"><%=name %></span></div>
        </div>
        
        <div class="col-md-9 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">profile</h4>
                </div>
                
                <div class="row mt-2">
                    <div class="col-md-12"><label class="labels">Name</label><input readonly  type="text" class="form-control" placeholder="first name" value="<%=name%>"></div>
                    <div class="col-md-12"><label class="labels">Email</label><input readonly type="text" class="form-control" value="<%=email%>" placeholder="surname"></div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Gender</label><input readonly type="text" class="form-control" placeholder="enter phone number" value="<%=gender%>"></div>
                    <div class="col-md-12"><label class="labels">Joined on</label><input readonly  type="text" class="form-control" placeholder="enter address line 1" value="<%=date%>"></div>
                    <div class="col-md-12" style="background:#E9ECEF;margin-top:15px;border-radius:5px; width:91%;margin-left:10px;font-size:3vmin;"><label class="labels">Bio</label><hr/><%=about%></div>
                </div>
                
                 <div class="row mt-3 mt-5">
                    <div class="col-md-12"><div style="display:flex;justify-content;center;" class="col-md-6"><a href="profile.jsp" class="btn" style="color:white;background:blue;border:1px solid white;">go to profile</a><button href="" id="backbtn" class="btn"  style="color:white;background:blue;border:1px solid white;">go to post</button></div>	</div>
                 </div>
                     
             </div>
		</div>
	</div>
	
	</div>

</div>



<%     
			
 			Connection con2 = ConnectionProvider.getConnection();
 			String q2 ="SELECT * from posts where pid=?";
 			PreparedStatement ps2 = con.prepareStatement(q2);	
 			ps2.setInt(1,gid);
            ResultSet rs2 = ps2.executeQuery();

            int id2 = 0;
            String title1 = "";
       	 	String pic1 = "";
       		Timestamp date1 = null;
       	 	int cat1 = -1;
       	 	ArrayList<Post> al1 = new ArrayList();
            while(rs2.next()){
            	
            	 id2 = rs2.getInt("pid");
            	 title1= rs2.getString("pTitle");
            	 pic1 = rs2.getString("pPic");
            	 date1 = rs2.getTimestamp("pDate");
            	 cat1 = rs2.getInt("catId"); 
            	 Post p1 = new Post();
            	 p1.setPid(id2);
            	 p1.setpTitle(title1);
            	 p1.setpPic(pic1);
            	 p1.setCatId(cat1);
            	 p1.setpDate(Timestamp.valueOf(LocalDateTime.of(date1.getYear(),date1.getMonth(),date1.getDate(),date1.getHours(),date1.getMinutes(),date1.getSeconds())));
            	 al1.add(p1);
            }
           
    %>


	<div class="container container-card mt-5" style="background:white;">
		<h5 style="text-align:center;margin-top:15px;font-weigth:bold;"><%=user.getName() %>'s posts</h5>
		
		<div class="row mt-3">
 		<% for(Post post1 : al1){%>
 						
 			<div class="col-lg-4 col-sm-6 mt-3 d-flex justify-content-center">
				
				<div class="card bg-ligth " >
				 
				 		<div class="card-body mr-0 ml-0 mb-0">
        					
        					<a href="show_blog_page.jsp?post_id=<%=post1.getPid() %>" title="see post by clicking it" id="img-l"><img src="pics/<%= post1.getpPic() %>" class="card-img-top" style="height:86%;width:100%;margin:0;cursor:pointer;"/></a>
        					<div class="d-flex justify-content-between align-items-end">
        						<p class="card-text mb-0" style="color:black;text-align:left; font-size:.9em;">posted on : <%=DateFormat.getDateTimeInstance().format(post1.getpDate()) %></p>
        					</div>
        					
        				</div>
        				
        				
        			
        		</div>         
				<!-- </a> -->		
		
			</div>
	 
	 	<%} %>
	 	</div>
		
	</div>


   	
        


                 








<script>
	
	let btn = document.getElementById("backbtn")
	btn.addEventListener('click',()=>{
		
		history.back();
		console.log("back....")
		}
	)
	
</script>



</body>
</html>