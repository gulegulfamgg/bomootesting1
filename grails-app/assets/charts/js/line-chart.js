
function drawLineChart() {
	var data = [ 
				 { x : "8A" , y : 12 } , 
				 { x : "8B" , y : 22 } , 
				 { x : "8C" , y : 26 } , 
				 { x : "10A" , y : 83 } , 
				 { x : "10B" , y : 89 } , 
				 { x : "10C" , y : 96 }, 
				 { x : "9A" , y : 35 } , 
				 { x : "9B" , y : 75 } ,
				 { x : "9C" , y : 71 } 
			   ];

	var data2 = [ 
				 { x : "8A" , y : 20 } , 
				 { x : "8B" , y : 18 } , 
				 { x : "8C" , y : 7 } , 
				 { x : "10A" , y : 97 } , 
				 { x : "10B" , y : 79 } , 
				 { x : "10C" , y : 81 }, 
				 { x : "9A" , y : 31 } , 
				 { x : "9B" , y : 59 } ,
				 { x : "9C" , y : 29 } 
			   ];
			   
	var h = $("#chart").height();
	var w = $("#chart").width();
	
	function make_x_axis() {        
	    return d3.svg.axis()
	        .scale(x)
	        .orient("bottom")
	        .ticks(5)
	}

	function make_y_axis() {        
		return d3.svg.axis()
		    .scale(y)
		    .orient("left")
		    .ticks(5)
	}
	
	var margin = {top: 20, right: -0, bottom: 30, left: -0},
		width = w - margin.left - margin.right,
		height = h - margin.top - margin.bottom;

	var x = d3.scale.ordinal()
				.rangeRoundBands([0, width], .1);

	var y = d3.scale.linear()
				.range([height, 0]);
	
	var xAxis = d3.svg.axis()
					.scale(x)
					.orient("bottom");

	var yAxis = d3.svg.axis()
					.scale(y)
					.orient("left")
					.ticks(10, "%");
					
    var line = d3.svg.line()
    				.interpolate("monotone") 
					.x(function(d) { return x(d.x); })
					.y(function(d) { return y(d.y); });
	
	var line2 = d3.svg.line()
					.interpolate("monotone") 
					.x(function(d) { return x(d.x); })
					.y(function(d) { return y(d.y); });
	 				
	var svg = d3.select("#chart").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
	x.domain(data.map(function(d) { return d.x; }));
    y.domain([0, d3.max(data, function(d) { return d.y; })]);

	svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(-40," + height + ")")
      .call(xAxis);

    svg.append("g")
	  .attr("class", "y axis")
	  .call(yAxis)
	.append("text")
	  .attr("transform", "rotate(-90)")
	  .attr("y", 6)
	  .attr("dy", ".71em")
	  .style("text-anchor", "end")

    svg.append("g")         
        .attr("class", "grid")
        .call(make_y_axis()
            .tickSize(-width, 0, 0)
            .tickFormat("")
        )
  
	svg.append("path")
	  .datum(data)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("class", "area")
      .attr("d", line );

    svg.append("path")
      .datum(data2)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("class", "area")
      .attr("d", line );
}