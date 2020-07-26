const functions = require("firebase-functions");
const admin = require("firebase-admin");

const moment = require('moment');
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
    
    
    if(createdTask.remindMe ==true){
        
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
}

});

exports.onMedCreation = functions.firestore
.document('/medsList/{userId}/meds/{medId}')
.onCreate(async(snapshot,context)=>{

    console.log('Med Created: ', snapshot.data());

    const userId = context.params.userId;

    const medsRef = admin.firestore().doc(`/users/${userId}`);
    const doc = await medsRef.get();

    const androidNotificationToken = doc.data().androidNotificationToken;
    const medCreated = snapshot.data();

    if(medCreated.medTaken == false){

    var now = new Date();
    var nowIso = now.toISOString();
    var current = Date.parse(nowIso);
    

    duration = medCreated.medDuration;
    var startDate = medCreated.medStartDate;

    while(duration!=0){
        console.log('Duration',duration);
    for(let i=0;i< medCreated.medTimePeriods.length;i++){
        console.log('I is ',i);
        functionSet(i);
    }
   
    duration--;
   
    var new_date = moment(startDate, "YYYY-MM-DD").add(medCreated.medInterval, 'days');
    var day = new_date.format('DD');
    var month = new_date.format('MM');
    var year = new_date.format('YYYY');
    startDate = year + '-' + month + '-' + day; 
    console.log('Start date ',startDate);   

    }

    }

    function functionSet(i){
        
        var date = new Date(startDate+' '+ medCreated.medTimePeriods[i]);
        var dateIso = date.toISOString();
        var totalMS = Date.parse(dateIso) - ( 5.5 * 60 * 60 * 1000 );
    
        let diff = totalMS - current;
        console.log("current :" ,current);
        console.log("totalms:" ,totalMS);
        console.log("Diff :" ,diff);
       
         setTimeout(()=>{
            
            if(androidNotificationToken){
               
              sendNotification(androidNotificationToken,medCreated)
             
            } 
            else{
            console.log("No token for user, cannot send notification");
            }
           
            function sendNotification(androidNotificationToken,medCreated){
                let body;
        
                body = `Hey! Take this medicine: ${medCreated.medName}`;
        
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
    
        current = totalMS;
    
        }
    

});