var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementsByTagName("header")[0].style.top = "0";
  } else {
    document.getElementsByTagName("header")[0].style.top = "-50px";
  }
  prevScrollpos = currentScrollPos;
}
