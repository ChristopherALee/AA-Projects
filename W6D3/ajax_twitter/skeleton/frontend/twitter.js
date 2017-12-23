const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require("./users_search.js");

$ (document).ready(function () {
  const buttons = $('button');
  
  buttons.each( (idx, el) => {
    let currentButton = new FollowToggle(el);

    if (currentButton.followState) {
      $(el).text('Followed');
    } else {
      $(el).text('Follow');
    }
  });
  
  const userSearch = $('.users-search');
  
  userSearch.each ( (idx, el) => {
    let search = new UsersSearch(el);
  });
});

