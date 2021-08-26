window.onload= getData();
var poll, pollDOM;
var opt = sessionStorage.getItem('opt') != null? parseInt(sessionStorage.getItem('opt')):-1;
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
	console.log(series);
	
	poll = {
	  question:"What's her name?",
	  answers:series[0].namesArr,
	  pollCount:series[0].pollCount,
	  answersWeight:series[0].votesArr,
	  selectedAnswer:-1
	};

	pollDOM = {
	  question:document.querySelector(".poll .question"),
	  answers:document.querySelector(".poll .answers")
	};

	pollDOM.question.innerText = poll.question;
	pollDOM.answers.innerHTML = poll.answers.map(function(answer,i){
	  return (
		`
		  <div class="answer" onclick="markAnswer('${i}')">
			${answer}
			<span class="percentage-bar"></span>
			<span class="percentage-value"></span>
		  </div>
		`
	  );
	}).join("");
	

}

function markAnswer(i){
	console.log(poll);
	opt = +i;
	sessionStorage.setItem('opt', opt);	
	
  /*************/
  try {
	document.querySelector(".poll .answers .answer.selected").classList.remove("selected");
  } catch(msg){}
  document.querySelectorAll(".poll .answers .answer")[+i].classList.add("selected");
  
  postData(poll.answers[i]);
  
  //showResults();
}

function showResults(){
  //getData(); 
  
  let answers = document.querySelectorAll(".poll .answers .answer");
  for(let i=0;i<answers.length;i++){
	let percentage = 0;
	if(i == opt){
	  percentage = Math.round(
		(poll.answersWeight[i]+1) * 100 / (poll.pollCount+1)
	  );
	} else {
	  percentage = Math.round(
		(poll.answersWeight[i]) * 100 / (poll.pollCount+1)
	  );
	}
	
	answers[i].querySelector(".percentage-bar").style.width = percentage + "%";
	answers[i].querySelector(".percentage-value").innerText = percentage + "%";
  }
  document.querySelector(".poll .answers").style.pointerEvents = "none";
}

function postData(name){
	fetch("vote", {
		 method:"POST",
		 body:new URLSearchParams("name=" + name)
	});
	
	//window.location.reload();
	getData();
	showResults();
	console.log("post data");
}

function suggestion() {
	let name = prompt("Enter her name:");
	if (!/[^a-zA-Z]/.test(name)){
		if(name != "" && name != "null") {
			postData(name);
		}
	}
	else{
		alert(`Invalid Name ${name}!`);
	}
	
	//window.location.reload();
	getData();
	//if(document.querySelector(".poll .answers").style.pointerEvents == "none") {
		showResults();
	//}
	console.log("suggested");
}
