<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="pages.Home" %>
<%@ page import ="pages.Update" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>DeutschMe</title>
      <style>
      #tt{
      margin-top:30px;
      background-color:#005881;
      color: white;
	  padding: 15px 46px;
	  border: none;
	  border-radius: 10px;
	  cursor: pointer;
      }
      .box{
            display: grid;
            justify-content: start;
            grid-template-columns: 1050px 90px 200px;
		}
		.container {
		  width:3%;
		  background-color: #002633;
		  margin-top:20px;
		  height:495px;
		  margin-left:-8px;
		  text-align:center;
		  padding: 20px;
		}
		.container1 {
		  box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;
		  margin-top:150px;
		  margin-left:80px;
		  border-left:10px;
		  border-radius: 10px;
		  background-color: rgb(250,255,249);
		  padding: 20px;
		  width: 200px;
		  height:200px;
		  text-align:center;
		}
		#hala{
		  font-size: 99%;
		  font-family: Courier New, monospace;
		  font-weight:800;
		  color: black;
		  padding: 12px 16px;
		  border: none;
		  margin-top:-8px;
		}
		.outer{
		            display: flex;
		            position: absolute;
		            left:0;
		            height: 310px;
		            justify-content: space-evenly;
		            margin-top:70px;
		            background-color: #005881;
		            
		}
		.dropbtn {
		    display: inline-block;
		    margin-left:-60px;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		}
		li a:hover, .dropdown:hover .dropbtn {
	    background-color: #f9f9f9;
		}
		
		li.dropdown {
		    display: inline-block;
		}
		
		.dropdown-content {
		    font-size: 90%;
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		    text-align: left;
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.show {display:block;}
		.flex {
		  display: grid;
		  justify-content:start;
		  flex-wrap: wrap;
		  flex-basis: 100%;
		  grid-template-columns: 150px 350px 350px 400px;
		  grid-template-rows: 150px 150px 150px;  
		}
      </style>
   </head>
   <body>
      <header>
         <div class="box">
           <form method="post">
           <input type=hidden value="<%=(String) request.getAttribute("np") %>">
          <div>
          <button style="text-decoration:none;border:none;background-color:white;height:20px;" formaction="Home">
          <img src="img/logo-black.jpg"  alt=""  style="height:50px;margin-top:13px;">
         </button>
         </div>
         </form>
         <div><img src="img/user.png" title="user" style="height:40px;margin-top:20px;filter: brightness(0);"></div>
              <div style="margin-top:14px;margin-bottom:11px;">
                <ul>
                  <li class="dropdown">
                    <a id="hala" href="javascript:void(0)" class="dropbtn" onclick="myFunction()"><%=(String) request.getAttribute("np")%></a>
                    <div class="dropdown-content" id="myDropdown">
                      <a href="index.html">Logout</a>
                    </div>
                  </li>
                </ul>
                <script>
                /* When the user clicks on the button,
                toggle between hiding and showing the dropdown content */
                function myFunction() {
                    document.getElementById("myDropdown").classList.toggle("show");
                }

                // Close the dropdown if the user clicks outside of it
                window.onclick = function(e) {
                  if (!e.target.matches('.dropbtn')) {

                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    for (var d = 0; d < dropdowns.length; d++) {
                      var openDropdown = dropdowns[d];
                      if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                      }
                    }
                  }
                }
                function Focus() {
                    document.getElementById("qte").focus();
                }
                </script>
              </div>
            </div>
</header>
<div class="flex">
  <div class="container"></div>  
  <div class="container1"><a href="#" ><img src="img/cours.png"  title="courses"  style="width:120px;height:120px;filter: brightness(50%);"></a>
  <br><button id="tt" onclick="window.location.href='MyCourses'">Courses</button>
  </div>  
  <div class="container1"><a href="#" ><img src="img/book.png"  title="Exercises"  style="height:110px;margin-top:10px;margin-left:-5px;filter: brightness(50%);"></a>
  <br><button id="tt" onclick="window.location.href='MyExos'">Exercises</button>
  </div>      
  <div class="container1"><a href="#" ><img src="img/test.png"  title="Test"  style="height:110px;margin-top:10px;margin-left:18px;filter: brightness(50%);"></a>
  <br><button id="tt" onclick="window.location.href='MyTest'">Test</button>
  </div> 
  </div>
 </body>
 </html>
