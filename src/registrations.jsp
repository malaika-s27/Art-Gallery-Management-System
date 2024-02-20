<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>  
     table {
    border-collapse: collapse;
    width: 80%;
    margin: 20px auto; /* Center the table */
    background-color: white;
    text-align: center;
}

th, td {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 8px;
}

th {
    background-color: #f2f2f2;
}

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
    <h2>Registration Details</h2>

    <%-- Display form to input Exhibition ID --%>
    <form action="" method="get">
        <label for="exhibitionId">Enter Exhibition ID:</label>
        <input type="text" id="exhibitionId" name="exhibitionId">
        <input type="submit" value="View Registrations">
    </form>

    <%-- Display the registration details based on Exhibition ID or show all registrations --%>
    <%
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the MySQL database
            String jdbcUrl = "jdbc:mysql://localhost:3306/sys";
            String dbUser = "root";
            String dbPassword = "Oracle_1";

            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Get Exhibition ID from the request parameter
            String exhibitionIdParam = request.getParameter("exhibitionId");
            int exhibitionId = -1;

            if (exhibitionIdParam != null && !exhibitionIdParam.isEmpty()) {
                try {
                    exhibitionId = Integer.parseInt(exhibitionIdParam);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }

            // Select data from the RegistrationDetailView based on Exhibition ID or show all registrations
            String selectQuery;

            if (exhibitionId != -1) {
                selectQuery = "SELECT * FROM RegistrationDetailView WHERE E_ID = ?";
            } else {
                selectQuery = "SELECT * FROM RegistrationDetailView";
            }

            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                if (exhibitionId != -1) {
                    preparedStatement.setInt(1, exhibitionId);
                }

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
    %>
                    <table>
                        <tr>
                            <th>Registration ID</th>
                            <th>Email</th>
                            <th>User Type</th>
                            <th>Username</th>
                            <th>Phone</th>
                            <th>Exhibition Name</th>
                            <th>Gallery Name</th>
                            <th>Action</th>
                        </tr>
    <%
                        while (resultSet.next()) {
                            int registrationId = resultSet.getInt("REGISTRATION_ID");
                            String email = resultSet.getString("EMAIL");
                            String userType = resultSet.getString("USERTYPE");
                            String username = resultSet.getString("USERNAME");
                            String phone = resultSet.getString("PHONE");
                            String exhibitionName = resultSet.getString("E_NAME");
                            String galleryName = resultSet.getString("G_NAME");
    %>
                            <tr>
                                <td><%= registrationId %></td>
                                <td><%= email %></td>
                                <td><%= userType %></td>
                                <td><%= username %></td>
                                <td><%= phone %></td>
                                <td><%= exhibitionName %></td>
                                <td><%= galleryName %></td>
                                <td>
                                    <form action="" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="registrationId" value="<%= registrationId %>">
                                        <input type="submit" value="Remove">
                                    </form>
                                </td>
                            </tr>
    <%
                        }
    %>
                    </table>
    <%
                }
            }

            // Handle registration removal
            String action = request.getParameter("action");

            if ("remove".equals(action)) {
                String registrationIdToRemove = request.getParameter("registrationId");

                if (registrationIdToRemove != null && !registrationIdToRemove.isEmpty()) {
                    try {
                        int registrationIdToRemoveInt = Integer.parseInt(registrationIdToRemove);

                        // Determine the primary key(s) of the underlying table(s) and use them in the DELETE statement
                        String deleteQuery = "DELETE FROM REGISTRATION WHERE REGISTRATION_ID = ?";
                        try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
                            deleteStatement.setInt(1, registrationIdToRemoveInt);
                            deleteStatement.executeUpdate();
                            out.println("<p>Registration removed successfully!</p>");
                        }
                    } catch (NumberFormatException | SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error removing registration: " + e.getMessage() + "</p>");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>