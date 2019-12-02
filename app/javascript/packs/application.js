
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




const toggleTag = document.querySelector(".message-button")
const mainTag = document.querySelector(".my-chat")

//when toggle tag is clicked, toggle a class of open on the main tag
// if its open make the toggle tag say close
// if if not make the toggle tag say menu
toggleTag.addEventListener("click", function () {
  mainTag.classList.toggle("open")

  // if (mainTag.classList.contains("open")) {
  //   toggleTag.innerHTML = `<img src="close.svg">Close`
  // } else {
  //   toggleTag.innerHTML = `<img src="menu.svg">Menu`
  // }
})





