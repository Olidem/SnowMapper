import $ from 'jquery'

import PopperJs from "popper.js";
import "bootstrap";

import 'slick-carousel'
// import 'slick-carousel/slick/slick.css'
// import 'slick-carousel/slick/slick-theme.css'

// $(document).ready(function(){
//   // $('.country-carousel').slick({
//   // });

//   // $('.country-carousel').slick();
//   $('.country-carousel').slick({
//     infinite: true,
//     slidesToShow: 3,
//     slidesToScroll: 3
//   });

// });


import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// Activating all popovers
$(function () {
  $('[data-toggle="popover"]').popover()
})

console.log("Ross is drunk")
