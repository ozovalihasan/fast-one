import consumer2 from "./consumer"

consumer2.subscriptions.create({channel: "RoomChannel2", room_id: 2}, {
  connected() {
    console.warn("connected 222" )
    console.warn(consumer2.subscriptions)

    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.warn(data);
  }
});
