var fixHelperModified = function(e, tr) {
  var $originals = tr.children();
  var $helper    = tr.clone();
  $helper.children().each(function(index) {
    $(this).width($originals.eq(index).width());
  });
  return $helper;
};

$(document).ready(function() {

  $( "h2 a:contains('@')" ).parent().parent().addClass("highlight");
  $( "h2 a:contains('zzz')" ).parent().parent().addClass("snooze");
  var $selector = $("[data-behavior='sortable']");

  $selector.sortable({
    helper: fixHelperModified,
    axis:   'y',
    cursor: 'move',
    items:  '[data-behavior="sortable-item"]',
    handle: ".handle",

    update: function() {
      var formData = $selector.sortable('serialize');
      formData    += '&' + $('meta[name=csrf-param]').attr('content') + '=';
      formData    += encodeURIComponent($('meta[name=csrf-token]').attr('content'));
      $.ajax({
        type:     'POST',
        data:     formData,
        dataType: 'script',
        url:      $selector.data('update-url')
      });
    }
  }).disableSelection();
});
