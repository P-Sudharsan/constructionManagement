<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Home</title>

    <!-- CSS only -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <!-- CSS -->
    <link rel="stylesheet" href="css/styleadmin1.css">
</head>

<body>


    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">PROFILE</a>
        <a href="#">#####</a>
        <a href="#">#####</a>
        <a href="index.jsp">LOGOUT</a>
    </div>

    <nav id="main">
        <div class="logo" style="width: 100%; margin-left:auto; margin-right: auto;">
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MARSS</span></div>
    </nav>

    <div class="background">

        <div class="wrap">
            <div class="card">

                <div class="card-image">
                   <a> <img src="img/inventory.jpg"  height="290" width="300"></a></div>

                <div class="container">
                    <h3>Order Management</h3>
                </div>


            </div>
            <div class="card">

                <div class="card-image">
                   <a href="list"> <img src="img/userManagement.jpg" height="290" width="300"></a></div>

                <div class="container">
                    <h3>User Management</h3>
                </div>


            </div>
            <div class="card">

                <div class="card-image">
                   <a href="invent.jsp"> <img src="img/user1.jpg" height="290" width="290"></a></div>

                <div class="container">
                    <h3>Inventory</h3>
                </div>


            </div>

        </div>
    </div>







    <!-- <div class="cardDiv">
        <div class="card-deck">
            <div class="card">
              <img class="card-img-top" src="card.jpg" alt="Card image cap">


            </div>
            <div class="card">
              <img class="card-img-top" src="card.jpg" alt="Card image cap">

            <div class="card">
              <img class="card-img-top" src="card.jpg" alt="Card image cap">


            </div>
          </div>
    </div> -->











    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
    </script>

</body>

</html>