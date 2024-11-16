importScripts("https://www.gstatic.com/firebasejs/7.5.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.5.0/firebase-messaging.js");
firebase.initializeApp({
    apiKey: "AIzaSyCfDWsnyIbnWOb_qFZnS6O-6JeSS02FLPw",
    appId: "1:257454421788:web:2e20146146beec2717ecd9",
    messagingSenderId: "257454421788",
    projectId: "zzekakproject",
    authDomain: "zzekakproject.firebaseapp.com",
    storageBucket: "zzekakproject.appspot.com",
    measurementId: "G-LQFW9MPZPR",
    databaseURL: "DATABASE_URL",
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
