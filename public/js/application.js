$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


var div = document.createElement("div");
div.innerHTML = "Hello, world!";
document.body.appendChild(div);
var body = d3.select("body");
var div = body.append("div");
div.html("Hello, world!");
