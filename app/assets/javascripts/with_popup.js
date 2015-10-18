(function($){
  $(document).delegate('[data-with-popup=true]', 'click.withPopup', function(e) {
    window.open('', 'withPopup', $(this).data('withPopupFeatures'));
  });
})(jQuery);
