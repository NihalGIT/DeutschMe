<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.swing.JDialog" %>
    <%@ page import="javax.swing.JOptionPane" %>
    <%@ page import="beans.DB_con" %>
    <%@ page import="pages.MyTest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>DeutschMe</title>
      <link rel="stylesheet" href="css/icons.css">
      <link rel="stylesheet" href="css/responsee.css">
      <link rel="stylesheet" href="owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="owl-carousel/owl.theme.css">
      <!-- CUSTOM STYLE -->
      <link rel="stylesheet" href="css/template-style.css">
      <link href="https://fonts.googleapis.com/css?family=Barlow:100,300,400,700,800&amp;subset=latin-ext" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="js/jquery-ui.min.js"></script>
      <style>
      #pradio{ margin-top:-15px; }
      #radio{
        display: grid;
        margin-left:280px;                
      }
      </style>
   </head>
   <body class="size-1520 primary-color-red background-dark">
      <!-- PREMIUM FEATURES BUTTON -->
      <header class="grid">
        <!-- Top Navigation -->
        <nav class="s-12 grid background-none background-primary-hightlight">
           <!-- logo -->
           <a href="Home" class="m-12 l-3 padding-2x logo">
              <img src="img/logo.png">
           </a>
        </nav>
      </header>

      <!-- MAIN -->
      <main role="main">
        <header class="grid">
        	<div class="s-12 padding-2x">
            <h1 style="text-align:center"><strong>Results</h1>
          </div>
        </header>
        <section>
          <div class="box">
          <div class="container">
            <% 
            Connection conne;
        	DB_con inf=new DB_con();
        	String user=inf.getUser();
        	String url=inf.getUrl();
        	String pwd=inf.getPwd();
        	String level=(String)request.getAttribute("Level");
            String Level=(String)request.getAttribute("new");
        	String mail=(String)request.getAttribute("email");
            String stat="vrai";
            int j=0;
            for (int i=1;i<=6;i++){
            	String qst= (String)request.getAttribute("qst"+i);
            	String rc=(String)request.getAttribute("rc"+i);
            	String rv=(String)request.getAttribute("rv"+i);
            	if (rc.equals(rv)){
            		j+=1;
            		stat="vrai";
            	}else{
            		stat="faux";
            	}
    		    %>
		          <p style="color:black;">Qst <%=i %> : <%=qst %></p><br>
		          <p style="color:gray;">Your Answer : <%=rc%></p><br>
		          <img src="img/<%=stat%>.png" style="width:200px;margin-left:190px;">
		          <p style="color:black;margin-top:10px;"><strong>The correct answer : <%=rv %></p><br>
	          <%} %>
          </div>
          </div>
        </section>
        <section>
        <p style="color:#39AEA9; margin-top:-1230px;margin-left:1100px;font-size:23px;"><strong>votre score est : <%=j%>/6</p><br>
        </section>
        <section>
        <form method="POST">
        <input type="hidden" value="<%=j %>" name="score">
        <input type="submit"  value="Go to Home Page" style="margin-top:18px;margin-left:200px;display:block;" formaction="Update"/>
        </form>  
        </section> 
      </main>
      <script type="text/javascript" src="js/responsee.js"></script>
      <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript" src="js/template-scripts.js"></script>

   </body>
</html>
