import consumer from './consumer'

$(window).on('load',function() {
  if(document.URL.match(/\/.+chat_rooms\/\d+/)) {
    var room_id = gon.chatroom_id;
    var chatChannel = consumer.subscriptions.create({ channel: "ChatroomChannel", room_id: room_id }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        $('.messages').append(data['content']);
      },
      speak: function(message) {
        return this.perform('speak', {
          room_id: room_id,
          user_id: $('meta[name="current_user_id"]').attr('content'),
          photographer_id: $('meta[name="current_photographer_id"]').attr('content'),
          message: message
        });
      }
    });
    $(document).on('click', '#message_submit', function(event) {
      var text = $(this).prev();
      if ($.trim(text.val()).length > 1) {
        chatChannel.speak(text.val());
        text.val('');
        $('.messages').animate({scrollTop:$('.messages')[0].scrollHeight});
        return event.preventDefault();
      }
    });
    $('.messages').animate({scrollTop:$('.messages')[0].scrollHeight});
  }
});
