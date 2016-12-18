$(function() {
  $('.cells td')
    .on('click', '.black', function() {
      $(this).removeClass('black');
      $(this).addClass('white');
    })
    .on('click', '.white', function() {
      $(this).removeClass('white');
      $(this).addClass('black');
    });
})