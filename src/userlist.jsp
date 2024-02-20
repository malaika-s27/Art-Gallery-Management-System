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

    <!-- Page Content -->
    <%
    String idToRemove = request.getParameter("removeId");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/sys";
    String username = "root";
    String password = "Oracle_1";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        connection = DriverManager.getConnection(url, username, password);

        if (idToRemove != null && !idToRemove.isEmpty()) {
       // Remove the exhibition with the specified ID
          String deleteQuery = "DELETE FROM customer WHERE id=?";
        preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setString(1, idToRemove);
        preparedStatement.executeUpdate();
        }


        // Query to get all exhibitions from the database
        String selectQuery = "SELECT * FROM customer c join login l on c.id=l.id";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectQuery)) {
    %>

        <div class="container">
            <div class="row my-5">
                <div class="col">
                    <div class="prominent-label">
                        <h3 class="fs-4 mb-3">List of Customers & Enthusiasts </h3>
                    </div>
                    <table class="table rounded shadow-sm table-hover">
                        <thead>
                            <tr>
                                <th scope="col" width="50">#</th>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Phone</th>                                
                                 <th scope="col">Address</th>
                                  <th scope="col">Email</th>
 
                              
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            // Display exhibitions from the database
                            int count = 1;
                            while (resultSet.next()) {
                            %>
                                <tr>
                                    <th scope="row"><%= count++ %></th>
                                    <td><%= resultSet.getString("id") %></td>
                                    <td><%= resultSet.getString("CUSTOMERNAME") %></td>
                                    <td><%= resultSet.getString("PHONENUM") %></td>
                                    <td><%= resultSet.getString("ADDRESS") %></td>
                                    <td><%= resultSet.getString("email") %></td>
                                   
                                    <td>
                                        <form method="post" action="">
                                            <input type="hidden" name="removeId" value="<%= resultSet.getString("id") %>">
                                            <button type="submit" class="cta">Remove</button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                            } // end try-with-resources for ResultSet and Statement
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            // Close the database connection
                            if (connection != null) {
                                connection.close();
                            }
                            %>
                        </tbody>
                    </table>
                 
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS and Popper.js -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>

