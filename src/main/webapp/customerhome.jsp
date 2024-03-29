<%@ page import = "DBModel.Room" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>CustomerHome</title>
        <link rel = "stylesheet" href = "./customerhome.css">
        <link href="https://fonts.cdnfonts.com/css/glacial-indifference-2" rel="stylesheet">
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class = "topnav" id = "myTopnav">
            <img src = "avainreal.png" alt = "logoimage" class="centerlogo">
            <a href="#"><i class="fa fa-fw fa-info"></i>about</a>
            <a href="#"><i class="fa fa-fw fa-envelope"></i>contact</a>
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-fw fa-building-o"></i>browse
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href = "customerbrowse.html">CHAIN</a>
                    <a href = "#">LOCATION</a>
                    <a href = "#">RATING</a>
                    <a href = "#">ROOM CAPACITY</a>
                </div>
            </div>
            <a href="#"><i class="fa fa-fw fa-home"></i>home</a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-fw fa-bars"></i>
            </a>
        </div>
        <div class = "main" id = "contentmain">
            <div class = "centerelements" id = "content">
                <form action="queryServlet" method="POST">
                    <input type = "text" id = "locationcity" name = "locationcity" placeholder = "Enter your destination city"><br>
                    <input type = "number" id = "capacityguests" name = "capacityguests" placeholder = "Number of guests"><br>
                    <label for = "checkindate">Check in date:</label>
                    <input type = "date" id = "checkindate" name = "checkindate" placeholder = "Check in date:"><br>
                    <label for = "checkoutdate">Check out date:</label>
                    <input type = "date" id = "checkoutdate" name = "checkoutdate" placeholder = "Check out date:"><br>
                    <input type = "submit" value = "Search">
                </form>

                <%
                List<Room> results = (List<Room>) request.getAttribute("results");
                if (results != null) {
                    for (Room room : results) {
                %>
                        <table class = "pricebox">
                            <tr>
                                <td><%= room.getId().getChainName() %></td>
                                <td><%= room.getHotel().getHotelName() %></td>
                                <td><%= room.getPrice() %></td>
                                <td><%= room.getCapacity() %></td>
                                <td><input type = "submit" value = "Reserve" style = "font-size:12px; float:right; background-color = #29335C;"></td>
                            </tr>
                        </table>
                    <%
                    }
                }
                %>
            </div>
        </div>

        <script>
            function myFunction() {
                var x = document.getElementById("myTopnav");
                if (x.className === "topnav") {
                    x.className += " responsive";
                }
                else {
                    x.className = "topnav";
                }
            }
        </script>
    </body>
</html>