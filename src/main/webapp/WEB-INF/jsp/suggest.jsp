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

.hello {
  position: absolute; 
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 5vw;
  -webkit-animation-name: wave;
          animation-name: wave;
  -webkit-animation-iteration-count: infinite;
          animation-iteration-count: infinite;
  -webkit-animation-timing-function: ease-in-out;
          animation-timing-function: ease-in-out;
  font-family: "Righteous", cursive;
  -webkit-text-stroke-width: 2px;
  -webkit-text-stroke-color: black;
}

.hello:nth-of-type(1) {
  -webkit-animation-duration: 2s;
          animation-duration: 2s;
  -webkit-animation-delay: 0.55s;
          animation-delay: 0.55s;
}

.hello:nth-of-type(2) {
  -webkit-animation-duration: 2s;
          animation-duration: 2s;
  -webkit-animation-delay: 0.3s;
          animation-delay: 0.3s;
}

.hello:nth-of-type(3) {
  -webkit-animation-duration: 2s;
          animation-duration: 2s;
  -webkit-animation-delay: 0.05s;
          animation-delay: 0.05s;
}

.hello:nth-of-type(4) {
  -webkit-animation-duration: 2s;
          animation-duration: 2s;
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s;
}

@-webkit-keyframes wave {
  40%, 50% {
    transform: translate(-50%, -65%) scale(1.05);
  }
  0%, 90%, 100% {
    transform: translate(-50%, -45%) scale(0.95);
  }
}

@keyframes wave {
  40%, 50% {
    transform: translate(-50%, -65%) scale(1.05);
  }
  0%, 90%, 100% {
    transform: translate(-50%, -45%) scale(0.95);
  }
}


.cf:before, .cf:after{
  content:"";
  display:table;
}

.cf:after{
  clear:both;
}

.cf{
  zoom:1;
}

.suggest {
	position: absolute; 
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

/*-------------------------------------*/	

.form-wrapper {
	width: 100%;
	padding: 15px;
	margin: 150px auto 50px auto;
	background: #444;
	background: rgba(0,0,0,.2);
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-moz-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
	box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
}

.form-wrapper input {
	width: 330px;
	height: 20px;
	padding: 10px 5px;
	float: left;    
	font: bold 15px 'lucida sans', 'trebuchet MS', 'Tahoma';
	border: 0;
	background: #eee;
	-moz-border-radius: 3px 0 0 3px;
	-webkit-border-radius: 3px 0 0 3px;
	border-radius: 3px 0 0 3px;      
}

.form-wrapper input:focus {
	outline: 0;
	background: #fff;
	-moz-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
	-webkit-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
	box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
}

.form-wrapper input::-webkit-input-placeholder {
   color: #999;
   font-weight: normal;
   font-style: italic;
}

.form-wrapper input:-moz-placeholder {
	color: #999;
	font-weight: normal;
	font-style: italic;
}

.form-wrapper input:-ms-input-placeholder {
	color: #999;
	font-weight: normal;
	font-style: italic;
}    

.form-wrapper button {
	overflow: visible;
	position: relative;
	float: right;
	border: 0;
	padding: 0;
	cursor: pointer;
	height: 40px;
	width: 110px;
	font: bold 15px/40px 'lucida sans', 'trebuchet MS', 'Tahoma';
	color: #fff;
	text-transform: uppercase;
	background: #d83c3c;
	-moz-border-radius: 0 3px 3px 0;
	-webkit-border-radius: 0 3px 3px 0;
	border-radius: 0 3px 3px 0;      
	text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
}   
  
.form-wrapper button:hover{		
	background: #e54040;
}	
  
.form-wrapper button:active,
.form-wrapper button:focus{   
	background: #c42f2f;    
}

.form-wrapper button:before {
	content: '';
	position: absolute;
	border-width: 8px 8px 8px 0;
	border-style: solid solid solid none;
	border-color: transparent #d83c3c transparent;
	top: 12px;
	left: -6px;
}

.form-wrapper button:hover:before{
	border-right-color: #e54040;
}

.form-wrapper button:focus:before{
	border-right-color: #c42f2f;
}    

.form-wrapper button::-moz-focus-inner {
	border: 0;
	padding: 0;
}
</style>
</head>

<body>

<div class="text">
<div class='hello' style='color: #7c4dff'>What's her Name?</div>
<div class='hello' style='color: #0091ea'>What's her Name?</div>
<div class='hello' style='color: #ff9100'>What's her Name?</div>
<div class='hello' style='color: #ff1744'>What's her Name?</div>
</div>
	
<div class="suggest">
	<form action="/vote" method="POST" class="form-wrapper cf">
		<input type="text" name="name" id="name" placeholder="Enter her Name?" required>
		 <button type="submit">Suggest</button>
	</form>
	</div>
	

	
</body>
</html>