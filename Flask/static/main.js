$( document ).ready(function() {
  $("#body").load("/login_page");
  $("#login").on("click", function () {
    $("#body").load("/login_page");
    $("#login").tab("show");
  });
  $("#survey").on("click", function () {
    $("#body").load("/survey_page");
    $("#survey").tab("show");
  });
  $("#friends").on("click", function () {
    //$("#body").load("/login_page");
  });
});
