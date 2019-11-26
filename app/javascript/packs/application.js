import "bootstrap";
import $ from 'jquery'
import 'slick-carousel'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'

$(document).ready(function(){
  // $('.country-carousel').slick({
  // });

  // $('.country-carousel').slick();
  $('.country-carousel').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });

});
