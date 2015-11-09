$(document).ready( function(){
  $('#message-container').animate({ scrollTop: $('#message-container')[0].scrollHeight + 100 }, 1000);

  var pingAfter = 3000;
  var convo = "/conversations/" + $('#convoId').html();
  var refreshId = setInterval(function() {
    $.getJSON( convo, function( data ) {
      var items = [];
      $.each(data, function(key, value) {
        items.push( "<tr><td>" + value.user.first_name + " said: </td>" + "<td>" + value.body + "</td></tr>" );
      });

      $('#message-container').html(items.join(""))
    });
  }, pingAfter);



  // var pingAfter = 3000;
  // var convo = "/conversations/" + $('#convoId').html();
  // var refreshId = setInterval(function() {
  //   $.ajax({
  //     url: convo,
  //     dataType: 'JSON',
  //     method: 'GET',
  //     data: {
  //       message: {
  //         body:
  //         friend_id:
  //       }
  //     }
  //   });
  // }, pingAfter);

  $('#newMessage').on('click', function () {
    $.ajax({
      url: '/messages',
      dataType: 'JSON',
      method: 'POST',
      data: {
        message: {
          body:      $('#message_body').val(),
          friend_id:   $('#message_friend_id').val(),
          conversation_id: $('#message_conversation_id').val(),
          user_id:   $('#message_user_id').val()
        }
      },
      success: function (response, users) {
        $('#message_body').val('');
        $('tr').last().parent().append('<tr><td> ' + response.user.first_name + ' said:</td><td>' + response.body +'</trd></tr>');
        $('#message-container').animate({ scrollTop: $('#message-container')[0].scrollHeight + 100 }, 1000);
      }
    });
  });

});
