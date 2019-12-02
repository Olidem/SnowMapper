
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


