$(function() {

// saving the default order upon rendering options
  $( "#sortable" ).sortable({
    create: function(event, ui) {
      $("#vote_").val($('#sortable').sortable('toArray'));
    }
  });

// saving order upon rearranging options
  $( "#sortable" ).sortable({
    stop: function(event, ui) {
      $("#vote_").val($('#sortable').sortable('toArray'));
    }
  });

});

