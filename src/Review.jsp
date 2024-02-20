<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Artistry Haven</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .message {
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        a {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input,
        textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        h1,
        h2,
        p {
            margin: 0;
        }
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
</head>
<body>
 <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

<div class="message">
        <h1 style="text-align:center;">Write Review</h1>
        <form id="inquireMessage" method="post" >
        <a>Artwork Title:</a>
            <input type="text" id="Title" name="Title" value="<%=request.getParameter("Title") %>" readonly>
                   <a>Email: </a>
            <input type="text" id="Email" name="Email" value="<%= session.getAttribute("email") %>" readonly>
                   <a>Review: </a>
           
            <textarea id="textarea" name="ReviewText"
            
             placeholder="Write Review"></textarea>
            <button type="submit" class="cta">Add Review</button>
        </form>
    </div>
    
    <% 
        // Retrieve values from the form
        String Title = request.getParameter("Title");
        String ReviewText = request.getParameter("ReviewText");
        String EMAIL = (String) request.getSession().getAttribute("EMAIL");

         // JDBC variables
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the MySQL database
            String url = "jdbc:mysql://localhost:3306/sys";
            String username = "root";
            String password = "Oracle_1";
            connection = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement for inserting the review
            String sql = "INSERT INTO ArtworkReviews (Title, ReviewText,Email) VALUES (?, ?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, Title);
            preparedStatement.setString(2, ReviewText);
            preparedStatement.setString(3, EMAIL);


            // Execute the SQL statement
    int rowsAffected = preparedStatement.executeUpdate();

            // Close the resources
            preparedStatement.close();
            connection.close();
if(rowsAffected>0)
            // Print a success message
            out.println("Review added successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
<script>
//Get the parameter from the URL
const reviewString = new URLSearchParams(window.location.search).get('reviewString');

// Use the reviewString as needed
console.log('Review string from URL:', reviewString);
</script>      
</body>
</html>