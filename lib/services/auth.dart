import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_gate_system/models/account.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/models/user.dart';
import 'package:one_gate_system/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth? _userFromFireBase(User? user) {
    return user != null ? UserAuth(user.uid) : null;
  }

  Stream<UserAuth?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFireBase(user));
        .map(_userFromFireBase); // similar with line 14
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerwithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // create new document for the user with the uid
      /// Tiers:
      /// Tier 0 -> Free user
      /// Tier 1 -> Fastrack
      /// Tier 2 -> Matrix
      await DatabaseService(uid: user!.uid)
          .updateUserData(1, email, password)
          .then(
        (value) {
          print('registerwithEmailAndPassword');
          print(value);
          print('registerwithEmailAndPassword');
          Member.postMember(
            Member(
              id: 0,
              uid: user.uid,
              joinDate: DateTime.now(),
              registerDate: DateTime.now(),
              tier: 1,
            ),
          ).then(
            (value) => Account.postAccount(
              Account(uid: user.uid, email: email, password: password),
            ),
          );
        },
      );

      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
