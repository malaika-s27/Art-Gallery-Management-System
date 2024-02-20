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

.navbar {
    color: #f2f2f2;
    padding: 0px;
    position: relative;
margin-top: -150px; /* Remove space above */
margin-bottom: 140px; /* Add space below */
}

.navbar a {
    display: inline-block;
    color: inherit;      
    text-align: center;
    text-decoration: none;
    margin-left: 150px;
    padding: 14px 16px;
}

.navbar a:hover {
    background-color: #ddd;
    color: black;
}

.navbar .logo {
    font-weight: bold;
    font-size: 25px;
    font-family: 'Sriracha', cursive;
    text-decoration: none;
    margin-left: -100px;
    text-align:left;
}

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
    position: relative;
    z-index: 0; /* Set the .intro behind the navbar */
}

h1, p {
    margin: 0;
}

    </style>
</head>

<body>
              <div class="intro">
                      <div class="navbar">
 <a href="#" class="logo">ArtistryHaven</a>
      <a href="#">Home</a>
      <a href="#aboutus">About</a>
<a href="mailto:hafsahabib87@gmail.com">Contact</a>
    </div>
      
    <h1 style="font-family: 'Kalnia';">Artistry Haven</h1>
  
<p style="font-family: 'Times', sans-serif; color:white; font-size: 18px;  line-height: 1.5; text-align: center;">
     A place that is dedicated to the celebration of artistic expression and creativity.
</p>

<button onclick="window.location.href='LogIn.jsp'">Get Started</button>
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
        String query = "SELECT * FROM exhibition WHERE START_DATE > NOW() ORDER BY START_DATE ";
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
        window.location.href = 'LogIn.jsp';
    }
    function redirectToLoginPage() {
        window.location.href = 'LogIn.jsp';
    }
</script>
</body>

</html>