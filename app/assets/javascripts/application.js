// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function checkEmptyContainers() {
  if ($("#incompleted .task-wrapper")[0].childElementCount == 0) {
    if (!$("#incompleted").hasClass("hide")) {
      $("#incompleted").addClass("hide");
    }
  } else {
    if ($("#incompleted").hasClass("hide")) {
      $("#incompleted").removeClass("hide");
    }
  }

  if ($("#completed .task-wrapper")[0].childElementCount == 0) {
    if (!$("#completed").hasClass("hide")) {
      $("#completed").addClass("hide");
    }
  } else {
    if ($("#completed").hasClass("hide")) {
      $("#completed").removeClass("hide");
    }
  }
};