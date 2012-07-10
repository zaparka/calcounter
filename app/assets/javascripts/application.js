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
//= require_tree .
//= require jquery.countdown
//= require jcarousellite1.0.1_min.js
//= require ember-0.9.8.1.min.js

var App = Em.Application.create();

// view
App.MyView = Em.View.extend({
  mouseDown: function(event) {
    console.log(event.target.getAttribute('id'));
    person = Person.create({id: 123});
  }
});

// model
Person = Ember.Object.extend({
  say: function(thing) {
    console.log(thing + " " + person.id)
 }
});