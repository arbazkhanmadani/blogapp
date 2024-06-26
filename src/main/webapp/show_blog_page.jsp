<%@page import="com.tech.blog.dao.LikeDao,java.text.DateFormat"%>
<%@page import="java.util.ArrayList,com.tech.blog.dao.UserDao,com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.entities.Category,java.sql.*,java.util.*"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bloggy | <%= p.getpTitle()%> </title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
       <style><%@ include file="css/post.css"%>"</style>
       
       <style>
      .navbar-nav{
    width: 100%;
}

@media(min-width:568px){
    .end{
        margin-left: auto;
    }
}

@media(max-width:768px){
    #post{
        width: 100%;
    }
}
#clicked{
    padding-top: 1px;
    padding-bottom: 1px;
    text-align: center;
    width: 100%;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px; 
}

#profile{
    background-color: unset;
    
} 

#post{
    margin: 10px;
    padding: 6px;
    padding-top: 2px;
    padding-bottom: 2px;
    text-align: center;
    background-color: #ecb21f;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px;
    width: 50%;
}



#nav-items li a,#profile{
    text-decoration: none;
    color: rgb(224, 219, 219);
    background-color: white;
}


.comments{
    margin-top: 5%;
    margin-left: 20px;
}

.darker{
    border: 1px solid #ecb21f;
    background-color: black;
    float: right;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px;
}

.comment{
    border: 1px solid rgba(16, 46, 46, 1);
    background-color: black;
    float: left;
    width:100%;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px;
    
}
.comment h4,.comment span,.darker h4,.darker span{
    display: inline;
}

.comment p,.comment span,.darker p,.darker span{
    color: rgb(184, 183, 183);
}

h1,h4{
    color: white;
    font-weight: bold;
}
label{
    color: rgb(212, 208, 208);
}

#align-form{
    margin-top: 20px;
}
.form-group p a{
    color: white;
}

#checkbx{
    background-color: black;
}

#darker img{
    margin-right: 15px;
    position: static;
}

.form-group input,.form-group textarea{
    background-color: black;
    border: 1px solid rgba(16, 46, 46, 1);
    border-radius: 12px;
}

form{
    border: 1px solid rgba(16, 46, 46, 1);
    padding: 20px;
 }      
 </style>
 
    </head>
    <body>
    
    
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
    

	

<!-- FB-COmment -->
        <div id="fb-root"></div>
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="hHcVKcAu"></script>
        <!--navbar--> 

        

        <!--end of navbar-->

        <!--main content of body-->



     
        <div class="container mb-0">

            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div style="display:flex; position:relative;z-index:1; justify-content:space-between;" class="card-header primary-background text-white">

                            <h4 class="post-title"><%= p.getpTitle()%></h4>
										

                        </div>

                        <div class="card-body">

                            <img class="card-img-top my-2" src="pics/<%= p.getpPic()%>" alt="Card image cap">


                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"> posted by | <a href="general_user.jsp?gid=<%=p.getPid()%>">  <%= ud.getUserByUserId(p.getUserId()).getName()%></a> </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getpContent()%></p> 

                            <br>
                            <br>

                            <div class="post-code" style='background:black;color:white;'>
                                <pre style='color:wheat;'><%= p.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer primary-background">


                           
							
                            <a href="#!"  class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"></span>  </a>
                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>



                        </div>

						
                 	</div>


                </div>


            </div>

			
        </div>

        <!--end of main content  of body-->


        <!--profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

        <!--add post modal-->



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

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c1 : list) {
                                    %>
                                    <option value="<%= c1.getCid()%>"><%= c1.getName()%></option>

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


        <!--END add post modal-->


<%     
 			int gid = Integer.parseInt(request.getParameter("post_id"));
 			Connection con = ConnectionProvider.getConnection();
 			String q ="SELECT uid from comment where poid=?";
 			PreparedStatement ps = con.prepareStatement(q);	
 			ps.setInt(1,gid);
            ResultSet rs = ps.executeQuery();
            
            int uid=-1;
            int count;
            //ArrayList<User> al2 = new ArrayList<User>();
       	 	Map<Integer, ArrayList<Comment>> m = new TreeMap();
       	 	ArrayList<Comment> al = new ArrayList();
         
       	 	while(rs.next()){
            	
            	User u = new User();
            	uid = rs.getInt("uid"); 
            	u.setId(uid);
           	  
            	Comment c = new Comment();
     			//uid = rs.getInt("uid");
            	int comid;
            	String comment;
            	String q1 ="SELECT * from comment where uid=?";
     			PreparedStatement ps1 = con.prepareStatement(q1);	
     			ps1.setInt(1,uid);
     			ResultSet rs1 = ps1.executeQuery();
     			
                /*String name = "";
           	 	String pic = "";
           	 	int uuid = 0;
           	 	 */
           	 	while(rs1.next()){
           	 		
           	 	comid = rs1.getInt("comid");
            	comment = rs1.getString("comment");
            	c.setUid(uid);
            	c.setComId(comid);
            	c.setComment(comment);
            	al.add(c); 	 
              }
			m.put(uid, al);
            
       	 	}
       	 	System.out.println(m);
            
                      
            
    %>



	<!-- Comment -->
		<div class="container" style="background:white;width:48.5%;height:300%;margin-top:-15px;border-radius:5px;">
		
			<div class="row">
				<form action="addCommnet" method="post">
					<div class="col-md-12 mb-2 mt-4">
							<h6>Leave a comment</h6>
    						<textarea name="c" style="resize:none;" rows="3" cols="100" class="form-control"></textarea>
    						<button type="submit" class="btn btn-warning mt-2">add comment</button>
    				</div>
				</form>
			</div><hr color="black"/>
		<h4 style="color:black;">Comments</h4>
                
		<%for(Map.Entry<Integer,ArrayList<Comment>> usr : m.entrySet()) {%>
		
		<div class="row">
            <div class="col-sm-5 col-md-6 col-12 pb-4">
                <div class="comment mt-0 text-justify " style="height:80%;width:200%;">
                    <a href="general_user.jsp?cuid=<%=usr.getKey()%>"></a><img src="pics/<%=user.getProfile()%> alt="pro-pic" class="rounded-circle" width="40" height="40"></a>
                    <span>- 20 October, 2018</span>
                    <br>
                    <%for(Comment com : usr.getValue()) {%>
                    <p><%=com.getComment()%></p>
              		<%} %>
                </div>
        </div>
        </div>
		<%}%>
	</div>
		



        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()

                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()

                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")

                                        }


                                    })
                                });

        </script>
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
