$(document).on('ready page:load', function() {
  $(document).delegate('[data-with-popup=true]', 'click.withPopup', function(e) {
    var options = $(this).data();
    window.open(options.withPopupSrc, 'withPopup', options.withPopupFeatures);
  });
});
