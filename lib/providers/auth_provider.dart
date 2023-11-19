import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/auth_repo.dart';

// Define a provider for the Authentication class
final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

// Define a StreamProvider to listen to the authentication state changes (User?)
final authStateProvider = StreamProvider<User?>((ref) {
  // Read the authenticationProvider to access the Authentication instance
  return ref.read(authenticationProvider).authStateChange;
});

// Define a provider for the FirebaseAuth instance
final fireBaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
