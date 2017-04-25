$( document ).ready(function() {
  $("#body").load("/login_page");
  $("#login").on("click", function () {
    $("#body").load("/login_page");
  });
  $("#survey").on("click", function () {
    $("#body").load("/survey_page");
  });
  $("#friends").on("click", function () {
    //$("#body").load("/login_page");
  });
});
