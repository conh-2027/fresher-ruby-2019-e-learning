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
