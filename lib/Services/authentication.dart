import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FirebaseAuthentication {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static UserCredential userCredential;
  static Future<User> signUpWithEmailAndPass(
      String email, String pass, BuildContext context) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: "$email", password: "$pass");

      if (userCredential != null) {
        User user = auth.currentUser;
        user.sendEmailVerification();
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Toast.show("The password provided is too weak.", context, gravity: 1);
      } else if (e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
        Toast.show("The account already exists for that email.", context,
            gravity: 1);
      }
    } catch (e) {
      print("error => $e");
    }
    return null;
  }

  static Future<User> signInWithEmailAndPass(
      String email, String pass, BuildContext cntxt) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: "$email", password: "$pass");

      if (userCredential != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
        Toast.show('No user found for that email', cntxt);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
        Toast.show('Wrong password provided for that user', cntxt);
      }
    }
    return null;
  }

  static Future<void> passwordReset(String email, BuildContext context) async {
    await auth.sendPasswordResetEmail(email: email).whenComplete(() {
      Toast.show("Check your email", context);
    });
  }

  static Future<void> logOut() async {
    return auth.signOut();
  }
}
