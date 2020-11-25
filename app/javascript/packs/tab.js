if(typeof jQuery != "undefined"){ 
  $(function(){
    
    $('.tabs_item').on('click', function () {
      $('.active').removeClass('active');
      $(this).addClass('active');
    })

  })
}