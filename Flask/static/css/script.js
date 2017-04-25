var images = ["img1.jpg", "img2.jpg", "img3.png", "img4.jpg", "img5.png", "img6.jpg", "img7.jpg", "img8.jpg", "img9.jpg", "img10.jpg"];
//alert({{filtered_restaurant_data[0]}});
//var desc = [{{filtered_restaurant_data[0]}}, {{filtered_restaurant_data[1]}}];

var desc = filtered_restaurant_data;

var userSelected = [];
var curImage;

var j = 0;

for (var i = 0; i < desc.length; i++) {
  userSelected.push(0);
}

function leftSelect() {
  curImage = document.getElementById("currImage").src;
  userSelected[j] = 0;

  if (j < desc.length - 1) {
    j = j + 1;
  }
  //alert("Hello");
  document.getElementById("currImage").src = images[j];
  document.getElementById("caption").innerHTML = desc[j];
}

function rightSelect() {
  curImage = document.getElementById("currImage").src;
  userSelected[j] = 1;

  if (j < desc.length - 1) {
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

if (j == desc.length - 1) {
  alert(desc[desc.length - 1]);
}

var select = document.getElementById("selector");

for(var i = 0; i < desc.length; i++) {
  if (userSelected[i] == 1) {
    var opt = desc[i];
    var el = document.createElement("option");
    el.textContent = opt;
    el.value = opt;
    select.appendChild(el);
  }
}​

var userChoice = select.options[select.selectedIndex].text;

document.getElementById('button').onclick = function() {
   alert(userChoice);
}​;​
