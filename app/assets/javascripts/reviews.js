$(document).on('ready page:load', function() {
  $('.range').each(function() {
    var $rangeInput = $(this).find('.range__input');
    var $rangeValue = $(this).find('.range__value');
    $rangeValue.text($rangeInput.value);

    $rangeInput.on('input', function(event) {
      $rangeValue.text(event.target.value);
    });
  });
});
