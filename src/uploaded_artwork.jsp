<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="Artwork.css">
    <title>Artwork List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
        .remove-link {
            color: red;
            cursor: pointer;
        }
            .image {
            margin-top: 20px;
        }

        .image img {
            max-width: auto; /* Adjust the width as needed */
            height: 220px;
            display: block; /* To prevent unwanted space under the image */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>


    <div class="navbar">
        <a href="artist_profile.jsp">Dashboard</a>
        <a href="Artwork.jsp">Ongoing Exhibition</a>
        <a href="mainpage2.jsp">Main Page</a>
        
    </div>
     <div class="line">
        <hr class="black-line">
    </div>

    <div class="search-bar">
     
    <input id="searchbar" onkeyup="performSearch()" type="text"
        name="search" placeholder="Search.."> 
        <script>
        function performSearch() { 
            let input = document.getElementById('searchbar').value 
            input=input.toLowerCase(); 
            let x = document.getElementsByClassName('card'); 
              
            for (i = 0; i < x.length; i++) {  
                if (!x[i].innerHTML.toLowerCase().includes(input)) { 
                    x[i].style.display="none"; 
                } 
                else { 
                    x[i].style.display="list-item";                  
                } 
            } 
        }        </script>
        <select id="sort" onchange="sortArtwork()">
            <option value="sort">Sort</option>
            <option value="name">Alphabetically A to Z</option>
        </select>
    </div>
    
    <br>
        <div id="searchResults"></div>

    <%-- Display the artwork  --%>
    <%
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the MySQL database
            String jdbcUrl = "jdbc:mysql://localhost:3306/sys";
            String dbUser = "root";
            String dbPassword = "Oracle_1";

            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Select all artwork from the database
            String selectQuery = "SELECT * FROM artwork";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

    %><div class="artwork">
                <div class="box">
           
    <%
                    while (resultSet.next()) {
                        String title = resultSet.getString("Title");
                        String year = resultSet.getString("year");
                        String imageUrl = resultSet.getString("url");
                        String category = resultSet.getString("category");
                        String description = resultSet.getString("description");
                        String ArtistName = resultSet.getString("ArtistName");

                        
    %>
     <div class="card">
                <div class="image">
    <img src="<%= imageUrl %>" alt="Artwork Image">
    </div>
    <h3><%= title %></h3>
    <p><%= description %></p>
                            <p> Year: <%= year %></p>
                            <p> Category: <%= category %></p>
                             <p>Artist: <%= ArtistName %></p>
         
                            
   <!--       <a class="cta1" onclick="removeArtwork('<%= title %>')">Remove Artwork </a><br>
<!--         <span class="remove-link" onclick="removeArtwork('<%= title %>')">Remove</span>
 -->    <!--  for the artwork view page                        
    <a class="cta1" onclick="addToFavourite(this)">ADD TO FAVOURITE</a><br>
    <a class="cta1" onclick="addToCart(this)">ADD TO CART</a><br>
    <a href="inquire.jsp" class="cta1">WRITE A REVIEW</a> -->                </div>
    <%
                    }
    %>
                </table>
    <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function removeArtwork(title) {
            if (confirm('Are you sure you want to remove this artwork?')) {
                $.ajax({
                    url: 'testing.jsp',
                    type: 'POST',
                    data: { title: title },
                    success: function(response) {
                        $('#' + title).remove(); // Remove the row from the table
                        alert('Artwork removed successfully!');
                    },
                    error: function(error) {
                        alert('Error removing artwork: ' + error.responseText);
                    }
                });
            }
        }
    </script>
</body>
</html>
