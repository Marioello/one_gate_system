import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({required this.uid});
  final String uid;

  CollectionReference memberColl =
      FirebaseFirestore.instance.collection('memberInfo');

  Future updateUserData(int tier, String email, String password) async {
    return await memberColl.doc(uid).set({
      'tier': tier,
      'email': email,
      'password': password,
    });
  }
}
