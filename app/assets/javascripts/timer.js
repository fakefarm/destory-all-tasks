function check_timer(){
   if($('#timer').hasClass('start')){
    $('#counterSec').fadeOut(500).html(0).fadeIn(500);
    $('#counterMin').fadeOut(500).html(0).fadeIn(500);
    $('#counterHour').fadeOut(500).html(0).fadeIn(500);
    $('#timer').val("Stop Timer");
    timer = setInterval ( "increaseCounter()", 1000 );
    $('#timer').removeClass('start');
   }
   else{
    if(typeof timer != "undefined"){
     clearInterval(timer);
    }
    $('#timer').val("Start Timer");
    $('#timer').addClass('start');
   }
  }

  function increaseCounter(){
   var secVal ;
   var minVal ;
   secVal = parseInt($('#counterSec').html(),10);
   minVal = parseInt($('#counterMin').html(),10);
   if(secVal != 59)
   $('#counterSec').html((secVal+1));
   else{
    if(minVal != 59){
     $('#counterMin').html((minVal+1));
    }
    else{
     $('#counterHour').html((parseInt($('#counterHour').html(),10)+1));
     $('#counterMin').html(0);
    }
    $('#counterSec').html(0);
   }
  }

$(function(){
  $('#timer').click(function(event){
    event.preventDefault;
    check_timer();
  });
});

