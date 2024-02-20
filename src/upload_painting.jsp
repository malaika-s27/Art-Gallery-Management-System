<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Artwork Management</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <style>
        body {
            font-family: 'Times', sans-serif;
            margin: 0;
            background-color: #f5f5f5;
        }

        h2 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        input {
            margin-bottom: 10px;
            padding: 5px;
            width: 300px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }

        .error {
            color: #ff0000;
        }

.bg {
  animation:slide 3s ease-in-out infinite alternate;
  background-image: linear-gradient(-60deg, #FFFDD0 50%, #800000 50%);
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
        .container {
            margin-top: 20px;
        }

        h3 {
            color: #800000;
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
            background-color: #800000;
        }

        /* Additional Styles for improved readability */
        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #800000;
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

         
            .table th,
            .table td {
                text-align: left;
            }
        }
          .bg-maroon {
            background-color: #800000; /* Maroon color */
        }
        .prominent-label {
            background-color: white; /* Maroon color */
            color: #80000;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
          .headstyle {
            color: #80000;             
            font-size: 24px;
            font-weight:bold;
            text-align: center;
            }
         
    </style>
</head>
<body>
<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-white">
    <a class="headstyle">Artistry Haven</a>
</nav>
     
<div class="container">
    <div class="row my-5">
        <div class="col">
           <div class="prominent-label">
    <h3 class="fs-4 mb-3">Upload Artwork</h3>
</div>  <form class="form-horizontal" role="form" id="profile-form" method="post">
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="title" placeholder="Enter Title" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="year" placeholder="Enter Year" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="url" placeholder="Enter URL" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="category" placeholder="Enter Category" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="description" placeholder="Enter Description" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="ArtistName" placeholder="Enter Artist" required>
        </div>
    </div>
      <div class="form-group">
        <div class="col-lg-8">
            <input class="form-control" type="text" name="PRICE" placeholder="Enter price range" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-8">
            <button type="submit" class="cta">Add Artwork</button>
        </div>
    </div>
</form>

    <%-- Process form submission and add artwork to the MySQL database --%>
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String title = request.getParameter("title");
            String year = request.getParameter("year");
            String url = request.getParameter("url");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            String ArtistName = request.getParameter("ArtistName");
            String PRICE = request.getParameter("PRICE");


            Connection connection = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create a connection to the MySQL database
                String jdbcUrl = "jdbc:mysql://localhost:3306/sys";
                String dbUser = "root";
                String dbPassword = "Oracle_1";

                connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                // Insert artwork into the database
                String insertQuery = "INSERT INTO artwork (Title, year, url, category, description, ArtistName, PRICE) VALUES (?,?,?,?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, title);
                    preparedStatement.setString(2, year);
                    preparedStatement.setString(3, url);
                    preparedStatement.setString(4, category);
                    preparedStatement.setString(5, description);
                    preparedStatement.setString(6, ArtistName);
                    preparedStatement.setString(7, PRICE);


                    preparedStatement.executeUpdate();
                }

                // Display added image URL on the screen
                request.setAttribute("addedUrl", url);
            } catch (ClassNotFoundException | SQLException e) {
    %>
                <p class="error">Error: <%= e.getMessage() %></p>
    <%
            } finally {
                // Close the database connection
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
    %>
                        <p class="error">Error closing database connection: <%= e.getMessage() %></p>
    <%
                    }
                }
            }
        }
    %>
</body>
</html>
