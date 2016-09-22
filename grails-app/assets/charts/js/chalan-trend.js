var svg, x, y;
function drawChalanTrendChart(id, submitted, approved, paid) {
	drawCanvas(id, submitted);

    var line = d3.svg.line()
    				.interpolate("monotone") 
					.x(function(d) { return x(d.x); })
					.y(function(d) { return y(d.y); });

	svg.append("path")
	  .datum(submitted)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("class", "line-submitted line")
      .attr("d", line )
	  .attr("transform", "translate(30, 0)");


    svg.append("path")
      .datum(approved)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("class", "line-approved line")
      .attr("d", line )
	  .attr("transform", "translate(30, 0)");

    svg.append("path")
      .datum(paid)
      .attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("class", "line-paid line")
      .attr("d", line )
	  .attr("transform", "translate(30, 0)");
}

function drawCanvas(id, submitted){

	var height = $("#" + id).height() - 39;
	var width = $("#" + id).width();

	x = d3.scale.ordinal()
				.rangeRoundBands([0, width], .1);

	y = d3.scale.linear()
				.range([height, 0]);

	var xAxis = d3.svg.axis()
					.scale(x)
					.orient("bottom")

	var yAxis = d3.svg.axis()
					.scale(y)
					.orient("right")
					.ticks(4);

	var yGrid = d3.svg.axis()
					.scale(y)
					.orient("left")
					.ticks(4);
	
	svg = d3.select("#" + id).append("svg")
				.attr("width", width + 12)
				.attr("height", height + 30)
				.append("g")
				.attr("transform", "translate(30, 9)");

	x.domain(submitted.map(function(d) { return d.x; }));
    y.domain([0, d3.max(submitted, function(d) { return d.y; })]);

	svg.append("g")
		.attr("class", "x axis")
		.attr("transform", "translate(0," + height + ")")
		.call(xAxis);

  	svg.append("g")
		.attr("class", "y axis")
		.attr("transform", "translate(-30, 0 )")
		.call(yAxis)

	svg.append("g")         
		.attr("class", "grid")
		.attr("transform", "translate(0, 0 )")
		.call(yGrid
		    .tickSize(-width, 0, 0)
		    .tickFormat("")
		)
}