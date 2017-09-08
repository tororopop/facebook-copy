$(document).on('turbolinks:load', function(){
    $('.testjsc').jscroll({
      nextSelector: '#more_link',
      contentSelector: '.jscroll-added',
    });
});
