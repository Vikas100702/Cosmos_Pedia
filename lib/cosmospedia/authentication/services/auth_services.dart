import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing data in cloud firestore.
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //for authentication.
  final FirebaseAuth _auth = FirebaseAuth.instance;

//For signup
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      //for register user in firebase auth with email and password.
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //for adding user to cloud firestore.
      await _firebaseFirestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        'name':name,
        'email':email,
        'uid':userCredential.user!.uid
      });
      res = "Success";
    } catch (e) {}
    return res;
  }
}
