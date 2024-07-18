// ignore_for_file: unnecessary_string_interpolations

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> loginUser(String email, String password) async {
  isLoading = true;
  String result = ""; // Initialize result to an empty string

  try {
    // Sign in the user with email and password
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // No need to store user data again on login (security concern)
    print("User logged in successfully.");
    result = "success";
  } on FirebaseAuthException catch (error) {
    // Handle specific FirebaseAuthExceptions
    switch (error.code) {
      case 'user-not-found':
        result = "The email address is not registered.";
        break;
      case 'wrong-password':
        result = "The password is incorrect.";
        break;
      case 'invalid-email':
        result = "The email address is invalid.";
        break;
      default:
        result = "An error occurred during login: ${error.message}";
        break;
    }
    print("FirebaseAuthException: ${error.code} - ${error.message}");
  } catch (error) {
    result = "An unexpected error occurred: ${error.toString()}";
    print("Catch-all error: $error");
  } finally {
    isLoading = false;
    return result;
  }
}


  Future<String> signupUser(String email, String password, String name) async {
    isLoading = true;
    String result = ""; // Initialize result to an empty string

    try {
      // Create the user with email and password
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = cred.user!.uid;

      // Write user data to Firestore (excluding password for security)
      await _fireStore.collection("users").doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
      });

      result = "success";
      print("User registered successfully through Firebase Authentication.");
    } on FirebaseAuthException catch (error) {
      // Handle specific FirebaseAuthExceptions
      switch (error.code) {
        case 'weak-password':
          result = "The password is too weak.";
          break;
        case 'email-already-in-use':
          result = "The email address is already in use.";
          break;
        case 'invalid-email':
          result = "The email address is invalid.";
          break;
        default:
          result = "An error occurred during registration: ${error.message}";
          break;
      }
      print("FirebaseAuthException: ${error.code} - ${error.message}");
    } catch (error) {
      // Handle other unexpected errors
      result = "An unexpected error occurred: ${error.toString()}";
      print("Catch-all error: $error");
    } finally {
      isLoading = false;
      return result;
    }
  }
}
