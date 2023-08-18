window.addEventListener('load', function(){

  const articles = document.querySelectorAll(".frog-jamp-image");
  
  articles.forEach(function(article) {
    article.addEventListener('mouseover', function() {
      this.setAttribute("style", "transform: rotate(15deg);");
    });
    article.addEventListener('mouseout', function() {
      this.removeAttribute("style", "none");
    });
  });
})