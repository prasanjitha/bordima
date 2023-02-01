import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> getLoggedUser() async {
  var collection = FirebaseFirestore.instance.collection('users');
  var querySnapshots = await collection.get();
  FirebaseAuth auth = FirebaseAuth.instance;
  String userRole = '';
  for (var snapshot in querySnapshots.docs) {
    if (auth.currentUser!.email == snapshot.data()['email']) {
      userRole = snapshot.data()['role'];
    }
  }
  return userRole;
}
