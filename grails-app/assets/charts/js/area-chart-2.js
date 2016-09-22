function drawAreaChart() {
	var data = [ 
				 { x : "29 Jun" , y : 12 } , 
				 { x : "28 Jun" , y : 20 } , 
				 { x : "27 Jun" , y : 46 } , 
				 { x : "26 Jun" , y : 35 } , 
				 { x : "25 Jun" , y : 25 } ,
				 { x : "24 Jun" , y : 71 } , 
				 { x : "23 Jun" , y : 83 } , 
				 { x : "22 Jun" , y : 29 } , 
				 { x : "21 Jun" , y : 65 } , 
				 { x : "20 Jun" , y : 57 } ,
				 { x : "19 Jun" , y : 87 } , 
				 { x : "18 Jun" , y : 68 } , 
				 { x : "17 Jun" , y : 29 } , 
				 { x : "16 Jun" , y : 16 } , 
				 { x : "15 Jun" , y : 52 } 
			   ];
			   
	var h = $("#chart").height();
	var w = $("#chart").width();
	
	var margin = {top: 20, right: -0, bottom: 30, left: -0},
		width = w - margin.left - margin.right,
		height = h - margin.top - margin.bottom;

	var x = d3.scale.ordinal()
				.rangeRoundBands([0, width], .1);

	var y = d3.scale.linear()
				.range([height, 0]);

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
	
	var xAxis = d3.svg.axis()
					.scale(x)
					.orient("bottom");

	var yAxis = d3.svg.axis()
					.scale(y)
					.orient("left");
	
	var area = d3.svg.area()
				    .interpolate("monotone")    
					.x(function(d) { return x(d.x); })
					.y0(height)
					.y1(function(d) { return y(d.y); });
					
	var svg = d3.select("#chart").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	x.domain(data.map(function(d) { return d.x; }));
    y.domain([0, d3.max(data, function(d) { return d.y; })]);

    svg.append("g")         
        .attr("class", "grid")
        .attr("transform", "translate(0," + height + ")")
        .call(make_x_axis()
            .tickSize(0, 0, 0)
            .tickFormat("")
        )

    svg.append("g")         
        .attr("class", "grid")
        .call(make_y_axis()
            .tickSize(-width, 0, 0)
            .tickFormat("")
        )
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