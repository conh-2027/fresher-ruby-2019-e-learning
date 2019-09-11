let  interval;
function set_time(seconds, minutes){
  $('#minutes').html(minutes);
  $('#seconds').html(seconds);
}
function time_remain(total_in_seconds){
  console.log(total_in_seconds);
  if (total_in_seconds > 0) {
    $('[type="submit"]').remove();
    set_time(0, 0);
    clearInterval(interval);
  } else if (total_in_seconds == 0) {
    $('form').submit();
    set_time(0, 0);
    clearInterval(interval);
  } else if (total_in_seconds > 0) {
    minutes = Math.floor(total_in_seconds / 60);
    seconds = total_in_seconds % 60;
    set_time(seconds, minutes)
  } else {
    clearInterval(interval);
  }
  return;
}

let ready_var = function () {
  total_time_remain = $('#time-remain').data('time-remain');
  time_remain(total_time_remain);
  clearInterval(interval);
  let interval = setInterval(function() {
    time_remain(total_time_remain--)
  }, 1000);

  if (document.getElementById('submit-answer') == null) {
    clearInterval(interval);
    set_time(0, 0)
  }
}

$(document).ready(ready_var);
$(document).on('page:load', ready_var);
