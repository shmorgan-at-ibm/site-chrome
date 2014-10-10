$(document).ready(function() {
  $('.mobile-nav-toggle').on('click', function(e) {
    e.preventDefault();

    $('body').toggleClass('mobile-nav-open');
  });

  $('.mobile-link').on('click', function(e) {
    e.preventDefault();

    $('.mobile-link').removeClass('active');
    $(this).addClass('active');
  });
});
