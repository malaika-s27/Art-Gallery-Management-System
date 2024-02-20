const topNavLinks = document.querySelectorAll('.nav-links > li');
const dropdownLinks = document.querySelectorAll('.dropdown-menu li');

topNavLinks.forEach((link) => {
  link.addEventListener('mouseover', () => {
    link.style.backgroundColor = '#8a4a58';
    link.style.cursor = 'pointer';
  });

  link.addEventListener('mouseout', () => {
    link.style.backgroundColor = 'transparent';
    link.style.cursor = 'auto';
  });
});

dropdownLinks.forEach((link) => {
  link.addEventListener('mouseover', () => {
    link.style.backgroundColor = '#8a4a58';
    link.style.cursor = 'pointer';
  });

  link.addEventListener('mouseout', () => {
    link.style.backgroundColor = 'transparent';
    link.style.color = '#8a4a58';
    link.style.cursor = 'auto';
  });
});



const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');

menuToggle.addEventListener('click', () => {
  navLinks.classList.toggle('nav-active');
});


 // Move between Login and Registration forms
 const loginForm = document.querySelector('.container-login');
 const registrationForm = document.querySelector('.container-registration');
 const signupLink = document.getElementById('signup-link');
 const loginLink = document.getElementById('login-link');
 const loginButton = document.getElementById('login-button');
 const registerButton = document.getElementById('register-button');

 signupLink.addEventListener('click', () => {
   loginForm.style.display = 'none';
   registrationForm.style.display = 'block';
 });

 loginLink.addEventListener('click', () => {
   registrationForm.style.display = 'none';
   loginForm.style.display = 'block';
 });

 loginButton.addEventListener('click', () => {
   window.location.href = 'Admin_dashboard.html';
 });

 registerButton.addEventListener('click', () => {
   window.location.href = 'Admin_dashboard.html';
 });


 var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };


/**
 * Validate form- profile
 */

document.getElementById('profile-form').addEventListener('submit', function(event) {
  if (!event.target.checkValidity()) {
      event.preventDefault();
      alert('Please check your input.');
  }
});


document.getElementById('messageForm').addEventListener('cta', function(e) {
  this.reset(); 
});

/*pokusaj validacije za login */
document.getElementById('login-button').addEventListener('click', function(event) {
  var email = document.getElementById('login-email').value;
  var password = document.getElementById('login-password').value;

  if(email === '' || password === ''){
      alert('All fields must be filled out');
      return;
  }

  if(!validateEmail(email)) {
      alert('Invalid email');
      return;
  }

  alert('Login Successful');
});

function validateEmail(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
}