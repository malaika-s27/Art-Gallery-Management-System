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
       body {
  --s: 25vmin;
  --p: calc(var(--s) / 2);
  --c1: white;
  --c2: #A52A2A;
  --c3: white;
  --bg: var(--c3);
  --d: 4000ms;
  --e: cubic-bezier(0.76, 0, 0.24, 1);
  
  background-color: var(--bg);
  background-image:
    linear-gradient(45deg, var(--c1) 25%, transparent 25%),
    linear-gradient(-45deg, var(--c1) 25%, transparent 25%),
    linear-gradient(45deg, transparent 75%, var(--c2) 75%),
    linear-gradient(-45deg, transparent 75%, var(--c2) 75%);
  background-size: var(--s) var(--s);
  background-position: 
    calc(var(--p) *  1) calc(var(--p) *  0), 
    calc(var(--p) * -1) calc(var(--p) *  1), 
    calc(var(--p) *  1) calc(var(--p) * -1), 
    calc(var(--p) * -1) calc(var(--p) *  0);
  animation: 
    color var(--d) var(--e) infinite,
    position var(--d) var(--e) infinite;
}

@keyframes color {
  0%, 25% {
    --bg: var(--c3);
  }
  26%, 50% {
    --bg: var(--c1);
  }
  51%, 75% {
    --bg: var(--c3);
  }
  76%, 100% {
    --bg: var(--c2);
  }
}

@keyframes position {
  0% {
    background-position: 
      calc(var(--p) *  1) calc(var(--p) *  0), 
      calc(var(--p) * -1) calc(var(--p) *  1), 
      calc(var(--p) *  1) calc(var(--p) * -1), 
      calc(var(--p) * -1) calc(var(--p) *  0);
  }
  25% {
    background-position: 
      calc(var(--p) *  1) calc(var(--p) *  4), 
      calc(var(--p) * -1) calc(var(--p) *  5), 
      calc(var(--p) *  1) calc(var(--p) *  3), 
      calc(var(--p) * -1) calc(var(--p) *  4);
  }
  50% {
    background-position: 
      calc(var(--p) *  3) calc(var(--p) * 8), 
      calc(var(--p) * -3) calc(var(--p) * 9), 
      calc(var(--p) *  2) calc(var(--p) * 7), 
      calc(var(--p) * -2) calc(var(--p) * 8);
  }
  75% {
    background-position: 
      calc(var(--p) *  3) calc(var(--p) * 12), 
      calc(var(--p) * -3) calc(var(--p) * 13), 
      calc(var(--p) *  2) calc(var(--p) * 11), 
      calc(var(--p) * -2) calc(var(--p) * 12);
  }
  100% {    
    background-position: 
      calc(var(--p) *  5) calc(var(--p) * 16), 
      calc(var(--p) * -5) calc(var(--p) * 17), 
      calc(var(--p) *  5) calc(var(--p) * 15), 
      calc(var(--p) * -5) calc(var(--p) * 16);
  }
}

@media (prefers-reduced-motion) {
  body {
    animation: none;
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

<!-- Navbar -->
<nav class="navbar navbar-dark bg-white">
    <a class="headstyle">Artistry Haven</a>
</nav>

<!-- Page Content -->
<%
    String name = request.getParameter("name");

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

        // Insert data into the "artwork" table
        if (name != null && !name.isEmpty()) {
            String insertQuery = "INSERT INTO artcategory (category) VALUES (?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, name);
            preparedStatement.executeUpdate();
        }

        // Query to get all categories from the database
        String selectQuery = "SELECT category FROM artcategory";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectQuery)) {
%>

<div class="container">
    <div class="row my-5">
        <div class="col">
           <div class="prominent-label">
    <h3 class="fs-4 mb-3">Category</h3>
</div>
            <table class="table rounded shadow-sm table-hover">
                <thead>
                <tr>
                    <th scope="col" width="50">#</th>
                    
                    <th scope="col">Category</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // Display categories from the database
                    int count = 1;
                    while (resultSet.next()) {
                %>
                    <tr>
                        <th scope="row"><%= count++ %></th>
                        <td><%= resultSet.getString("category") %></td>
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
                       <div class="prominent-label">
            
            <h3 class="fs-4 mb-3">Add new Category</h3>
            </div>
            <form class="form-horizontal" role="form" id="profile-form" method="post">
                <div class="form-group">
                
                    <div class="col-lg-8">
                        <input class="form-control" type="text" name="name" value="Enter" required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="">
                        <button type="submit" class="cta">Save Changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
