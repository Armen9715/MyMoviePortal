<%@ page import="model.User" %>
<%@ page import="model.Genre" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Box personal portfolio Template</title>
    <link rel="icon" href="../img/fav.png" type="image/x-icon">

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- main css -->
    <link rel="stylesheet" href="..\css\stylee.css">

    <!-- modernizr -->
    <script src="../js/modernizr.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .addMovie {
        border-color: #ffcc33;
        margin-bottom: 10px;
        background-color: #ffffff;
        height: 42px;
        width: 400px;
        border-radius: 20px;
    }

    .AddMovieSubmit {
        border-radius: 30px;
        width: 200px;
        border: 3px solid #ffcc33;
        background-color: #ffffff;
        color: #f6b800;
        margin-left: 100px;
    }

    ::-webkit-input-placeholder {
        color: #ffcc33;
        padding-left: 20px;
    }
</style>

<body>

<!-- Preloader -->
<div id="preloader">
    <div class="pre-container">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>
<!-- end Preloader -->

<div class="container-fluid">
    <!-- box header -->
    <header class="box-header">
        <div class="box-logo">
            <a href="index.html"><img src="img/logo.png" width="80" alt="Logo"></a>
        </div>
        <!-- box-nav -->
        <a class="box-primary-nav-trigger" href="#0">
            <span class="box-menu-text">Menu</span><span class="box-menu-icon"></span>
        </a>
        <!-- box-primary-nav-trigger -->
    </header>
    <!-- end box header -->

    <!-- nav -->
    <nav>
        <ul class="box-primary-nav">
            <li class="box-label">About me</li>

            <li><a href="index.html">Intro</a></li>
            <li><a href="about.html">About me</a></li>
            <li><a href="services.html">services</a> <i class="ion-ios-circle-filled color"></i></li>
            <li><a href="portfolio.html">portfolio</a></li>
            <li><a href="contact.html">contact me</a></li>


            <li class="box-label">Follow me</li>

            <li class="box-social"><a href="#0"><i class="ion-social-facebook"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-instagram-outline"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-twitter"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-dribbble"></i></a></li>
        </ul>
    </nav>
    <!-- end nav -->
</div>
<%
    User user = new User();
    User admin = (User) request.getSession().getAttribute("admin");

%>
<!-- top bar -->
<div class="top-bar">
    <h1 style="color: #ffe38e">Welcom to </a>  Movie Portal </h1>
    <p>${admin.name} ${admin.surname}</p>
</div>
<!-- end top bar -->

<div class="container main-container" >
    <div style="width: 50%;display: inline-block; border-right: 1px solid #ffcc33;">
        <h3 style="color: #ffcc33; margin-left: 85px;">Fill in the Movie Data</h3>
        <form action="/add/MovieServlet" method="post" id="cf" enctype="multipart/form-data" class="addMovieForm">


            <input class="addMovie" class="ssaa" type="text" placeholder="Name" name="name">
            <br>

            <input class="addMovie" type="text" placeholder="Description" name="description">
            <br>

            <input class="addMovie" type="text" placeholder="Year" name="year">
            <br>

            <input class="addMovie" type="text" placeholder="Director" name="director">

            <br>
            <input class="addpicture" type="file" placeholder="Director" name="picture">
            <br>
            <h4 style="color: #ffcc33; margin-left: 140px;">Select Genre</h4>
            <c:forEach var="genre" items="${allGenres}">
                ${genre.name} <input type="checkbox" value="${genre.name}" name="genres"><br>
            </c:forEach>
            <br>

                <input class="AddMovieSubmit" name="submit" type="submit" value="Add Movie"></input>

        </form>
    </div>

    <div style="width: 48%; display: inline-block">
        <h3 style="color: #ffcc33; margin-left: 85px;">Fill in the Genre Data</h3>

        <form action="/addGenreServlet" method="post">
            <input class="addMovie" type="text" placeholder="Genre Name" name="genre"><br> <br>
            <input class="AddMovieSubmit" type="submit" name="submit" value="Add Genre"></input>
        </form>


    </div>
</div>

</div>


<!-- footer -->
<footer>
    <div class="container-fluid">
        <p class="copyright">© Box Portfolio 2016</p>
    </div>
</footer>
<!-- end footer -->

<!-- back to top -->
<a href="#0" class="cd-top"><i class="ion-android-arrow-up"></i></a>
<!-- end back to top -->


<!-- jQuery -->
<script src="js/jquery-2.1.1.js"></script>
<!--  plugins -->
<script src="js/bootstrap.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/animated-headline.js"></script>
<script src="js/isotope.pkgd.min.js"></script>


<!--  custom script -->
<script src="js/custom.js"></script>

</body>

</html>