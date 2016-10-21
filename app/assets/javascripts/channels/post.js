App.post = App.cable.subscriptions.create("PostChannel", {
  connected: function() {
    console.log("connected");
  },
  disconnected: function() {
    console.log("disconnected");
  },
  received: function(data) {
    console.log(data.message);
    $("#like" + data.message.post_id.toString()).html(data.message.count.toString());

  },
  like: function() {
    return this.perform('like');
  },
  comment: function() {
    return this.perform('comment');
  }
});
