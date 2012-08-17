$(function() {
  var setVote = function(event, ui) {
    $("#vote").val($('#sortable').sortable('toArray'));
  };

  $( "#sortable" ).sortable({
    create: setVote,
    stop: setVote
  });

  $( "#sortable" ).disableSelection();


// Regularly updating solutions, to avoid incomplete ballots
//--------------------------------------------------------

  var currentSolutions = function(){
    var kids = $("#sortable").children();
    ids = []
    kids.each(function(i, child){
      ids.push(child.id)
    })
    return ids
  };

  var appendNewSolutions = function(response){
    console.log('appending')
    $("#sortable").append(response)
  };

  var solutionCheck = function(){
    console.log("checking for solutions...")

    $.ajax({
      type: 'PUT',
      url: window.location.pathname,
      data: {page: currentSolutions},
      complete: function(){
        console.log("completed solutionCheck")
      },
      error: function(){
        console.log("error")
      },
      success: appendNewSolutions
    });

  }

  window.setInterval(solutionCheck, 3000)


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
        $("#new_solution").remove();
        alert('Vote saved! You can update it anytime by resubmitting your preference order.');
      }
    });
    event.preventDefault();
  });

  $( "#tabs" ).tabs({});
});
