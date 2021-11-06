importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js");
firebase.initializeApp({
        apiKey: "AIzaSyB9hSljejoRkbNVtF8d5JTm4GN68mUvvRg",
        authDomain: "userthai2d3d.firebaseapp.com",
        databaseURL: "https://userthai2d3d-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "userthai2d3d",
        storageBucket: "userthai2d3d.appspot.com",
        messagingSenderId: "1097181536705",
        appId: "1:1097181536705:web:d9f5a836335375bfa44f40",
        measurementId: "G-ZHT96D5787"
});
const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});