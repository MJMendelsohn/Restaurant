$( document ).ready(function() {
  $("#body").load("/login_page");
  $("#login").on("click", function () {
    $("#body").load("/login_page");
    $("#login").addClass('active');
    $("#survey").removeClass('active');
  });
  $("#survey").on("click", function () {
    $("#body").load("/survey_page");
    $("#survey").addClass('active');
    $("#login").removeClass('active');
  });
  $("#friends").on("click", function () {
    //$("#body").load("/login_page");
  });
});
