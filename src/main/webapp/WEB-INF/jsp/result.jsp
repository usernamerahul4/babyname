<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>What's her name?</title>
	<script>
		alert("Site Devloped by ~Rahul!");
	</script>
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

.suggest {
	position: absolute; 
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
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
	<div class="cssBody"> 
		<div id="container"></div>

		<script src="js/highcharts.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/index.js"></script>
    </div>
</div>
	
<script></script>
	
</body>
</html>