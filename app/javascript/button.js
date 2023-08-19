window.addEventListener('load', function(){
  const pullDownButtons = document.getElementsByClassName("header-icon");
  const buttons = document.querySelectorAll(".lists-right li, .new-memo, .actions-button");
  const memolinks = document.querySelectorAll(".memo-link");

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

  memolinks.forEach(function(memolink) {
    memolink.addEventListener('mouseover', function() {
      this.setAttribute("style", "transform: scale(1.1);");
    });
    memolink.addEventListener('mouseout', function() {
      this.removeAttribute("style", "none");
    });
  });

  const memo_buttons = document.querySelectorAll(".memo-edit, .check-in-destroy, .memo-check-yes");
  memo_buttons.forEach(function(memo_button) {
    memo_button.addEventListener('mouseover', function() {
      this.setAttribute("style", "color: orange;");
    });
    memo_button.addEventListener('mouseout', function() {
      this.removeAttribute("style", "none");
    });
  });
});