<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Artistry Haven</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="MAINSTYLE.css">
  
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

    body {
      margin: 0;
      box-sizing: border-box;
    }

    /* CSS for header */
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #f5f5f5;
    }

    .header .logo {
      font-size: 25px;
      font-family: 'Sriracha', cursive;
      color: #000;
      background-color: #fff;
      text-decoration: none;
      margin-left: 30px;
    }

    .nav-items {
      display: flex;
      justify-content: space-around;
      align-items: center;
      background-color: #f5f5f5;
      margin-right: 20px;
    }

    .nav-items a {
      text-decoration: none;
      color: #000;
      padding: 35px 20px;
    }

    /* CSS for main element */
    .intro {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 520px;
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 100%), url("bg1.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

    .intro h1 {
      font-family: sans-serif;
      font-size: 60px;
      color: #fff;
      font-weight: bold;
      text-transform: uppercase;
      margin: 0;
    }

    .intro p {
      font-size: 20px;
      color: #d1d1d1;
      text-transform: uppercase;
      margin: 20px 0;
    }

    .intro button {
      background-color: #800000;
      font-family: 'Times', sans-serif;
      color: white;
      padding: 10px 25px;
      border: none;
      border-radius: 5px;
      font-size: 20px;
      font-weight: bold;
      cursor: pointer;
      box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.4)
    }

    .achievements {
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 40px 80px;
    }

    .achievements .work {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 0 40px;
    }

    .achievements .work i {
      width: fit-content;
      font-size: 50px;
      color: #333333;
      border-radius: 50%;
      border: 2px solid #333333;
      padding: 12px;
    }

    .achievements .work .work-heading {
      font-size: 20px;
      color: #333333;
      text-transform: uppercase;
      margin: 10px 0;
    }

    .achievements .work .work-text {
      font-size: 15px;
      color: #585858;
      margin: 10px 0;
    }

    .about-me {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 80px;
      border-top: 2px solid #eeeeee;
    }

    .about-me img {
      width: 500px;
      max-width: 100%;
      height: auto;
      border-radius: 10px;
    }

    .about-me-text h2 {
      font-size: 30px;
      color: #333333;
      text-transform: uppercase;
      margin: 0;
    }

    .about-me-text p {
      font-size: 15px;
      color: #585858;
      margin: 10px 0;
    }

    /* CSS for footer */
    .footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #800000;
      padding: 0px 10px;
    }

    .footer .copy {
      color: #fff;
    }

    .bottom-links {
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 40px 0;
    }

    .bottom-links .links {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 0 40px;
    }

    .bottom-links .links span {
      font-size: 20px;
      color: #fff;
      text-transform: uppercase;
      margin: 10px 0;
    }

    .bottom-links .links a {
      text-decoration: none;
      color: #a1a1a1;
      padding: 10px 20px;
    }
  </style>
</head>

<body>
  <header class="header">
    <a href="#" class="logo">ArtistryHaven</a>
    <nav class="nav-items">
      <a href="#">Home</a>
      <a href="#aboutus">About</a>
      <a href="Artwork.jsp">Artwork</a>
      <a href="Exhibition.jsp">Exhibition</a>      
      <a href="USER_REGISTER.jsp">Register</a>  
      <a href="landingpage.jsp">Logout</a>
    </nav>
  </header>
  <main>
    <div class="intro">
         
      <h1>Artistry Haven</h1>
      <p>Welcome to a canvas of endless creativity - your journey into art begins here.</p>
<button onclick="window.location.href='Artwork.jsp'">Explore</button>
    </div>
    <div class="featured-section">
        <h2 style="color:#800000">Featured Artworks</h2>
        <div class="featured-artworks">
            <div class="featured-artwork" onclick="redirectToArtworkPage()">
    <img src="bg1.jpg" alt="Artwork 1">
    <div class="artwork-details">
        <p class="artwork-title">The Sculpture Gallery</p>
        <p class="artist-name">By Monet</p>
    </div>
</div>
            <div class="featured-artwork" onclick="redirectToArtworkPage()">
                <img src="sarenaSlika.jpg" alt="Artwork 2">
                <div class="artwork-details">
                    <p class="artwork-title">Color Symphony</p>
                    <p class="artist-name">By Maira</p>
                </div>
            </div>
            <div class="featured-artwork"onclick="redirectToArtworkPage()">
                <img src="plavaCikci.jpg" alt="Artwork 2">
                <div class="artwork-details">
                    <p class="artwork-title">The Ascent</p>
                    <p class="artist-name">By Atif</p>
                </div>
                
            </div>
            
        </div>
    </div>
  <div class="featured-section">
    
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", "root", "Oracle_1");

        stmt = con.createStatement();
        String query = "SELECT * FROM exhibition where START_DATE> NOW() ORDER BY START_DATE";
        rs = stmt.executeQuery(query);

        if (rs.next()) {
            String upcomingExhibitionName = rs.getString("E_NAME");
            String exhibitionDate = rs.getString("START_DATE");
            String venue = rs.getString("LOCATION");
            String description = rs.getString("DESCRIPTION");
%>
<div onclick="redirectToLoginPage()" style="border: 6px solid #800000; padding: 10px; border-radius: 10px; margin: 0 auto 20px; width: 400px; text-align: center; cursor: pointer;">
    <h2 style="text-decoration: underline; margin-bottom: 10px; color: #800000; ">Upcoming Exhibitions</h2>
    <p style="margin: 0;">Name: <%= upcomingExhibitionName %></p>
    <p style="margin: 0;">Date & Time: <%= exhibitionDate %></p>
    <p style="margin: 0;">Venue: <%= venue %></p>
    <p style="margin: 0;">Description: <%= description %></p>
</div>




<%
        } else {
%>

<h2>No upcoming exhibitions</h2>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</div>    
   
    <div class="about-me">
      <div class="about-me-text">
        <h2 id="aboutus" ><u>About Us</u></h2>
    <div style= "background-color: #FFFDD0"> <p style="text-align: justify; font-family: 'times', sans-serif; font-size: 16px; line-height: 1.5; color: #333;">
    Welcome to <strong style="color: #5B1726;">Artistry Haven</strong>, the brainchild of Hafsa and Malaika, an artistic haven curated with passion and a shared love for diverse creative expressions.
    <em style="font-style: italic; color: #555;">Artistry Haven</em> is more than a space; it's a canvas where creativity flourishes and boundaries fade. Join us on this enriching journey into a world where the extraordinary becomes ordinary. Explore, appreciate, and be inspired by the boundless wonders of art at <strong style="color: #5B1726;">Artistry Haven</strong>.
</p> </div>
      </div>
    </div>
  </main>
   <div class="bottom-links" style="background-color:#800000;">
      <div class="links">
        <span>More Info</span>
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
      </div>
      <div class="links">
        <span>Social Links</span>
       <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
        <a href="https://twitter.com/?lang=en"><i class="fab fa-twitter"></i></a>
        <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
      </div></div>   <div class="bottom-links" style="background-color:#800000;">
      
        <div style= "text-align: center; font-size:14px; color: #fff ; bottom: 0; ">&copy; 2023 Artistry Haven. All rights reserved.</div>
        </div>
    
<script>
    function redirectToArtworkPage() {
        window.location.href = 'Artwork.jsp';
    }
    function redirectToLoginPage() {
        window.location.href = 'LogIn.jsp';
    }
</script>
</body>

</html>