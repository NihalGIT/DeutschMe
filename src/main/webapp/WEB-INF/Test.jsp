<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="pages.MyTest"%>
    <%@ page import="beans.DB_con" %>
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
      <!-- HEADER -->
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
            <h1 style="text-align:center"><strong>DEUTSCH EINSTUFUNGSTEST: NIVEAU <%=(String)request.getAttribute("Level") %></h1>
          </div>
        </header>
        <section>
          <div class="box">
          <div class="container">
            <% 
            Connection con;
            int i=0;
            DB_con inf=new DB_con();
        	String user=inf.getUser();
        	String url=inf.getUrl();
        	String pwd=inf.getPwd();
        	try {
    	   	    Class.forName("org.postgresql.Driver");
    			con = DriverManager.getConnection (url,user,pwd);
    		    PreparedStatement ps=con.prepareStatement("select * from questions where niveau =?;");
    		    ps.setObject(1,(String)request.getAttribute("Level"));
    		    ResultSet rs = ps.executeQuery() ;
    		    while (rs.next()) {
    		    i++;
    		    %>
    		     <form  Method="POST" enctype="application/x-www-form-urlencoded">
		          <p style="color:black;"><%=(String)rs.getObject("qst") %></p><br>
		          <input type="hidden" name="qst<%=i%>" value="<%=(String)rs.getObject("qst") %>"><br>
		          <input type="radio" name="niveau<%=i%>" id="radio" value="<%= (String)rs.getObject("choix1") %>"><p id="pradio"><%= (String)rs.getObject("choix1") %></p><br>
		          <input type="radio" style="color:black;" name="niveau<%=i%>" id="radio" value="<%=(String)rs.getObject("choix2") %>">
		          <p id="pradio"><%=(String)rs.getObject("choix2") %></p><br>
		          <input type="radio" style="color:black;" name="niveau<%=i%>" id="radio" value="<%= (String)rs.getObject("choix3") %>">
		          <p id="pradio"><%= (String)rs.getObject("choix3") %></p><br>
		          <input type="radio" style="color:black;" name="niveau<%=i%>" id="radio" value="<%= (String)rs.getObject("choix4") %>">
		          <p id="pradio"><%= (String)rs.getObject("choix4") %></p><br>
		          <input type="hidden" name="explaination<%=i%>" style="color:black;margin-bottom:20px;margin-top:20px;" value="<%=(String)rs.getObject("rs_vrai") %>"> 
		      <%}}catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
		         }%>
		         <input type="submit"  value="Validate" style="margin-top:30px;margin-left:320px;display:block;" formaction="MyTest"/>
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
