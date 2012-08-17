$(function() {

  $('.add_solution').click(function(event){
    $.ajax({
      url: '/addsolution/',
      data: {
        user_id: $('[name=user_id]').val(),
        solution: $('#solution_text').val(),
        discussion_id: $('[name=discussion_id]').val()
      },
      success: function(){
        $('#solution_text').val('');
      }
    });
    event.preventDefault();
  });
});