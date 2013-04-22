$(function () {

 $('.edit_diary').remove();

 $('.edit_diary').click(function () {

   $(this).parent('form').submit();

 });  
});