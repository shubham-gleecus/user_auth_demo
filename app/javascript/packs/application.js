// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap"
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


global.toastr = require("toastr")
let jQuery = require("jquery");
// import jQuery from "jquery";
global.$ = jQuery;

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});

require('admin-lte');
import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal;
import "admin-lte/dist/css/AdminLTE.css";
import "admin-lte/dist/css/skins/_all-skins.css";
import "@fortawesome/fontawesome-free/js/all";


import "../stylesheets/application"


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
