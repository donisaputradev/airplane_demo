import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseDataSource {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    required String hobby,
  });

  Future<bool> signOut();

  Future<String?> checkAuth();
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  AuthFirebaseDataSourceImpl(this.auth);

  final FirebaseAuth auth;

  final userReference = FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    required String hobby,
  }) async {
    try {
      const balance = 280000000;
      final authCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userReference.doc(authCredential.user?.uid).set({
        'email': email,
        'name': name,
        'hobby': hobby,
        'balance': balance,
      });
      return UserModel(
        id: authCredential.user?.uid ?? '',
        name: name,
        email: email,
        hobby: hobby,
        balance: balance,
      );
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<String?> checkAuth() async {
    try {
      final user = auth.currentUser;
      return user?.uid;
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }
}
