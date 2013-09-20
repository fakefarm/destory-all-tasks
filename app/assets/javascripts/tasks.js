var fixHelperModified = function(e, tr) {
  var $originals = tr.children();
  var $helper    = tr.clone();
  $helper.children().each(function(index) {
    $(this).width($originals.eq(index).width());
  });
  return $helper;
};

$(document).ready(function() {

  $( "td:contains('@')" ).parent().addClass("highlight");
  $( "td:contains('zzz')" ).parent().addClass("snooze");
  $('#punt').click(function(){
    $(this).parent().addClass("urgent").fadeOut();
  });

  var $selector = $("[data-behavior='sortable']");

  $selector.sortable({
    helper: fixHelperModified,
    axis:   'y',
    cursor: 'move',
    items:  '[data-behavior="sortable-item"]',

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
