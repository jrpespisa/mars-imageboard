$(document).ready(function() {
  $('.votes').click(function(event) {
    event.preventDefault();

    var newVote = this.id.split('-')[0];
    var iId = this.id.split('-')[1];

    var request = $.ajax({
    method: 'POST',
    url: '/images/' + iId + '/votes',
    data: { newVote: newVote, iId: iId }
    });

    request.done(function(response) {
      var upvoteText = 'Upvote';
      var downvoteText = 'Downvote';

      if (response.upvotes != 1)
        upvoteText = 'Upvotes';
      if (response.downvotes != 1)
        downvoteText = 'Downvotes';

      $('#upvote-' + iId)
        .attr('value', response.upvotes + ' ' + upvoteText);
      $('#downvote-' + iId)
        .attr('value', response.downvotes + ' ' + downvoteText);
    });
  });
});
