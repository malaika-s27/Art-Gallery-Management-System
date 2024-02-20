<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login Error</title>

</head>

<body>

<p style="color:red"; text-align: center>The credentials you entered are invalid.</p>

<%

getServletContext().getRequestDispatcher("/LogIn.jsp").include(request, 
response);

%>

</body>

</html>