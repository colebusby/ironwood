$(document).ready(function(){
  var d = new Date();
  var current_year = "#" + d.getFullYear().toString();
  $(current_year).show();
  $(".year_links").on("click", function(event){
    event.preventDefault();
    $(this).parent().parent().find(".meetings").slideToggle();
  });
});