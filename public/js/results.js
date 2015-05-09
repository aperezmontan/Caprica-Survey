var results = function(chart,data){
var x = d3.scale.linear()
    .domain([0, 100])
    .range([0, 420]);

d3.select(chart)
  .selectAll("div")
    .data(data)
  .enter().append("div")
    .style("width", function(d) { return x(d) + "px"; })
    .text(function(d) { return d + '%'; });
};
