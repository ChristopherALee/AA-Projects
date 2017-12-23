class Router {
  constructor (node) {
    this.node = node;
  }
  
  start() {
    this.render();
    window.addEventListener("hashchange", (e) => {
      this.render();
    });
  }
  
  activeRoute() {
    const hashFragment = window.location.hash;
    return hashFragment.slice(1);
  }
  
  render() {
    this.node.innerHTML = "";
    const currentRoute = this.activeRoute();
    const newRoute = document.createElement('p');
    newRoute.innerHTML = currentRoute;
    this.node.appendChild(newRoute);
  }
}

module.exports = Router;