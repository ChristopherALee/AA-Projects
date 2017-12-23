const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UsersSearch {
  constructor (el) {
    this.$el = $(el);
    this.ul = $(el).children('ul');
    this.input = $(el).children('input');
    // debugger
    this.input.on('input', this.handleInput.bind(this));
  }
  
  handleInput() {
    this.input.each( (idx, el) => {
      // debugger
      APIUtil.searchUsers(el.value, this.renderResults.bind(this));
    });
  }
  
  renderResults(usersArray) {
    this.ul.empty();
    
    usersArray.forEach( (el) => {
      let toggle = new FollowToggle(el);
      $(this.ul).append($(`<li>@${el.username}</li>`));
      $(this.ul).append($(`<button class="follow-toggle" type="submit" name="button" data-user-id="${el.id}" data-initial-follow-state="${toggle.followState}"></button>`));
      // debugger
    });
  }
}

module.exports = UsersSearch;