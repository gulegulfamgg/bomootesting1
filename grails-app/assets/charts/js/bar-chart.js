
function drawBarChart() {
	var data = [ 
				 { x : "8A" , y : 12 } , 
				 { x : "8B" , y : 20 } , 
				 { x : "8C" , y : 46 } , 
				 { x : "9A" , y : 35 } , 
				 { x : "9B" , y : 25 } ,
				 { x : "9C" , y : 71 } , 
				 { x : "10A" , y : 83 } , 
				 { x : "10B" , y : 29 } , 
				 { x : "10C" , y : 65 }
			   ];
			   
	var h = $("#bar-chart").height();
	var w = $("#bar-chart").width();
	
	var margin = {top: 20, right: 20, bottom: 30, left: 40},
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
	
	var svg = d3.select("#bar-chart").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
				
	var tip = d3.tip()
			  .attr('class', 'd3-tip')
			  .offset([-10, 0])
			  .html(function(d) {
				return "Frequency: <span style='color:red'>" + d.y + "</span>";
			  });
			  
	svg.call(tip);
	
	x.domain(data.map(function(d) { return d.x; }));
    y.domain([0, d3.max(data, function(d) { return d.y; })]);

	svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

/*    svg.append("g")
	  .attr("class", "y axis")
	  .call(yAxis)
	.append("text")
	  .attr("transform", "rotate(-90)")
	  .attr("y", 6)
	  .attr("dy", ".71em")
	  .style("text-anchor", "end")
	  .text("Frequency");
*/	  
	svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.x); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.y); })
      .attr("height", function(d) { return height - y(d.y); })
      .on('mouseover', tip.show)
      .on('mouseout', tip.hide);
	  
	d3.select("input").on("change", change);

	var sortTimeout = setTimeout(function() {
		d3.select("input").property("checked", true).each(change);
	}, 2000);

	function change() {
		clearTimeout(sortTimeout);

		// Copy-on-write since tweens are evaluated after a delay.
		var x0 = x.domain(data.sort(this.checked
			? function(a, b) { return b.y - a.y; }
			: function(a, b) { return d3.ascending(a.x, b.x); })
			.map(function(d) { return d.x; }))
			.copy();

		svg.selectAll(".bar")
			.sort(function(a, b) { return x0(a.x) - x0(b.x); });

		var transition = svg.transition().duration(750),
			delay = function(d, i) { return i * 50; };

		transition.selectAll(".bar")
			.delay(delay)
			.attr("x", function(d) { return x0(d.x); });

		transition.select(".x.axis")
			.call(xAxis)
		  .selectAll("g")
			.delay(delay);
	  }
		
}