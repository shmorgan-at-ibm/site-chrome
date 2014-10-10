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

  $('.nested-mobile-link').on('click', function(e) {
    e.preventDefault();

    var $this = $(this);

    if($this.hasClass('active')) {
      $this.toggleClass('active');
    }
    else {
      $('.nested-mobile-link').removeClass('active');
      $this.addClass('active');
    }
  });
});
