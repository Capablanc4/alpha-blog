// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

//import "./controllers"
import Rails from "@rails/ujs"
Rails.start()

import "bootstrap/dist/js/bootstrap.bundle.js"
//= require pagy      // Asset Pipeline
// o
import "pagy"        // Importmap/Webpacker/Esbuild


