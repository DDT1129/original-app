 window.addEventListener('load', function(){
  const pullDownButton = document.getElementById("");

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color: green;");
  });

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color: green;");
  });

})