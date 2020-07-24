const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cron = require('node-cron');
admin.initializeApp();


exports.onTaskCreation = functions.firestore
.document("/tasksList/{userId}/tasks/{taskId}")
.onCreate(async(snapshot,context)=>{

    console.log("Task created", snapshot.data());

    const userId = context.params.userId;

    const usersRef = admin.firestore().doc(`users/${userId}`);
    const doc = await usersRef.get();

    const androidNotificationToken = doc.data().androidNotificationToken;
    const createdTask = snapshot.data();
    
    

    var now = new Date();
    var nowIso = now.toISOString();
    var current = Date.parse(nowIso);
  

    var date = new Date(createdTask.taskDate+' '+createdTask.taskTime);
    var dateIso = date.toISOString();
    var totalMS = Date.parse(dateIso) - ( 5.5 * 60 * 60 * 1000 );

    var diff = totalMS-current;
 


    setTimeout(()=>{
        console.log("Timeout enters");
        if(androidNotificationToken){
            console.log("Inside schedule");
            sendNotification(androidNotificationToken,createdTask)
         
        } 
        else{
        console.log("No token for user, cannot send notification");
        }
       
        function sendNotification(androidNotificationToken,createdTask){
            let body;
    
            body = `Hey! It's time to do: ${createdTask.taskName}`;
    
            const message={
                notification:{body},
                token:androidNotificationToken,
                data:{recipient:userId}
            };
    
            admin.messaging().send(message).then(response=>{
                console.log("Successfully sent message",response)
            })
            .catch(error=>{
                console.log("error:",error)
            })
    
        }
    },diff)


})