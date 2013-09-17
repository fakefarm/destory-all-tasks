// How do I add a class 'highlight' to any row who's tag includes an @

$(document).ready(function(){
  $( "td:contains('@')" ).parent().addClass("highlight");
  $( "td:contains('zzz')" ).parent().addClass("snooze");

  var fixHelperModified = function(e, tr) {
    var $originals = tr.children();
    var $helper = tr.clone();
    $helper.children().each(function(index)
    {
      $(this).width($originals.eq(index).width())
    });
    return $helper;
  };

  $("#sortable tbody").sortable({
    helper: fixHelperModified,
    axis: 'y',
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    }
  }).disableSelection();
});

