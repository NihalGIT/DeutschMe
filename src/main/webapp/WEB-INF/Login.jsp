<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>DeutschMe</title>
      <link rel="stylesheet" href="css/components.css">
      <link rel="stylesheet" href="css/icons.css">
      <link rel="stylesheet" href="css/responsee.css">
      <link rel="stylesheet" href="owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE -->
      <link rel="stylesheet" href="css/template-style.css">
      <link href="https://fonts.googleapis.com/css?family=Barlow:100,300,400,700,800&amp;subset=latin-ext" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="js/jquery-ui.min.js"></script>
   </head>
   <body class="size-1520 primary-color-red background-dark">
      <!-- PREMIUM FEATURES BUTTON -->
    	<a target="_blank" class="hide-s" href="../template/bricker-premium-responsive-business-template/" style="position:fixed;top:120px;right:-14px;z-index:10;"><img src="img/premium-features.png" alt=""></a>
      <!-- HEADER -->
      <header class="grid">
        <!-- Top Navigation -->
        <nav class="s-12 grid background-none background-primary-hightlight">
           <!-- logo -->
           <a href="index.html" class="m-12 l-3 padding-2x logo">
              <img src="img/logo.png">
           </a>
        </nav>
      </header>

      <!-- MAIN -->
      <main role="main">
        <!-- TOP SECTION -->
        <header class="grid">
        	<div class="s-12 padding-2x">
            <h1 style="text-align:center"><strong>Login</h1>
          </div>
        </header>
        <section>
          <div class="box">
          <div class="container">
            <form  Method="POST" Action="Login" enctype="application/x-www-form-urlencoded">
              <label for="email">Email</label>
              <input type="email" id="mail" name="mail" placeholder="Enter your mail address" required autofocus value= "${ user.email}"><br/>
              <label for="password">Password</label>
              <input type="password" id="password" name="password" placeholder="Enter your password.." required=""><br>
              <input type="submit" value="Login">
            </form>
          </div>
          </div>
        </section>
      </main>
      <script type="text/javascript" src="js/responsee.js"></script>
      <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript" src="js/template-scripts.js"></script>

   </body>
</html>
