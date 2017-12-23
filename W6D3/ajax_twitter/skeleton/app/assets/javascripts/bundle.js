/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

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



/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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

/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'json',
    }
    );
  },
  
  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'json',
    });    
  },
  
  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      data: { query: queryVal },
      dataType: 'json',
      success: success,
    });
  }
  
};

module.exports = APIUtil;

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map