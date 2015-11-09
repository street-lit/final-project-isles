$('#newComment').on('click', function () {
  $.ajax({
    url: '/comments',
    dataType: 'JSON',
    method: "POST",
    data: {
      comment: {
        body:     $('#comment_body').val(),
        post_id:  $('#comment_post_id').val(),
        blog_id:  $('#comment_blog_id').val(),
        user_id:  $('#comment_user_id').val()
      }
    },
    success: function (response) {
      $('#comment_body').val('');
      $('.list-comments').append('<li class="comments side-margin-left side-margin-right little-margin-bottom"><strong>' + response.user.first_name + ' ' + response.user.last_name + ' said:</strong> ' + response.body + '</li>');
    }
  });
});
