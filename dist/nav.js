$(document).ready(function() {
  $('.mobile-nav-toggle').on('click', function(e){
    e.preventDefault();

    $('body').toggleClass("mobile-nav-open");
  });
});
