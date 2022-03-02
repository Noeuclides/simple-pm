import consumer from "./consumer"

consumer.subscriptions.create("WebNotificationsChannel", {

    connected() {
        console.log("Conectado!")
    },

    received(data) {
        console.log("HOLAAAAA")
        new Notification(data["title"], { body: data["body"] })
    }
})
