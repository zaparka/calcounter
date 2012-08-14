// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
var months = ['January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December'];

$(window).load(function () {
  $('ul.activities li').click(function(){
    $('ul.activities li.active').removeClass('active');
    $(this).addClass('active');
    value = $(this).attr('id')
    load_data(value)
  })
});

function load_data(id){
  $.ajax({
    url: '/activities/'+id
  }).done(function(response) {
    $("figure span#calories_burned em").text(response.calories);
    var date = new Date(response.start_time * 1000);
    $("figure span#latest_start em").text(days[date.getDay()] + " " + date.getDate() +". "+ months[date.getMonth()] +" "+ date.getFullYear());
    $("figure span#latest_distance em").text(response.total_distance / 1000);
  });
}