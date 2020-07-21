import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  User({this.id, this.name, this.email, this.photoUrl});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl']
    );
  }

  addDocument(User user) async {
     await userCollection.document(user.id).setData({
      "name" : user.name,
      "email": user.email,
      "photoUrl": user.photoUrl,
   } );
  }
}
