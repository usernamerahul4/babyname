<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What's her name?</title>
<style type="text/css">

html, body {
  width: 100%;
  height:100%;
  overflow: hidden;
}

body {
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    background-size: 400% 400%;
    animation: gradient 15s ease infinite;
}

@keyframes gradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

.header {
position:   absolute;
top:      0px;
height:     25%;
width:      100%;
}
.footer {
position:   absolute;
bottom:      0px;
height:     25%;
width:      100%;
}
.cssBody {
position:   absolute;
top:      25%;
bottom:      25%;
width:       100%;
}

.text {
  position: relative; 
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 3vw;
  font-family: "Righteous", cursive;
}

.suggest {
	position: relative; 
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.square_btn{
    position: relative;
	float: right;
	margin: 9px;
    display: inline-block;
    font-weight: bold;
    padding: 0.5em 1em;
    text-decoration: none;
    border-left: solid 4px #668ad8;
    border-right: solid 4px #668ad8;
    color: #668ad8;
    background: #e1f3ff;
    transition: .4s;
}

.square_btn:hover {
    background: #668ad8;
    color: #FFF;
}

.hide {
  visibility: hidden;
}

</style> 
   </head> 
   <body> 
      <div class="header"> 
		<div class="text">
		<div class='hello'>What's her Name?</div>
		</div>
		
		<div class="suggest">
		
		<form action="/vote" method="POST">
			<input type="text" name="name" placeholder="Enter her Name?" required>
			  <button type="submit">Suggest</button>
		</form>
		</div>
		
		
      </div> 
      
      <div class="cssBody"> 
		
		<div class="wrapper">
		    <div id="container" style="width:100%;"></div>
		</div>

		<script src="js/highcharts.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/index.js"></script>
      </div> 
      
 		<div class="footer">
 		
 		<div class="votes" style="border: 2px dashed black;">
 		<h1>Vote among these:</h1>
 		<div><form action="/vote" method="POST"><input name="name" type="hidden" value="niyomi"><input class="square_btn" type="submit" value="niyomi"></form></div></div>
 		</div>
   </body>
</html>