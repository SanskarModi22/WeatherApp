import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  // For Authentication related functions you need an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn signInGoogle = GoogleSignIn();
  //  This getter will be returning a Stream of User object.
  //  It will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  //  SignIn the user Google
  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await signInGoogle.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      // Attempt to sign in with the provided credential
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // If an exception (error) occurs during sign-in
      // Show an error dialog with the error message
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occurred'),
          content: Text(e.toString()), // Display the error message
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // Close the dialog when OK is pressed
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await signInGoogle.signOut();
    await _auth.signOut();
  }
}
