
function drawAreaChart() {
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
			   
	var h = $("#area-chart").height();
	var w = $("#area-chart").width();
	
	var margin = {top: 0, right: -0, bottom: 30, left: -0},
		width = w - margin.left - margin.right,
		height = h - margin.top - margin.bottom;

	var x = d3.scale.ordinal()
				.rangeRoundBands([0, width], .1);

	var y = d3.scale.linear()
				.range([height, 0]);
	
	var xAxis = d3.svg.axis()
					.scale(x)
					.orient("bottom")

	var yAxis = d3.svg.axis()
					.scale(y)
					.orient("left")
					.ticks(10, "%");
	
	var area = d3.svg.area()
				    .interpolate("basis")    
					.x(function(d) { return x(d.x); })
					.y0(height)
					.y1(function(d) { return y(d.y); });
					
	var svg = d3.select("#area-chart").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
	x.domain(data.map(function(d) { return d.x; }));
    y.domain([0, d3.max(data, function(d) { return d.y; })]);

	svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

    svg.append("g")
	  .attr("class", "y axis")
	  .call(yAxis)
	.append("text")
	  .attr("transform", "rotate(-90)")
	  .attr("y", 6)
	  .attr("dy", ".71em")
	  .style("text-anchor", "end")
	  .text("Frequency");
	  
	svg.append("path")
	  .datum(data)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
	  .attr("class", "area")
      .attr("d", area);
}