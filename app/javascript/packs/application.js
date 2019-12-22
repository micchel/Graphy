/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'
import '../src/application.scss'

const images = require.context('../images/', true)
import '../src/js/avatar-upload.js';
import '../src/js/portfolio-upload.js';
import '../src/js/portfolio-edit.js';
import '../src/js/jquery.jTinder.js';
import '../src/js/jquery.transform2d.js';
import '../src/js/jTinder-slide.js';

require("channels");

require("@rails/ujs").start()