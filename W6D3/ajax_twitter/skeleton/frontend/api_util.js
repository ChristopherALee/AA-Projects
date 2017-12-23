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