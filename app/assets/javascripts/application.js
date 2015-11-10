// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready( function(){
  $(".button-collapse").sideNav();
  $('#message-container').animate({ scrollTop: $('#message-container')[0].scrollHeight + 100 }, 1000);
  $('.tooltipped').tooltip({delay: 50});
  var pingAfter = 2000;
  var convo = "/conversations/" + $('#convoId').html();
  var refreshId = setInterval(function() {
    $.getJSON( convo, function( data ) {
      var items = [];
      $.each(data, function(key, value) {
        var friend1 = value.friend.friend_requester_id;
        var friend2 = value.friend.friend_accepter_id;
        if(value.user_id === friend1 ){
          items.push( "<tr class=\"little-padding right-align\"><td class=\"big-padding-left blue-text bigger\">" + value.user.first_name + " said: </td>" + "<td class=\"bigger decent-padding-left blue-text\">" + value.body + "</td></tr>" );
        } else {
          items.push( "<tr class=\"little-padding\"><td class=\"big-padding-left bigger\">" + value.user.first_name + " said: </td>" + "<td class=\"bigger decent-padding-left\">" + value.body + "</td></tr>" );
        };
      });

      $('#message-container').html(items.join(""));
      $('#message-container').animate({ scrollTop: $('#message-container')[0].scrollHeight + 100 }, 1000);
    });
  }, pingAfter);

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
        $('#message-container').animate({ scrollTop: $('#message-container')[0].scrollHeight + 100 }, 1000);
      }
    });
  });

});

