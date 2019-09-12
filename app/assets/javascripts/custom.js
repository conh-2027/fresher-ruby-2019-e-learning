$(document).on('click', '#sidebarToggle', function(){
  let body = $('body');
  if (body.hasClass('sidebar-toggled')) {
    body.removeClass('sidebar-toggled');
    $('#accordionSidebar').removeClass('toggled');
  } else {
    body.addClass('sidebar-toggled');
    $('#accordionSidebar').addClass('toggled');
  }
  return false;
});

$(document).on('click', '.remove_field_answer', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).parent().hide();
  return event.preventDefault();
});

$(document).on('click', '.add_field_answer', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});
