<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Times, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #fff;
            /* White background */
            color: #800000;
            /* Maroon text color */
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        header {
            background-color: #800000;
            /* Maroon background for the header */
            padding: 20px;
            text-align: center;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .container-login {
            background-color: #FFFDD0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            width: 300px;
            margin: 20px auto;
            animation: slideIn 1s ease-in-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .forms {
            padding: 20px;
        }

        .form {
            text-align: center;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            /* Dark gray text color */
            display: block;
            margin-bottom: 20px;
        }

        .input-field {
            position: relative;
            margin-bottom: 20px;
            animation: fadeInUp 1s ease-in-out;
        }

        .input-field select {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            /* Light gray border */
            border-radius: 5px;
            outline: none;
            padding-right: 40px;
            /* Space for icon */
        }

        .icon {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 10px;
            color: #666;
            /* Medium gray icon color */
            cursor: pointer;
            animation: fadeIn 1s ease-in-out;
        }

        .text {
            color: #666;
            /* Medium gray text color */
        }

        .button {
            text-align: center;
            animation: fadeInUp 1s ease-in-out;
        }

        .cta {
            background-color: #800000;
            /* Maroon CTA button */
            color: #fff;
            /* White text color */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cta:hover {
            background-color: #600000;
            /* Darker maroon on hover */
        }

        .login-signup {
            margin-top: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        a {
            color: #800000;
            /* Maroon link color */
            text-decoration: none;
            font-weight: bold;
            animation: fadeIn 1s ease-in-out;
        }

        a:hover {
            text-decoration: underline;
        }

        .footer {
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
            font-size:14px;
        }
         .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: ##800000;

    }

    .header .logo {
      font-size: 25px;
      font-family: 'Sriracha', cursive;
      color: #fff;
      text-decoration: none;
      margin-left: 30px;
    }
        
    </style>

</head>


<body>
<header class="header">
    <a href="#" class="logo">ArtistryHaven</a>
    <a href="landingpage.jsp" style= "color: #fff; font-family: 'Times', sans-serif; font-size:18px;">Home</a></header>
<%
String email = request.getParameter("email");
String usertype = request.getParameter("usertype");
String password = request.getParameter("password");
String name = request.getParameter("name");
String address = request.getParameter("address");
String phone = request.getParameter("phone");

if (email != null && usertype != null && password != null && name != null && address != null && phone != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Oracle_1");

        // Use the SignUpProcedure stored procedure
        CallableStatement signUpStmt = conn.prepareCall("{ CALL SignUpProcedure(?, ?, ?, ?, ?, ?) }");
        signUpStmt.setString(1, email);
        signUpStmt.setString(2, usertype);
        signUpStmt.setString(3, password);
        signUpStmt.setString(4, name);
        signUpStmt.setString(5, phone);
        signUpStmt.setString(6, address);

        signUpStmt.execute();

        out.println("User registered successfully!");

        signUpStmt.close();
        conn.close();
    } catch (SQLException sqe) {
        out.println("Error: " + sqe.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Error: " + e.getMessage());
    }
} else {}
%>

<div class="container-login">
        <div class="forms">
            <div class="form login">
                <span class="title">Registration</span>

<form method="post" action="">
<div class="input-field">
    <input type="text" id="email" name="email" placeholder="Enter email" required>
                            <i class="uil uil-envelope icon"></i>
    
</div><div class="input-field">
    
    <select name="usertype" id="usertype" required>
                            <option value="select" disabled selected>Select User Type</option>
                            <option value="User">User</option>
                            <option value="Artist">Artist</option>
                        </select><br>
</div><div class="input-field">
    
       <input type="password" id="register-password" name="password" placeholder="Enter your password" required>
                        <i class="uil uil-lock icon"></i>
    
</div><div class="input-field">
        <input type="text" id="register-name" name="name" placeholder="Enter your name" required>
</div><div class="input-field">
    
          <input type="text" id="register-address" name="address" placeholder="Enter your address" required>
</div><div class="input-field">
    
      <input type="text" id="register-phone" name="phone" placeholder="Enter your phone number" required>
 </div>                       <div class="input-field button">
 
                        <input type="submit" value="Register" id="register-button" class="cta">
</div>
  <div class="login-signup">
                    <span class="text">Already have an account? <a href="LogIn.jsp">Log In</a></span>
                </div>
</form>
</div></div></div>
  <div class="footer">
        <p> &copy; 2023 Artistry Haven. All rights reserved.</p>
    </div>

</body>

</html>
