<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Artistry Haven</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
    html {
  height:100%;
}

body {
  margin:0;
}

.bg {
  animation:slide 3s ease-in-out infinite alternate;
  background-image: linear-gradient(-60deg, #800000 50%, #FFFDD0 50%);
  bottom:0;
  left:-50%;
  opacity:.5;
  position:fixed;
  right:-50%;
  top:0;
  z-index:-1;
}

.bg2 {
  animation-direction:alternate-reverse;
  animation-duration:4s;
}

.bg3 {
  animation-duration:5s;
}

.content {
  background-color:rgba(255,255,255,.8);
  border-radius:.25em;
  box-shadow:0 0 .25em rgba(0,0,0,.25);
  box-sizing:border-box;
  left:50%;
  padding:10vmin;
  position:fixed;
  text-align:center;
  top:50%;
  transform:translate(-50%, -50%);
}

h1 {
  font-family:monospace;
}

@keyframes slide {
  0% {
    transform:translateX(-25%);
  }
  100% {
    transform:translateX(25%);
  }
}
        body {
            background-color: #f8f9fa;
            font-family: 'Times', sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        h3 {
            color: #5B1726;
        }

        .table {
            background-color: white;
        }

        .cta {
            background-color: #800000;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cta:hover {
            background-color: #3c0e1e;
        }

        /* Additional Styles for improved readability */
        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .remove-btn,
        .edit-btn,
        .cta {
            cursor: pointer;
        }

        .remove-btn:hover,
        .edit-btn:hover,
        .cta:hover {
            opacity: 0.8;
        }

        @media (max-width: 768px) {
            .container {
                margin-top: 40px;
            }

            .navbar-brand {
                font-size: 20px;
            }

            .table th,
            .table td {
                text-align: left;
            }
        }
    </style>
</head>
<body>
<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <a class="navbar-brand">Artistry Haven</a>
</nav>
<div class="container">
    <div class="row my-5">
        <div class="col">            
        
<h3 class="fs-4 mb-3">Gallery & Exhibitions</h3>
                                       <thread>
            <table class="table rounded shadow-sm table-hover">
            <tr>
            <th scope="col">Gallery ID</th>
            <th scope="col">Gallery Name</th>
            <th scope="col">Location</th>
            <th scope="col">Exhibition ID</th>
            <th scope="col">Exhibition Name</th>
        </tr>    
<!-- Page Content -->

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Oracle_1");

    // Display all artists
    PreparedStatement displayStmt = conn.prepareStatement("SELECT * FROM GalleryExhibitionView");
    ResultSet rs = displayStmt.executeQuery();

    while (rs.next()) {
        int galleryId = rs.getInt("G_ID");
        String galleryName = rs.getString("G_NAME");
        String location = rs.getString("LOCATION");
        int exhibitionId = rs.getInt("E_ID");
        String exhibitionName = rs.getString("E_NAME");
%>

<tr>
    <td><%= galleryId %></td>
    <td><%= galleryName %></td>
    <td><%= location %></td>
    <td><%= exhibitionId %></td>
    <td><%= exhibitionName %></td>
  </tr>

<%}}
      
catch (SQLException sqe) {
    out.println("Error: " + sqe.getMessage());
} 
%>

                </tbody>
            </table>

           

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
