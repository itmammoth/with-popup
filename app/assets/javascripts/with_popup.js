(function($){
  var methods = {
    init: function(options) {
      return this.each(function() {
        var $this = $(this),
            data = $this.data('withPopup');

        if (!data) {
          defaultOptions = {
            windowOpenOption: '',
          }
          settings = $.extend({}, defaultOptions, options);
          mergeDataOptions($this, settings);

          $this.on('click.withPopup', openPopup);
          $this.data('withPopup', {
            target: $this,
            settings: settings,
          });
        }
      });
    },
   };

   $.fn.withPopup = function(method) {
    if (methods[method]) {
      return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
    } else if (typeof method === 'object' || !method) {
      return methods.init.apply(this, arguments);
    } else {
      $.error('Method ' +  method + ' does not exist on jQuery.withPopup');
    }
  };

  var openPopup = function(e) {
    var option = $(this).data('withPopup').settings.windowOpenOption;
    window.open('', 'withPopup', option);
  };

  var mergeDataOptions = function($el, settings) {
    if ($el.data('popupOption')) {
      settings.windowOpenOption = $el.data('popupOption');
    }
  };
})(jQuery);