// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/model/auth_model.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool get isLoading => _isLoading;
  Future<void> signUp(String email, String name, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      AuthModel authModel = AuthModel(
          id: firebaseAuth.currentUser!.uid, name: name, email: email);

      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .set(authModel.toMap());
    } on FirebaseAuthException catch (error) {
      if (error.code == "Invalid-email") {
        throw Exception("Invalid email");
      } else if (error.code == "weak-password") {
        throw Exception("invalid password");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      if (error.code == "Invalid-email") {
        throw Exception("Invalid email");
      } else if (error.code == "weak-password") {
        throw Exception("invalid password");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<AuthModel> getUserData() async {
    AuthModel? _user;
    var user = await firestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();
        if(user.data() != null ){
          _user = AuthModel.fromMap(user.data()!);
          notifyListeners();

        }
        return _user!;
  }
}
