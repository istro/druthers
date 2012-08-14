$(function() {

  var setVote = function(event, ui) {
    $("#vote").val($('#sortable').sortable('toArray'));
  };

  $( "#sortable" ).sortable({
    create: setVote,
    stop: setVote
  });
  $( "#sortable" ).disableSelection();

  $('.save_vote').click(function(event){
    $.ajax({
      url: '/rankings/new',
      data: {
        vote: $('#sortable').sortable('toArray'),
        user_id: $('[name=user_id]').val(),
        discussion_id: $('[name=discussion_id]').val()
      },
      success: function(response){
        console.log('submitted!' + response);
        alert('Vote saved! You can update it anytime by resubmitting your preference order.');
      }
    });
    event.preventDefault();
  });

});

