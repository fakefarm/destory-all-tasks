// load the document
$(function(){

// Set the variables
  var time = 0
  , $element = $('[data-timer]') // note instead of referencing ids, use data attributes instead
  , timer
  , $holder = $('[data-log]');


// DOM manipulation functions
  function setTime(t){
    $element.text(t);
  }

  function totalTime(t){
    $holder.text(t);
  }

// Event based functions
  $(document).click('click', "[data-behavior='start']", function(event) {
    event.preventDefault();
    timer = setInterval(function(){
      time = time + 1;
      setTime(time);
    }, 1000);
  });

  $('[data-behavior="stop"]').click(function(event){
    event.preventDefault();
    clearInterval(timer);
  });

  $('[data-behavior="record"]').click(function(event){
    event.preventDefault();
    totalTime(time);
  });
});
