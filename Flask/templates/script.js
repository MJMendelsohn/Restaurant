var images = ["delivery.jpg", "fancy.jpg", "fast-food.jpg"];
var desc = [{{filtered_restaurant_data[0]}}, {{filtered_restaurant_data[1]}}];
var userSelected = [];
var curImage;

var j = 0;

for (var i = 0; i < images.length; i++) {
  userSelected.push(0);
}

function leftSelect() {
  curImage = document.getElementById("currImage").src;
  userSelected[j] = 0;

  if (j < images.length - 1) {
    j = j + 1;
  }
  //alert("Hello");
  document.getElementById("currImage").src = images[j];
  document.getElementById("caption").innerHTML = desc[j];
}

function rightSelect() {
  curImage = document.getElementById("currImage").src;
  userSelected[j] = 1;

  if (j < images.length - 1) {
    j = j + 1;
  }
  document.getElementById("currImage").src = images[j];
  document.getElementById("caption").innerHTML = desc[j];
}

var left = document.getElementById("left-arrow");

left.addEventListener("click", function() {
  leftSelect();
});

var right = document.getElementById("right-arrow");

right.addEventListener("click", function() {
  rightSelect();
});

$(document).keydown(function(e) {
  switch(e.which) {
    case 37:
      leftSelect();
      break;
    case 39:
      rightSelect();
      break;

      default: return;
  }
  e.preventDefault();
}
);
