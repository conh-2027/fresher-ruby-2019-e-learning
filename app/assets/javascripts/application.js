//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .
//= require_directory "../../../vendor/assets/javascripts"

$(document).ready(function(){
  if($("#data-hidden").data("time-remaining")){
      time_remaining($("#data-hidden").data("time-remaining"))
  }
})
