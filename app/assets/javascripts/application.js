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

$(window).load(function () {
  $('ul.activities li').click(function(){
    $('ul.activities li.active').removeClass('active');
    $(this).addClass('active');
    load_data
  })
});

function load_data(url){
  $.ajax({
    url: url,
    context: document.body
  }).done(function() { 
    // $(this).addClass("done");
    // update actual activity
    $("figure span#calories_burned em").text('22');
    $("figure span#latest_start em").text('22');
    $("figure span#latest_distance em").text('22');
  });
}