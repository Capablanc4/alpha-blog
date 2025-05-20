// app/javascript/application.js
import { Application } from "@hotwired/stimulus"
import { definitionsFromDirectory } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromDirectory(context))
