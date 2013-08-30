// How do I add a class 'highlight' to any row who's tag includes an @

$(document).ready(function(){
  $( "td:contains('@')" ).parent().addClass("highlight");
});

