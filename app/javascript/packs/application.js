
import $ from 'jquery'

if(document){
    const toggleTag = document.querySelector(".message-button")
    const mainTag = document.querySelector(".my-chat")
    const closeTag =document.querySelector(".cross")
    console.log(toggleTag)

    toggleTag.addEventListener("click", function () {
    mainTag.classList.toggle("open")
    $('html, body').animate({
                    scrollTop:0
                }, 500);
  })

    closeTag.addEventListener("click", function () {
      mainTag.classList.toggle("open")
    })
}



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

import swal from 'sweetalert';

function sweetAlertClassSelector(selector, options = {}) {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons.length > 0) { // protect other pages
    swalButtons.forEach(function(swalButton) {
      swalButton.addEventListener('click', () => {
        swal(options);
      });
    });
  }
};

sweetAlertClassSelector('.membership-request-reject', {
  title: 'Membership accepted',
  icon: "error",
  timer: 2000,
  button: false
});

sweetAlertClassSelector('.membership-request-accept', {
  title: 'Membership accepted',
  icon: "success",
  timer: 2000,
  button: false
});


sweetAlertClassSelector('.membership-request-sent', {
  title: "Membership request sent!",
  icon: "success",
  timer: 2000,
  button: false
});








