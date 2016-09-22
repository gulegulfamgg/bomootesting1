
function drawPieChart() {
	var data = [ 
				 { x : "A" , y : 12 } , 
				 { x : "B" , y : 20 } , 
				 { x : "C" , y : 46 } , 
				 { x : "D" , y : 35 } , 
				 { x : "E" , y : 25 } ,
				 { x : "F" , y : 71 } , 
				 { x : "G" , y : 83 } , 
				 { x : "H" , y : 29 } , 
				 { x : "I" , y : 65 } , 
				 { x : "J" , y : 57 } ,
				 { x : "K" , y : 87 } , 
				 { x : "L" , y : 68 } , 
				 { x : "M" , y : 9 } , 
				 { x : "N" , y : 16 } , 
				 { x : "O" , y : 52 } 
			   ];
			   
	var width = $("#pie-chart").height(),
		height = $("#pie-chart").width(),
		radius = Math.min(width, height) / 2.25;

	var color = d3.scale.ordinal()
					.range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00", "#8a89a6" ]);
	
	var arc = d3.svg.arc()
				.outerRadius(radius - 10)
				.innerRadius(0);

	var labelArc = d3.svg.arc()
					.outerRadius(radius - 40)
					.innerRadius(radius - 40);

	var pie = d3.layout.pie()
					.sort(null)
					.value(function(d) { return d.y; });

	var svg = d3.select("#pie-chart").append("svg")
				.attr("width", width)
				.attr("height", height)
			  .append("g")
				.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

	
	var g = svg.selectAll(".arc")
			  .data(pie(data))
			.enter().append("g")
			  .attr("class", "arc");

	g.append("path")
	  .attr("d", arc)
	  .style("fill", function(d) { return color(d.data.x); });

	g.append("text")
	  .attr("transform", function(d) { return "translate(" + labelArc.centroid(d) + ")"; })
	  .attr("dy", ".35em")
	  .text(function(d) { return d.data.x; });
}