<%@page import="com.tech.blog.entities.User,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.*, java.text.DateFormat, java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error_page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
 <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
<style><%@ include file="css/generalProfile.css" %></style>
 <style><%@ include file='css/profile.css'%></style>
 <style>
 	
 	.container-card{
 			background:white;border-radius:5px;
 	}
 	.card{
 		width:23.5rem;
 	}
 	
 	.card-img-overlay:hover .card-text > .card-text-cont {
 		background:blue;
 		transition:1s all;	
 	}
 	@media screen and (max-width:1200px){
 		
 		.card{
 			width:19.9rem;
 		}
 		
 	}
 	@media screen and (max-width:992px){
 		
 		.card{
 			width:21.99rem;
 		}
 		
 	}
 
 </style>
</head>
<body>


<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
    int id = user.getId();

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
             <li class="nav-item" >
                        <a  style='color:purple;' class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                    </li>
            <li class="nav-item">
                <a style='color:purple;' class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span>Logout</a>
            </li>
          
        </ul>
       
    </div>
</nav>


 <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>



<div class="container rounded bg-white mt-5">
    	
    	<div class="row">
        	<div class="col-md-3 col-sm-12 border-right">
            	<div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="pics/<%= user.getProfile()%>"><span class="font-weight-bold"><%=user.getName() %></span></div>
        </div>
        
        <div class="col-md-9 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">profile</h4>
                </div>
                
                <div class="row mt-2">
                    <div class="col-md-12"><label class="labels">Name</label><input readonly  type="text" class="form-control" placeholder="first name" value="<%= user.getName()%>"></div>
                    <div class="col-md-12"><label class="labels">Email</label><input readonly type="text" class="form-control" value="<%=user.getEmail()%>" placeholder="surname"></div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Gender</label><input readonly type="text" class="form-control" placeholder="enter phone number" value="<%=user.getGender().toUpperCase()%>"></div>
                    <div class="col-md-12"><label class="labels">Joined on</label><input readonly  type="text" class="form-control" placeholder="enter address line 1" value="<%=user.getDateTime()%>"></div>
                    <div class="col-md-12" style="background:#E9ECEF;margin-top:15px;border-radius:5px; width:91%;margin-left:10px;font-size:3vmin;"><label class="labels">Bio</label><hr/><%= user.getAbout()%></div>
                </div>
                
                  <div class="modal-footer">
                        <a href="delete_profile.jsp?id=<%=id%>"><button type="button" class="btn btn-secondary" data-dismiss="modal">RECALL</button></a>
                        <a href="edit_profile.jsp?id=<%=id%>"><button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button></a>
                        
                    </div>
                     
             </div>
		</div>
	</div>

</div>



<%     
 			Connection con = ConnectionProvider.getConnection();
 			String q ="SELECT * from posts where userId=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,user.getId());
            ResultSet rs = ps.executeQuery();
            

            int id1 = 0;
            String title = "";
       	 	String pic = "";
       		Timestamp date = null;
       	 	int cat = -1;
       	 	ArrayList<Post> al = new ArrayList();
            while(rs.next()){
            	
            	 id1 = rs.getInt("pid");
            	 title= rs.getString("pTitle");
            	 pic = rs.getString("pPic");
            	 date = rs.getTimestamp("pDate");
            	 cat = rs.getInt("catId"); 
            	 Post p = new Post();
            	 p.setPid(id1);
            	 p.setpTitle(title);
            	 p.setpPic(pic);
            	 p.setCatId(cat);
            	 p.setpDate(date);
            	 al.add(p);
            }
            
    %>

	
	<%
	 Message m = (Message)session.getAttribute("msg1");
    if (m != null){
	%>
		<div class="container d-flex justify-content-between mt-4 <%= m.getCssClass() %>" id="c-c" style="visibility:jidden;">
			<p style="color:black;font-width:1rem;"><%=m.getContent() %></p><button class="btn btn-secondary" id="btn-c">close</button>
		</div>	 
		   
    <%
    }session.removeAttribute("msg1");%>
    	
    
<%
	 Message m1 = (Message)session.getAttribute("pUpdate");
    if (m1!= null){
	%>
		<div class="container d-flex justify-content-between mt-4 <%= m1.getCssClass() %>" id="c-c" style="visibility:jidden;">
			<p style="color:black;font-width:1rem;"><%=m1.getContent() %></p><button class="btn btn-secondary" id="btn-c">close</button>
		</div>	 
		   
    <%
    }session.removeAttribute("pUpdate");%>


	<div class="container container-card mt-5" style="">
		<h5 style="text-align:center;margin-top:15px;font-weigth:bold;">Your Posts</h5>
		
		<div class="row mt-3">
 		<% for(Post post : al){%>
 			
      <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4>Recall or Edit the post</h4>
				</div>
				<div class="modal-body">
					<p style="text-align:center;">You can add and delete the posts by clicking the recall or edit buttons</p>
				</div>
				<div class="modal-footer">
					<a class="btn btn-warning" style="cursor:pointer;text-align:center;" id="editL">edit</a><br>
					<a class="btn btn-denger" style="cursor:pointer;" id="deleteL">delete</a><br>
					<button class="btn btn-secondary" data-dismiss="modal">close</button>
				</div>
				
			</div>
		</div>
	</div>
          				
 			<div class="col-lg-4 col-sm-6 mt-3 d-flex justify-content-center">
				
				<div class="card bg-ligth " >
				 
				 		<div class="card-body mr-0 ml-0 mb-0">
        					
        					<a href="show_blog_page.jsp?post_id=<%=post.getPid()%>" title="see post by clicking it" id="img-l"><img src="pics/<%= post.getpPic() %>" class="card-img-top" style="height:86%;width:100%;margin:0;cursor:pointer;"/></a>
        					<div class="d-flex justify-content-between align-items-end">
        						<p class="card-text mb-0" style="color:black;text-align:left; font-size:.9em;">posted on : <%=DateFormat.getDateTimeInstance().format(post.getpDate()) %></p>
        						<button onclick="getPostLinks(<%=post.getPid()%>)" id="btn-f" value="<%= post.getPid()%>" data-toggle="modal" data-target=".bd-example-modal-sm" show="true" style="background:none;border:none;cursor:pointer;margin-top:20px;" title="edit"><i class="fa fa-ellipsis-v"></i></button>
        					</div>
        					
        				</div>
        				
        				
        			
        		</div>         
				<!-- </a> -->		
		
			</div>
	 
	 	<%} %>
	 	</div>
		
	</div>




	     				
<script>
		
	function getPostLinks(id){
		console.log(id)
		let edit = document.getElementById("editL");
		let del = document.getElementById("deleteL");
		edit.href="edit_post.jsp?post_id="+id
		del.href="delete_post.jsp?post_id="+id
		
	}	
	
	let close1 = document.getElementById("btn-c");
	close1.onclick = () =>{
		let d1 = document.getElementById("c-c");
		d1.setAttribute("style", "visibility:hidden;")	
		close1.setAttribute("style", "visibility:hidden;")	
		
	}
	
	let close2 = document.getElementById("btn-d");
	close2.onclick = () =>{
		let d1 = document.getElementById("c-d");
		d1.setAttribute("style", "visibility:hidden;")	
		close2.setAttribute("style", "visibility:hidden;")	
		
	}
</script>

<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
       
              <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

      



</body>
</html>