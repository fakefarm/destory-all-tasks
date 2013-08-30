// How do I add a class 'highlight' to any row who's tag includes an @

$(document).ready(function(){
  $("#task-row").each(function(){
    $('#task-row').addClass("highlight");
    });
});