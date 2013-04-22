$(function () {
  $('.edit_event input[type=submit]').remove();
  $('.edit_event input[type=button]').click(function () {
    $(this).parent('form').submit();
  });  
});

$(function () {
  $('.edit_event').submitOnCheck();
  jQuery.fn.submitOnCheck = function () {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function () {
    $(this).parent('form').submit();
  });  
  return this;
};  
});