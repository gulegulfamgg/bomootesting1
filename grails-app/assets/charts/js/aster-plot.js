
function drawAsterPlot() {
	var data = [ 
				 { id : "Abc" , order : 1.1, score : 70, weight : 0.4, width : 0.4, color : "#9E0041", label : "Abc" } , 
				 { id : "Pqr" , order : 2, score : 94, weight : 0.2, width : 0.2, color : "#78af97", label : "Pqr" } , 
				 { id : "Xyz" , order : 3, score : 49, weight : 0.9, width : 0.9, color : "#789041", label : "Xyz" } , 
				 { id : "Def" , order : 4, score : 23, weight : 0.8, width : 0.8, color : "#9E3289", label : "Def" } ,
				 { id : "Abc" , order : 1.1, score : 70, weight : 0.4, width : 0.4, color : "#9E0041", label : "Abc" } , 
				 { id : "Pqr" , order : 2, score : 94, weight : 0.2, width : 0.2, color : "#78af97", label : "Pqr" } , 
				 { id : "Xyz" , order : 3, score : 49, weight : 0.9, width : 0.9, color : "#789041", label : "Xyz" } , 
				 { id : "Def" , order : 4, score : 23, weight : 0.8, width : 0.8, color : "#9E3289", label : "Def" } 
			    
			   ];
			   
	var width = $("#aster-plot").height(),
		height = $("#aster-plot").width(),
		radius = Math.min(width, height) / 3,
    	innerRadius = 0.3 * radius;

    var pie = d3.layout.pie()
    			.sort(null)
    			.value(function(d) { return d.width; });

    var tip = d3.tip()
	  .attr('class', 'd3-tip')
	  .offset([0, 0])
	  .html(function(d) {
	    return d.data.label + ": <span style='color:orangered'>" + d.data.score + "</span>";
	});

	var arc = d3.svg.arc()
	  .innerRadius(innerRadius)
	  .outerRadius(function (d) { 
	    return (radius - innerRadius) * (d.data.score / 100.0) + innerRadius; 
	});

	var outlineArc = d3.svg.arc()
        .innerRadius(innerRadius)
        .outerRadius(radius);

	var svg = d3.select("#aster-plot").append("svg")
	    .attr("width", width)
	    .attr("height", height)
	    .append("g")
	    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

	svg.call(tip);

	var path = svg.selectAll(".solidArc")
	      .data(pie(data))
	    .enter().append("path")
	      .attr("fill", function(d) { return d.data.color; })
	      .attr("class", "solidArc")
	      .attr("stroke", "gray")
	      .attr("d", arc)
	      .on('mouseover', tip.show)
	      .on('mouseout', tip.hide);

	  var outerPath = svg.selectAll(".outlineArc")
	      .data(pie(data))
	    .enter().append("path")
	      .attr("fill", "none")
	      .attr("stroke", "gray")
	      .attr("class", "outlineArc")
	      .attr("d", outlineArc);  


	  // calculate the weighted mean score
	  var score = 
	    data.reduce(function(a, b) {
	      console.log('a:' + a + ', b.score: ' + b.score + ', b.weight: ' + b.weight);
	      return a + (b.score * b.weight); 
	    }, 0) / 
	    data.reduce(function(a, b) { 
	      return a + b.weight; 
	    }, 0);

	  svg.append("svg:text")
	    .attr("class", "aster-score")
	    .attr("dy", ".35em")
	    .attr("text-anchor", "middle") // text-align: right
	    .text(Math.round(score));
}