const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor (el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    // debugger
    this.render();
  
    this.$el.on('click', this.handleClick.bind(this));
  }
  
  render() {
    // debugger
    if (this.followState === false) {
      return this.$el.text("Follow");
    } else if (this.followState === true) {
      return this.$el.text("Followed");
    }
  }
  
  handleClick(event) {
    // this.$el.on('click', (event) => {
      event.preventDefault();
      
      // const buttonData = $(event.currentTarget).serialize();
      if (this.followState === false) {
        APIUtil.followUser(this.userId).then(() => this.toggleState());
      } else {
        APIUtil.unfollowUser(this.userId).then(() => this.toggleState());
      }
    // });
  }
  
  toggleState () {
    // debugger
    if (this.followState === false) {
      this.followState = true;
    } else {
      this.followState = false;
    }
    
    this.render();
  }
}

module.exports = FollowToggle;