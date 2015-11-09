$('#newObservation').on('click', function () {
  $.ajax({
    url: '/observations',
    dataType: 'JSON',
    method: "POST",
    data: {
      observation: {
        body:     $('#observation_body').val(),
        photo_id:  $('#observation_photo_id').val(),
        album_id:  $('#observation_album_id').val(),
        user_id:  $('#observation_user_id').val()
      }
    },
    success: function (response) {
      $('#observation_body').val('');
      $('.list-observations').append('<li class="observations side-margin-left side-margin-right little-margin-bottom"><strong>' + response.user.first_name + ' ' + response.user.last_name + ' said:</strong> ' + response.body + '</li>');
    }
  });
});
