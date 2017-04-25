function createSwipe(survey_results) {
    var images = ["img1.jpg", "img2.jpg", "img3.png", "img4.jpg", "img5.png", "img6.jpg", "img7.jpg", "img8.jpg", "img9.jpg", "img10.jpg"];
//    var desc = ["Do you want a restaurant that delivers?", "Do you want to go to a fast-food restaurant?", "Do you want a fancy restaurant?"];
    var desc = survey_results;
    var userSelected = [];
    var j = 1;

    for (var i = 0; i < images.length; i++) {
      userSelected.push(0);
    }


    var left = document.getElementById("left-arrow");

    document.getElementById("currImage").src = "static/"+images[0];
    document.getElementById("caption").innerHTML = desc[0];

    left.addEventListener("click", function() {
      var curImage = document.getElementById("currImage").src;
      userSelected[j] = 0;

      if (j < desc.length - 1) {
        j = j + 1;
      }
      //alert("Hello");
      document.getElementById("currImage").src = "static/"+images[j];
      document.getElementById("caption").innerHTML = desc[j];
    });

    var right = document.getElementById("right-arrow");

    right.addEventListener("click", function() {
      var curImage = document.getElementById("currImage").src;
      userSelected[j] = 1;

      if (j < desc.length - 1) {
        j = j + 1;
      }
      document.getElementById("currImage").src = "static/"+images[j];
      document.getElementById("caption").innerHTML = desc[j];
    });
}
