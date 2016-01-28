var newCommentForm = function(formId) {
  return {
    element: $(formId),
    comment_body: $("#comment_body").val(),
    user_id: $("[user-info]").attr("id"),
    image_id: $("[image-id]").attr("image-id"),
  }
}
