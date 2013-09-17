  var fixHelperModified = function(e, tr) {    // what is the e for?
    var $originals = tr.children();
    var $helper = tr.clone();                  // what's a way to pry into code like this to understand what's happening?
    $helper.children().each(function(index)
    {
      $(this).width($originals.eq(index).width())
    });
    return $helper;
  };

$(document).ready(function(){
  $( "td:contains('@')" ).parent().addClass("highlight");
  $( "td:contains('zzz')" ).parent().addClass("snooze");

  $("#sortable tbody").sortable({
    helper: fixHelperModified,
    axis: 'y',
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize')) // I have no idea what this code is doing.
    }                                                                   // Goal is to fire task#sort but doesn't seem to
                                                                        // be calling that method
  }).disableSelection();  // What does this do? I didn't find it on Jquery ui
});

