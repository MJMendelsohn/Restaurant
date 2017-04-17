var images = ["delivery.jpg", "fast-food.jpg", "fancy.jpg"];
var desc = ["Do you want a restaurant that delivers?", "Do you want to go to a fast-food restaurant?", "Do you want a fancy restaurant?"];
var userSelected = [];
var j = 0;

for (var i = 0; i < images.length; i++) {
  userSelected.push(0);
}


var left = document.getElementById("left-arrow");

left.addEventListener("click", function() {
  var curImage = document.getElementById("currImage").src;
  userSelected[j] = 0;

  if (j < images.length - 1) {
    j = j + 1;
  }
  //alert("Hello");
  document.getElementById("currImage").src = images[j];
  document.getElementById("caption").innerHTML = desc[j];
});

var right = document.getElementById("right-arrow");

right.addEventListener("click", function() {
  var curImage = document.getElementById("currImage").src;
  userSelected[j] = 1;

  if (j < images.length - 1) {
    j = j + 1;
  }
  document.getElementById("currImage").src = images[j];
  document.getElementById("caption").innerHTML = desc[j];
});
