// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "popper"
import "bootstrap"
import "./utils/sidebars"
import Rails from '@rails/ujs';

Rails.start();
