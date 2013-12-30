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
    handle: ".task-handle",

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

  var tags = $('.tag-bar');
  var mytime = 0;
  var item, entry;
  var items = [];
  var budget = 0;

  for (var i = 0; i < tags.length; i ++) {

    item = (tags[i].text);
    if (item.indexOf('$') >= 0) {
      budget += parseInt(item.slice(1));
    }
    else{
      item = parseInt(tags[i].text);
      if ( isNaN(item) ){
        console.log(item);
        items.push(item)
      }
      else {
        entry = tags[i].text;
        if (entry.indexOf('m') >= 0) {
          mytime += item;
        } else if (entry.indexOf('h') >= 0) {
            mytime += (item * 60);
        }
      }
    }
  };

  mytime = mytime / 60;
  mytime = mytime.toPrecision(2);
  var reader;

  if (mytime == 0) {
    reader = "";
  } else if (mytime < 0.26 ) {
    reader = "about 15 minutes";
  } else if (mytime < 0.51) {
    reader = "about half an hour";
  } else if (mytime < 0.90) {
    reader = "under an hour";
  } else if (mytime < 1.24) {
    reader = "about an hour";
  } else {
    reader = "about " + mytime + " hours";
  }

  if (budget == 0){
    budget = '';
  }
  else {
    budget = '$' + budget;
  }

  $('.time-total').append(reader);
  $('.budget-total').append(budget);

  $('[data-task=item]').click(function(e){
    e.preventDefault();
    var $note = $(this).parents('.task-wrapper').children('.m-task-note')
    $('.m-task-note').slideUp();
    if ($note.is(':hidden')) {
      $note.slideDown();
    }
  });
});
