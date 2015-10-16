// TODO: turbolinksも考慮する
$(document).ready(function() {
  $('.popup-without-data-options').withPopup({
    windowOpenOption: 'width=300, height=200, menubar=no, toolbar=no, scrollbars=yes',
  });

  $('.popup-with-data-options').withPopup();
});