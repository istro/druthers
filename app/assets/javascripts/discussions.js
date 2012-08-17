$(function() {
  var setVote = function(event, ui) {
    $("#vote").val($('#sortable').sortable('toArray'));
  };

  $( "#sortable" ).sortable({
    create: setVote,
    stop: setVote
  });

  $( "#sortable" ).disableSelection();


// Regularly updating page to avoid incomplete ballots, update page when voting starts
//------------------------------------------------------------------------------------

  var currentSolutions = function(){
    var kids = $("#sortable").children();
    ids = []
    kids.each(function(i, child){
      ids.push(child.id)
    })
    return ids
  };

  var prependNewSolutions = function(response){
    console.log('prepending')
    $("#sortable").prepend(response)
    if (!$.isEmptyObject(response)) {
      $('.ballot_div').css('display', 'block')
    }
  };

  var solutionCheck = function(){
    console.log("checking for solutions...")

    $.ajax({
      type: 'PUT',
      url: window.location.pathname,
      data: {
        page: currentSolutions,
        },
      error: function(){
        console.log("error")
      },

      success: function(response){
        var new_additions = $(response).find('.new_addition')
        new_additions.each( function(i, addition) {
          prependNewSolutions(addition)
        })
        var votableyet = $(response).find('.votableyet').css('display')
        if (votableyet == 'none') {
          $('.save_vote').show();
          $("#new_solution").css('display', 'none')
          $('.open_voting').css('display', 'none');
        }
      },

      complete: function(){
        console.log("completed solutionCheck")
      },
    });
  }

  window.setInterval(solutionCheck, 300)

// Saving rankings w/o refreshing.
//----------------------------------------------------------------

  $('.save_vote').click(function(event){
    $.ajax({
      url: '/rankings/new',
      data: {
        vote: $('#sortable').sortable('toArray'),
        user_id: $('[name=user_id]').val(),
        discussion_id: $('[name=discussion_id]').val()
      },
      success: function(response){
        $("#tabs-2").html(response)
        alert('Vote saved! You can update it anytime by resubmitting your preference order.');
      }
    });
    event.preventDefault();
  });

  $('.open_voting').click(function(event){
    $.ajax({
      url: '/votable',
      data: {
        discussion_id: $('[name=discussion_id]').val()
      }
    });
  });

  $( "#tabs" ).tabs({
  });
});
