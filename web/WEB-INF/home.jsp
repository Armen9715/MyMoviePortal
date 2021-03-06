<%--
  Created by IntelliJ IDEA.
  User: Hambardzumyan
  Date: 28.02.2019
  Time: 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">



<head>
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
    <link rel="stylesheet" href="\css\stylee.css">

    <!-- modernizr -->
    <script src="../js/modernizr.js"></script>

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
    <!-- box header -->
    <header class="box-header">
        <div class="box-logo">
            <a href="/home"><img src="/img/logo.png" width="80" alt="Logo"></a>
        </div>
        <!-- box-nav -->
        <a class="box-primary-nav-trigger" href="#0">
            <span class="box-menu-text">LogIn</span><span class="box-menu-icon"></span>
        </a>
        <!-- box-primary-nav-trigger -->
    </header>
    <!-- end box header -->

    <!-- nav -->
    <nav>
        <ul class="box-primary-nav">
            <li>
                <form action="/login" method="post" class="RegisterForm">
                    <input type="email" name="email" placeholder="email">
                    <input type="password" name="password" placeholder="password"><br>
                    <br>
                    <button id="submit" class="cont-submit btn-contact" name="submit">Login</button>

                </form>
            </li>


            <li class="box-label">Follow me</li>

            <li class="box-social"><a href="#0"><i class="ion-social-facebook"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-instagram-outline"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-twitter"></i></a></li>
            <li class="box-social"><a href="#0"><i class="ion-social-dribbble"></i></a></li>
        </ul>
    </nav>
    <!-- end nav -->

    <!-- box-intro -->
    <section class="box-intro">
        <div class="table-cell">
            <h1 class="box-headline letters rotate-2">
                    <span class="box-words-wrapper">
                        <b class="is-visible">Movie Portal</b>
                        <b>&nbsp;Best Movie</b>
                        <b>GH-production</b>
                    </span>
            </h1>
            <h5>JavaGITC2018</h5>
        </div>

        <div class="mouse">
            <div class="scroll"></div>
        </div>
    </section>
    <!-- end box-intro -->
</div>

<!-- portfolio div -->
<div class="portfolio-div">
    <div class="portfolio">
        <div class="categories-grid wow fadeInLeft">
            <nav class="categories text-center">
                <ul class="portfolio_filter">
                    <li><a href="" data-filter="*">All Movie</a></li>

                    <c:forEach var="genre" items="${allGenres}">
                        <li><a class="ganreButton" href="" data-filter=".${genre.name}">${genre.name} </a></li>
                    </c:forEach>
                    <%--<li><a href="" data-filter=".logo">Logo</a></li>--%>
                    <%--<li><a href="" data-filter=".graphics">Graphics</a></li>--%>
                    <%--<li><a href="" data-filter=".ads">Advertising</a></li>--%>
                    <%--<li><a href="" data-filter=".fashion">Fashion</a></li>--%>
                </ul>
            </nav>
        </div>

        <div class="no-padding portfolio_container clearfix">


            <c:forEach var="movie" items="${allMovie}">
                <div class="col-md-2 col-sm-4  <c:forEach var="genreName" items="${movie.genre}">${genreName.name} </c:forEach> ">
                    <a href="/singleMovie?movieId=${movie.id}" class="portfolio_item">

                        <img src="/getImage?picName=${movie.picture}" alt="image" class="img-responsive"/>
                        <div class="portfolio_item_hover">
                            <div class="portfolio-border clearfix">
                                <div class="item_info">
                                    <span><p style="font-size: 30px;text-shadow: -6px 6px 20px #ffffff;">${movie.name}</p></span>
                                    <em>Learn More</em>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>


        </div>
        <!-- end single work -->

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