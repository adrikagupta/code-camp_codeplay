import 'package:cloud_firestore/cloud_firestore.dart';

class TaskItem{

  final String taskName;
  final String taskDate;
  final String taskTime;
  final String orderDate;
  final bool completed;
  final String taskId;

  TaskItem({this.taskDate,this.taskName,this.taskTime,this.orderDate,this.completed,this.taskId});

  factory TaskItem.fromDocument(DocumentSnapshot doc){
    return TaskItem(
      taskName: doc["taskName"],
      taskDate: doc["taskDate"],
      taskTime: doc["taskTime"],
      orderDate: doc["orderDate"],
      completed: doc["completed"],
      taskId: doc["taskId"]
    );
  }

}