
import $ from 'jquery'

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

$('#message_content').keypress(function(e) {
      if(e.which == 13){
           $(this).closest('form').submit();
           e.preventDefault();
       }
    });

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#membership-request-accept', {
  title: 'Membership accepted',
  icon: "success",
  timer: 2000,
  button: false
});

initSweetalert('#membership-request-reject', {
  title: "Membership rejected",
  icon: "error",
  timer: 2000,
  button: false
});


