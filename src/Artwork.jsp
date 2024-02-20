<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Artistry Heaven</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap">
<link rel="stylesheet" href="Artwork.css">
<style> .favorite {
            position: absolute;
            top: 25px;
            right: 10px;
        }

        .heart {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-image: url('heartu.png'); /* URL to your empty heart icon */
            background-size: cover;
            cursor: pointer;
}
        .heart.active {
            background-image: url('red.png'); /* URL to your filled heart icon */
        }
 .price-range {
            font-size: 18px;
            color: #333; /* Dark grey color for the price range */
            margin-top: 0px;
            text-align: center; 
        }
 
.favorite-icon {
position: absolute;
top: 10px;
right: 10px;
font-size: 36px;
color: transparent;
cursor: pointer;
transition: color 0.3s ease-in-out;
}
.add-to-cart {
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* Show the add-to-cart button on hover */
.image {
    position: relative;
}

.image:hover .add-to-cart {
    display: block;
}

.add-to-cart-btn {
            background-color: black;
            color: white;
            border: 1px white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }


.favorite-icon.active {
color: red;}
.image img {
max-width: 700px; /* Adjust the width as needed */
height: 220px;
display: block; /* To prevent unwanted space under the image */
margin-bottom: 10px;
}
</style>
</head>
<body>
 <div class="navbar">
        <a href="home.jsp">Home</a>
        <a href="USER_REGISTER.jsp">Upcoming Exhibitions</a>
        
    </div>

<div class="line">
<hr class="black-line">
</div>
<div class="search-bar">
<input id="searchbar" onkeyup="performSearch()" type="text"
name="search" placeholder="Search..">
<script>
function toggleFavorite(element) {
    element.classList.toggle('active');
    // Add logic to save the favorite state (e.g., using localStorage)
}
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
}}} </script>
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

                        String price = resultSet.getString("Price");

                        
    %>
    <div class="card">
    <div class="image">
    <img src="<%= imageUrl %>" alt="Artwork Image">
      <div class="add-to-cart">
    <button class="add-to-cart-btn" onclick="addToCart(this)">Add to Cart</button>
</div>  
    </div>
    
<div class="favorite">



                    <span class="heart" onclick="toggleFavorite(this)"></span>
                </div>
                
    <h3><%= title %></h3>
    <p><%= description %></p>
    <p> Year: <%= year %></p>
    <p> Category: <%= category %></p>
    <p>Artist: <%= ArtistName %></p>
    <p>Price: <%= price %></p>
    
<a class="cta1" onclick="addReviewAndRedirect('<%= title %>')">WRITE A REVIEW</a>
    
               </div>
    <%
                    }
    %>
    <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
<script>
function addToFavourite(a) {
	icon.classList.toggle("active");
	}
function addReviewAndRedirect(customString) {
    window.location.href = "Review.jsp?Title=" + encodeURIComponent(customString);
}
function addToCart(a) {
	alert("Added to Cart! For Bidding contact Admin through this email");
	var adminEmail = "hafsahabib87@gmail.com"; // Change this to the admin's email
    var subject = "Bidding Inquiry";
    var body = "I would like to inquire about the bidding process for the selected item.";
    var mailtoLink = "mailto:" + adminEmail + "?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body);
    window.location.href = mailtoLink;
	}

function sortArtwork() {
    var selectElement = document.getElementById("sort");
    var selectedOption = selectElement.options[selectElement.selectedIndex].value;

    // Get the list of artwork elements
    var artworkList = document.querySelectorAll(".card");

    if (selectedOption === "name") {
        // Sort artwork alphabetically by name
        var sortedArtwork = Array.from(artworkList).sort((a, b) => {
            var nameA = a.querySelector("h3").textContent.toLowerCase();
            var nameB = b.querySelector("h3").textContent.toLowerCase();
            return nameA.localeCompare(nameB);
        });

        // Remove existing artwork items from the container
        var container = document.querySelector(".box");
        container.innerHTML = "";

        // Append sorted artwork items back to the container
        sortedArtwork.forEach(function (artwork) {
            container.appendChild(artwork);
        });
    } else {
        // Implement your default sorting logic here
        alert("Default sorting");
    }
}
</script>

</body>
</html>