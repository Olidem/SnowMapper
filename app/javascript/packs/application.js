
import $ from 'jquery'
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import swal from 'sweetalert';

if(document){
    const toggleTag = document.querySelector(".message-button")
    const mainTag = document.querySelector(".my-chat")
    const closeTag =document.querySelector(".cross")

    if (toggleTag) { // protecting this function from trying to run on other pages
    toggleTag.addEventListener("click", function () {
    mainTag.classList.toggle("open")
    $('html, body').animate({
                    scrollTop:0
                }, 500);
    })}

    if (closeTag) { // protecting this function from trying to run on other pages
    closeTag.addEventListener("click", function () {
      mainTag.classList.toggle("open")
    })}
}


$('#message_content').keypress(function(e) {
      if(e.which == 13){
          $('.chat-submit-btn').click();
           // $(this).closest('form').submit();
           e.preventDefault();
       }
    });

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

sweetAlertClassSelector('.delete-button-link', {
  title: "Message deleted!",
  icon: "success",
  timer: 3000,
  button: false
});

initMapbox();
