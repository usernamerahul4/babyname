$.ajax({
	url: "babynamedata",
	success: function(result){
		var series = [];
		var data = [];
		
		for(var i = 0; i < result.length; i++){
			var object = {};
			object.name = result[i].name.toUpperCase();
			object.y = result[i].votes;
			data.push(object);
		}
		var seriesObject = {
			name: 'Names',
			colorByPoint: true,
			data: data
		};
		series.push(seriesObject);
		drawPieChart(series);
	}
});


function drawPieChart(series){
	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: 'Whats her Name?'
	    },
	    tooltip: {
	    	formatter: function() {
	    		return '<strong>'+this.key+': </strong>'+ this.y;
		    }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.y}'
	            }
	        }
	    },
	    series: series
	});
}

function redrawchart(){
    let chartDom = document.getElementById("container");
    let chart = Highcharts.charts[Highcharts.attr(chartDom, 'data-highcharts-chart')];
    
    var w = $('#container').closest(".wrapper").width()
    // setsize will trigger the graph redraw 
    chart.setSize(       
        w,w * (3/4),false
    );
 }

$(window).resize(redrawchart);
redrawchart();
redrawchart();


/*
function get_cookies_array() {
    var cookies = {};
    if (document.cookie && document.cookie != "") {
        var split = document.cookie.split(";");
        for (var i = 0; i < split.length; i++) {
            var name_value = split[i].split("=");
            name_value[0] = name_value[0].replace(/^ /, "");
            cookies[decodeURIComponent(name_value[0])] = decodeURIComponent(name_value[1]);
        }
    }
    return cookies;
}
function removeDiv() {
	var cookies = get_cookies_array();
	console.log("vberf");
	for (var name in cookies) {
	    if (name == "voted") {
	        document.getElementsByClassName("votes")[0].remove();
	    }
	    if (name == "suggested") {
	        document.getElementsByClassName("suggest")[0].remove();
	    }
	    else {
	    	getVoteList();
	    }
	}
}

removeDiv();

function getVoteList() {
	$.ajax({
		url: "babynamedata",
		success: function(result){
			var data = [];
			
			for(var i = 0; i < result.length; i++){
				var object = {};
				object.name = result[i].name.toUpperCase();
				object.y = result[i].votes;
				data.push(object);
			}
		}
	});
}*/