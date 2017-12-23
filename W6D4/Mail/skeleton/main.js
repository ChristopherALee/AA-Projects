const Router = require('./router.js');

document.addEventListener("DOMContentLoaded", (e) => {
  const queryArray = Array.from(document.querySelectorAll(".sidebar-nav li"));
  queryArray.forEach( (node) => {
    node.addEventListener("click", (e) => {
      let newLocation = e.currentTarget.innerText.toLowerCase();
      window.location.hash = newLocation;
  });
  
  const contentNode = document.querySelector(".content");
  const router = new Router(contentNode);
  router.start();
  });
});