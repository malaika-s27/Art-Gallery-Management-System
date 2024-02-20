<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>

</head>

<body>

<%! String userdbName;

String userdbPsw;

String dbUsertype;

%>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.cj.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/sys";

String user = "root";

String dbpsw = "Oracle_1";



String sql = "select * from login where email=? and password=? and usertype=?";


String name = request.getParameter("email");

String password = request.getParameter("password");

String usertype = request.getParameter("usertype");



if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || 
password.equals(""))) && !usertype.equals("select"))

{

try{

Class.forName(driverName);

con = DriverManager.getConnection(url, user, dbpsw);

ps = con.prepareStatement(sql);

ps.setString(1, name);

ps.setString(2, password);

ps.setString(3, usertype);

rs = ps.executeQuery();

if(rs.next())

{ 

userdbName = rs.getString("email");

userdbPsw = rs.getString("password");

dbUsertype = rs.getString("usertype");

if(name.equals(userdbName) && password.equals(userdbPsw) && usertype.equals(dbUsertype))

{

session.setAttribute("email",userdbName);

session.setAttribute("usertype", dbUsertype); 
if(usertype.equalsIgnoreCase("user")){
response.sendRedirect("home.jsp"); 
}
else if(usertype.equalsIgnoreCase("admin")){
	response.sendRedirect("profile.jsp"); 

}
else if(usertype.equalsIgnoreCase("artist")){
	response.sendRedirect("artist_profile.jsp"); 

}
} 

}

else

response.sendRedirect("invalid.jsp");

rs.close();

ps.close(); 

}

catch(SQLException sqe)

{

out.println(sqe);

} 

}

else

{

%>

<center><p style="color:red">Error In Login</p></center>

<% 

getServletContext().getRequestDispatcher("/LogIn.jsp").include(request, 
response);

}

%>

</body>

</html>