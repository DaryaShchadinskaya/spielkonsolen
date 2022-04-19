// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

//= require jquery_ujs
//= require select_all.js

$(function() {
  $("#selectAll").select_all();
});