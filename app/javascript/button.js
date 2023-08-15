window.addEventListener('load', function(){
  const pullDownButtons = document.getElementsByClassName("header-icon");

  for (const pullDownButton of pullDownButtons) {
    pullDownButton.addEventListener('mouseover', function(){
      this.style.color = "green";
    });

    pullDownButton.addEventListener('mouseout', function(){
      this.style.color = "";
    });
  }
});