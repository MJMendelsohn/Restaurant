function createSwipe(survey_results) {
    var images = ["img1.jpg", "img2.jpg", "img3.png", "img4.jpg", "img5.png", "img6.jpg", "img7.jpg", "img8.jpg", "img9.jpg", "img10.jpg"];
//    var desc = ["Do you want a restaurant that delivers?", "Do you want to go to a fast-food restaurant?", "Do you want a fancy restaurant?"];
    var desc = survey_results;
    var userSelected = [];
    var j = 1;
    var swipeCount = 0;
    for (var i = 0; i < images.length; i++) {
      userSelected.push(0);
    }

    var left = document.getElementById("left-arrow");

    document.getElementById("currImage").src = "static/"+images[0];
    document.getElementById("caption").innerHTML = r_data_process(desc[0]);

    left.addEventListener("click", function() {
      var curImage = document.getElementById("currImage").src;
      userSelected[j] = 0;

      if (j < desc.length - 1) {
        j = j + 1;
      }
      swipeCount++;
      //alert("Hello");
      document.getElementById("currImage").src = "static/"+images[j];
      document.getElementById("caption").innerHTML = r_data_process(desc[j]);
      selector();
    });

    var right = document.getElementById("right-arrow");

    right.addEventListener("click", function() {
      var curImage = document.getElementById("currImage").src;
      userSelected[j] = 1;

      if (j < desc.length - 1) {
        j = j + 1;
      }
      swipeCount++;
      document.getElementById("currImage").src = "static/"+images[j];
      document.getElementById("caption").innerHTML = r_data_process(desc[j]);
      selector();
    });
    
    
    var select = document.getElementById("selector");
    var choose = document.getElementById("choose")
    choose.style.display="none";
    
    function selector() {
        if (swipeCount == desc.length) {

            for(var i = 0; i < desc.length; i++) {
                var opt = desc[i];
                var el = document.createElement("option");
                el.textContent = opt;
                el.value = opt;
                select.appendChild(el);
            } 

            var userChoice = select.options[select.selectedIndex].text;
            choose.style.display="block";

            document.getElementById('button').onclick = function() {
              alert(userChoice);
            };
            //instance.web.Model("server.py").get_func("show_results");
        }
    }
}


function r_data_process(r_data){
  r_data = r_data[0];
  console.log("here2");
  console.log(r_data);
  console.log(r_data[1]);
  var r_strings = [];

  r_strings[r_strings.length] = "Restaurant: " + r_data[1];

  if(typeof r_data[2] === 'number')
    r_strings[r_strings.length] = "Rating: " + r_data[2];

  if(!(r_data[3] === ''))
    r_strings[r_strings.length] = "Attire: " + r_data[3];

  if(r_data[4] == 0)
    r_strings[r_strings.length] = "Does not serve alcohol";
  else if(r_data[4] == 1)
    r_strings[r_strings.length] = "Serves alcohol";
    // price range excluded for now

  if(r_data[6] == 0)
    r_strings[r_strings.length] = "Delivers";
  else if(r_data[6] == 1)
    r_strings[r_strings.length] = "Does not deliver";

  if(r_data[22] == 0)
    r_strings[r_strings.length] = "Does not have take-out";
  else if(r_data[22] == 1)
    r_strings[r_strings.length] = "Has take-out";

  if(r_data[7] == 0)
    r_strings[r_strings.length] = "Does not have outdoor seating";
  else if(r_data[7] == 1)
    r_strings[r_strings.length] = "Has outdoor seating";

  if(r_data[8] == 0)
      r_strings[r_strings.length] = "Does not have a drive-thru";
  else if(r_data[8] == 1)
      r_strings[r_strings.length] = "Has a drive-thru";

  if(r_data[9] == 0)
    r_strings[r_strings.length] = "Is not good for groups";
  else if(r_data[9] == 1)
    r_strings[r_strings.length] = "Is good for groups";

  if(r_data[10] == 0)
    r_strings[r_strings.length] = "Does not have TV";
  else if(r_data[10] == 1)
    r_strings[r_strings.length] = "Has TV";

  if(r_data[11] == 0)
      r_strings[r_strings.length] = "Does not have catering";
  else if(r_data[11] == 1)
      r_strings[r_strings.length] = "Has catering";

  if(r_data[12] == 0)
    r_strings[r_strings.length] = "Does not have waiter service";
  else if(r_data[12] == 1)
    r_strings[r_strings.length] = "Has waiter service";

  if(r_data[13] == 0)
    r_strings[r_strings.length] = "Is not good for kids";
  else if(r_data[13] == 1)
    r_strings[r_strings.length] = "Is good for kids";

  if(r_data[14] == 0)
    r_strings[r_strings.length] = "Does not accept credit card";
  else if(r_data[14] == 1)
    r_strings[r_strings.length] = "Accepts credit card";

  if(r_data[15] == 0)
    r_strings[r_strings.length] = "Does not take reservations";
  else if(r_data[15] == 1)
    r_strings[r_strings.length] = "Takes reservations";

  if(r_data[16] == 0)
    r_strings[r_strings.length] = "Does not have wi-fi";
  else if(r_data[16] == 1)
    r_strings[r_strings.length] = "Has wi-fi";

  if(r_data[17] == 0)
    r_strings[r_strings.length] = "Does not have happy hour";
  else if(r_data[17] == 1)
    r_strings[r_strings.length] = "Has happy hour";

  if(r_data[18] == 0)
    r_strings[r_strings.length] = "Does not have dancing";
  else if(r_data[18] == 1)
    r_strings[r_strings.length] = "Has dancing";

  if(r_data[19] == 0)
    r_strings[r_strings.length] = "Does not permit smoking";
  else if(r_data[19] == 1)
    r_strings[r_strings.length] = "Permits smoking";

  if(r_data[20] == 0)
    r_strings[r_strings.length] = "Does not permit BYOB";
  else if(r_data[20] == 1){
    r_strings[r_strings.length] = "Permits BYOB";
    if(r_data[21] == 0)
      r_strings[r_strings.length] = "Does not charge corkage";
    else if(r_data[21] == 1)
      r_strings[r_strings.length] = "Charges corkage";
  }

  if(r_data[23] == 0)
    r_strings[r_strings.length] = "Does not have a coat check";
  else if(r_data[23] == 1)
    r_strings[r_strings.length] = "Has a coat check";

  if(r_data[24] === "Parking_Street")
      r_strings[r_strings.length] = "Has street parking";
  else if(r_data[24] === "Parking_Valet")
      r_strings[r_strings.length] = "Has valet parking";
  else if(r_data[24] === "Parking_Lot")
      r_strings[r_strings.length] = "Has lot parking";
  else if(r_data[24] === "Parking_Garage")
      r_strings[r_strings.length] = "Has garage parking";
  else if(r_data[24] === "Parking_Validated")
      r_strings[r_strings.length] = "Has validated parking";

  if(r_data[25] === "Music_DJ")
      r_strings[r_strings.length] = "Has a live DJ";
  else if(r_data[25] === "Music_Karaoke")
      r_strings[r_strings.length] = "Has live karaoke";
  else if(r_data[25] === "Music_Live")
      r_strings[r_strings.length] = "Has a live music";
  else if(r_data[25] === "Music_Jukebox")
      r_strings[r_strings.length] = "Has a music jukebox";
  else if(r_data[25] === "Music_Background_Music")
      r_strings[r_strings.length] = "Has background music";

  if(!(r_data[26] === ''))
    r_strings[r_strings.length] = "Is considered " + r_data[26];
  if(!(r_data[27] === ''))
    r_strings[r_strings.length] = "Is considered " + r_data[27];
  if(!(r_data[28] === ''))
    r_strings[r_strings.length] = "Is considered " + r_data[28];

  return r_strings;
}
