<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Stylesheets -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="styleadmin.css">

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>

    <title>Artist Dashboard</title>
    <style>
 .header {
      background-color: #800000;

    }
    .header .logo {
      font-size: 25px;
      font-family: 'Sriracha', cursive;
      color: #fff;
      text-align: left;
      text-decoration: none;
    }</style>
</head>
<body>
<div class="dashboard-container">
<header class="header" style= "text-align: center;">
            <a href="#" class="logo">ArtistryHaven</a></header>
<header style="background-color: #fff;color: #800000; text-align: center;">
            <h2 style="font-size:20px; margin-bottom:0;">Artist Dashboard</h2>
            <a style="font-size:12px;">Welcome <%= session.getAttribute("email") %></a>
       
</header>

 
        <div class="d-flex" id="wrapper" style ="margin-top:-40px;">
            <div class="bg-white" id="sidebar-wrapper" >
                <div class="list-group list-group-flush" style="background-color: #800000; height: 140vh;">
                    <a href="uploaded_artwork.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Artist General Artwork
                    </a>
                                        <a href="Artwork.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Online Exhibition
                    </a>
                                       <a href="upload_painting.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Upload Artwork
                    </a>
                    <a href="Categories_Admin.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Art Categories
                    </a>
                    <a href="Gallery.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Gallery & Exhibition
                    </a>
                    <a href="landingpage.jsp" 
                    style="font-size: 18px; font-family:'Times', sans-serif; color: #fff;"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class=""></i>Logout
                 </a>
                </div>
            </div>
                <div class="container bootstrap snippets bootdey">
    <hr>
            <h3 style="font-size: 28px; font-weight: bold;font-family:'Times', sans-serif; color: #800000;">
           Edit Personal info</h3>
<form class="form-horizontal" role="form" id="profile-form" action="" method="post">

                <div class="form-group">
                    <label class="col-lg-3 control-label" style="font-family:'Times', sans-serif">Email:</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="email" name="email"
                            value="<%= session.getAttribute("email") %>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" style="font-family:'Times', sans-serif">Full name:</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="text" name="name" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" style="font-family:'Times', sans-serif">Address:</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="text" name="address" value="")>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" style="font-family:'Times', sans-serif">Phone:</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="text" name="phone" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" style="font-family:'Times', sans-serif">Password:</label>
                    <div class="col-lg-8">
                        <input class="form-control" type="password" name="password" value="">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-8 col-lg-offset-3">
                        <button type="submit" class="cta"  name="saveChanges">Save Changes</button>
                    </div>
                </div>
                
        <% 
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("saveChanges") != null) {
        	 String artistId =request.getParameter("id");
             String name = request.getParameter("name");
             String address = request.getParameter("address");
             String phone = request.getParameter("phone");
             String email = request.getParameter("email");
             String password = request.getParameter("password");

             try {
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Oracle_1");

                 // Call the stored procedure to update artist information
                 CallableStatement cs = conn.prepareCall("{call UpdateArtistInformation(?, ?, ?, ?, ?, ?)}");
                 cs.setString(1, artistId);
                 cs.setString(2, name);
                 cs.setString(3, address);
                 cs.setString(4, phone);
                 cs.setString(5, email);
                 cs.setString(6, password);
                 cs.execute();

                 conn.close();
                out.println("<p>Changes Saved " + "</p>");

                // Redirect back to the profile page or display a success message
            } catch (SQLException | ClassNotFoundException e) {
                // Handle exceptions (display an error message or redirect to an error page)
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        }
        %>
            </form>
      
    <hr>
    <hr>

<footer style="text-align:center; font-family:'Times', sans-serif;margin-top:100px; font-size:14px; color:#800000;">
    <p>&copy; 2023 Art Gallery Management System</p>
</footer>  </div>
    </div></body></html>