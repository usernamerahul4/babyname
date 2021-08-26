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

* :not(body) {
  margin:0px;
  padding:0px;
  box-sizing:border-box;
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
</style>
</head>

<body>

<div class="text">
<div class='hello' style='color: #7c4dff'>What's her Name?</div>
<div class='hello' style='color: #0091ea'>What's her Name?</div>
<div class='hello' style='color: #ff9100'>What's her Name?</div>
<div class='hello' style='color: #ff1744'>What's her Name?</div>
</div>
	
<div class="poll">
<div class="question"></div>
<div class="answers"></div>
</div>
	
<script>
		var poll, pollDOM;
		getData();
		function getData() {
			fetch('babynamedata')
			.then(response => response.json())
			.then(result => {
				{
					var series = [];
					var namesArr = [];
					var votesArr = [];
					var sum=0;
					
					for(var i = 0; i < result.length; i++){
						namesArr.push(result[i].name.toUpperCase());
						votesArr.push(result[i].votes);
						sum+=result[i].votes;
					}
					var seriesObject = {
						pollCount: sum,
						namesArr: namesArr,
						votesArr: votesArr
					};
					series.push(seriesObject);
					setHtmlText(series);
				}
			});
		}

		function setHtmlText(series) {

			poll = {
			  question:"Vote your opinion",
			  answers:series[0].namesArr,
			  pollCount:series[0].pollCount,
			  answersWeight:series[0].votesArr,
			  selectedAnswer:-1
			};

			var pollDOM = {
			  question:document.querySelector(".poll .question"),
			  answers:document.querySelector(".poll .answers")
			};

			pollDOM.question.innerText = poll.question;
			pollDOM.answers.innerHTML = poll.answers.map(function(answer,i){
				return ("<div class='answer'> <form action='/vote' method='POST' > <input type='hidden' name='name' value='"+answer+"'> <button class='answer' type='submit'>"+answer+"</button> </form></div>");
			});
		}

		function markAnswer(i){
		  
		  poll.selectedAnswer = +i;
		  try {
			document.querySelector(".poll .answers .answer.selected").classList.remove("selected");
		  } catch(msg){}
		  document.querySelectorAll(".poll .answers .answer")[+i].classList.add("selected");
		  postData(poll.answers[i]);
		}
		function postData(name){
			fetch("vote", {
				 method:"POST",
				 body:new URLSearchParams("name=" + name)
			});
			
			window.location.reload();
		}
</script>
	
</body>
</html>