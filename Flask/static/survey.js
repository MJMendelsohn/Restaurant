
$( document ).ready(function() {
    $("#submit").on("click", function () {
        $.post("/survey", $("#form").serialize(),
                function(dataFromServer) {
                  if(dataFromServer.length==0) {
                    $("#main").load("/restaurant_page", function () {
                      $("#restaurant").text("No restaurant found");
                    });
                  }
                  else {
                    $("#main").load("/swipe", function () {
                        createSwipe(dataFromServer);
                    });
                  }

                    //server sent a response now do whatever you want to do after form has been submitted
                    //or submit form regular way $("#IdOfMyForm").submit();
                }, "json");


        return false;
    });
});
