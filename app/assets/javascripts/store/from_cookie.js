var App = App || {};

App.isNumeric = function(input) {
  return (input - 0) == input && input.length > 0;
};

App.fromCookie =  {

  updateDom: function(){
    var currentUserId = $.cookie('current_user_id'),
      cartPreview = decodeURIComponent($.cookie('preview_cart'));

    if(App.isNumeric(currentUserId)){
      $('#user-logout').show();
      $('#with-account-paths').show();
      $('#user-login').hide();
      $('#without-account-paths').hide();
    } else {
      $('#user-logout').hide();
      $('#with-account-paths').hide();
      $('#user-login').show();
      $('#without-account-paths').show();
    }

    if (cartPreview)
      $('#cart-dropdown').html(cartPreview);
  }
};

$(function(){
  App.fromCookie.updateDom();
});
