$(document).ready(function() {
  $("#comment-form").click(function(event) {
    event.preventDefault();

    var requestHelper = function(formInfo) {
      var formInfo = newCommentForm("form#new-comment");

      var request = $.ajax({
        method: "POST",
        url: "/api/v1/comments",
        data: {
          comment: {
            body: formInfo.comment_body,
            user_id: formInfo.user_id,
            image_id: formInfo.image_id
          }
        }
      });
      request.done(function(response) {
        var commentAppender = function(comment) {
          $(".comments-empty").remove();
          if (commentsLabel.null === false ) {
            $("body").append(commentsLabel)
          }
          $(".comment-box").append(comment);
        };

        var commentsLabel = "<div class='comments-label'>Comments:</div>"
        var name = response.user.first_name + " " + response.user.last_name
        var body = formInfo.comment_body
        var edit = "/images/" + formInfo.image_id + "/comments/" + response.id + "/edit"
        var destroy = "/images/" + formInfo.image_id + "/comments/" + response.id
        var styleComment =
        "<div class='comment-wrapper'>" +
          "<div class='comment-actions'>" +
            "<li>" + "<a class='link'" + "href=" + edit + ">" + "Edit Comment" + "</a>" + "</li>" +
              "<li>" + "<a data-method='delete'" + "class='link delete-comment'" + "href=" + destroy + ">" + "Delete Comment" + "</a>" + "</li>" +
          "</div>" +
          "<li>" + name + "</li>" +
          "<li>" + body + "</li>" +
        "</div>";
        commentAppender(styleComment);
      });
    };
    requestHelper();
  });
});
