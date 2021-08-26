<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>What's her name?</title>
	<!--meta name="description" content="A simple HTML5 Template for new projects.">
	<meta name="author" content="SitePoint">

	<meta property="og:title" content="A Basic HTML5 Template">
	<meta property="og:type" content="website">
	<meta property="og:url" content="https://www.sitepoint.com/a-basic-html5-template/">
	<meta property="og:description" content="A simple HTML5 Template for new projects.">
	<meta property="og:image" content="image.png">

	<link rel="icon" href="/favicon.ico">
	<link rel="icon" href="/favicon.svg" type="image/svg+xml">
	<link rel="apple-touch-icon" href="/apple-touch-icon.png">

	<link rel="stylesheet" href="css/styles.css?v=1.0"-->
	<style>
		* {
		  margin:0px;
		  padding:0px;
		  box-sizing:border-box;
		}
		html, body {
		  width: 100%;
		  height:100%;
		  overflow: hidden;
		}
		body {
			font-family:"Raleway",sans-serif;
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
		.poll {
		  position:absolute;
		  top:50%;
		  left:50%;
		  transform:translate(-50%,-50%);
		  width:100%;
		  max-width:400px;
		  background:#fff;
		  border-radius:10px;
		  box-shadow:0px 0px 20px 5px rgba(35,30,128,0.05);
		}
		.poll .suggest {
			padding:20px;
		  color:#111;
		  font-size:18px;
		}
		.poll .question {
		  padding:20px;
		  color:#111;
		  font-size:18px;
		  border-bottom:1px solid #eee;
		}
		.poll .answers {
		  padding:20px 20px 10px;
		}
		.poll .answers .answer {
		  position:relative;
		  width:100%;
		  height:40px;
		  padding:0px 10px;
		  line-height:40px;
		  color:#111;
		  margin-bottom:10px;
		  border:1px solid #d4d4d4;
		  border-radius:10px;
		  cursor:pointer;
		  overflow:hidden;
		}
		.poll .answers .answer.selected {
		  border:2px solid #8f9fe8;
		}
		.poll .answers .answer span.percentage-value {
		  position:absolute;
		  top:50%;
		  right:0px;
		  width:40px;
		  transform:translateY(-50%);
		  color:#111;
		  font-size:15px;
		}
		.poll .answers .answer span.percentage-bar {
		  position:absolute;
		  top:0px;
		  left:0px;
		  width:0%;
		  height:100%;
		  background:#ccd8f1;
		  z-index:-1;
		  transition:width 300ms ease-in-out;
		}
		.square_btn{
		    position: absolute;
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
		    border-radius:10px;
		    box-shadow:0px 0px 20px 5px rgba(35,30,128,0.05);
		}
		
		.square_btn:hover {
		    background: #668ad8;
		    color: #FFF;
		}
	</style>
</head>

<body>

	<div class="poll">
		<div class="question"></div>
		<div class="answers"></div>
			
		
		<div class="suggest">
		<c:set var="suggested" value="${cookie.suggested.value}"/>
		<c:if test="${!suggested.equals('true')}">
			<button class="square_btn" onclick="suggestion()">Suggest a name?</button>
		</c:if>
	  	</div>
	  
	</div>
	
	<script src="js/index.js"></script>
	
</body>
</html>