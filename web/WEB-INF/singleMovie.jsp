<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Box personal portfolio Template</title>
    <link rel="icon" href="/img/fav.png" type="image/x-icon">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/css/stylee.css" rel="stylesheet">


    <!-- modernizr -->
    <script src="/js/modernizr.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

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
    <!-- box-header -->
    <header class="box-header">
        <div class="box-logo">
            <a href="/home"><img src="/img/logo.png" width="80" alt="Logo"></a>
        </div>

    </header>

</div>

<!-- Top bar -->
<div class="top-bar" style="background-size: cover;
    background: -webkit-linear-gradient( rgb(0, 0, 0), rgba(255, 255, 255, .8)), url(../img/01.png);;
">
    <h1 style="font-size: 120px;
    text-shadow: -2px 8px 20px white;
    color: #ffffff;">${singleMovie.name}</h1>
</div>
<!-- end Top bar -->

<!-- Main container -->
<div class="container main-container clearfix">
    <div class="col-md-6">
        <img src="/getImage?picName=${singleMovie.picture}" class="img-responsive" alt="" />
    </div>
    <div class="col-md-5">
        <h1 style="color: #ffcc33;" class="uppercase"> </h1>
        <h3 style="display: inline-block">Genre` </h3>
        <h4 style="display: inline-block"><c:forEach var="genre" items="${singleMovie.genre}"> ${genre.name}, </c:forEach> </h4>
        <br>
        <h3 style="display: inline-block">Year` </h3>
        <h4 style="display: inline-block">${singleMovie.year}</h4> <br>
        <h3 style="display: inline-block">Director` </h3>
        <h4 style="display: inline-block">${singleMovie.director}</h4> <br>
        <h3 style="display: inline-block">Created Date` </h3>
        <h4 style="display: inline-block">${singleMovie.createdDate}</h4>
        <div class="h-30"></div>
<p>${singleMovie.description}</p>
        <div class="h-10"></div>
        <ul class="social-ul">
            <li class="box-social"><a href="#0"><i class="ion-social-facebook"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-instagram-outline"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-twitter"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-dribbble"></i></a></li>
        </ul>


    </div>
</div>
<!-- end Main container -->


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