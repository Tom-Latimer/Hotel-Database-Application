<html>
    <head>
        <title>EmployeeHome</title>
        <link rel = "stylesheet" href = "./employeehome.css">
        <link href="https://fonts.cdnfonts.com/css/glacial-indifference-2" rel="stylesheet">
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>
        <div class = "topnav" id = "myTopnav">
            <img src = "avainreal.png" alt = "logoimage" class="centerlogo">
            <a href="#"><i class="fa fa-fw fa-info"></i>about</a>
            <a href="#"><i class="fa fa-fw fa-envelope"></i>contact</a>
            <a href="#"><i class="fa fa-fw fa-user"></i>login</a>
            <a href="#"><i class="fa fa-fw fa-home"></i>home</a>
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-fw fa-bars"></i>
            </a>
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