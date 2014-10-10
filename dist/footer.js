$(document).ready(function() {
  $('#ibm-cookie-preferences-link, #ibm-close-cookie-overlay').on('click', function() {
    $('#ibm-cloud-cookie-overlay').toggleClass('open');
  });
});
