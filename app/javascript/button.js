window.addEventListener('load', function(){
  const pullDownButtons = document.getElementsByClassName("header-icon");
  const buttons = document.querySelectorAll(".lists-right li");

  for (const pullDownButton of pullDownButtons) {
    pullDownButton.addEventListener('mouseover', function(){
      this.style.color = "green";
    });

    pullDownButton.addEventListener('mouseout', function(){
      this.style.color = "";
    });
  }

  buttons.forEach(function(button) {
    button.addEventListener('mouseover', function() {
      this.setAttribute("style", "transform: scale(1.2);");
    });
    button.addEventListener('mouseout', function() {
      this.removeAttribute("style", "none");
    });
  });

});