import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commers_app/common/helpers/auth/ages/order_ages.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> singup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> singup(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(
            returnedData.user!.uid,
          )
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
      });

      return const Right(
        'User created successfully',
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();

      List<String> ages = [];
      for (var age in returnedData.docs) {
        ages.add(age['value']);
      }

      List<String> sortedAges = OrderAges.sortAges(ages);

      return Right(sortedAges);
    } on FirebaseException catch (e) {
      return Left(e.message);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      return const Right('User signed in successfully');
    } on FirebaseException catch (e) {
      String message = e.toString();
      if (e.code == 'invalid-credential') {
        message = 'Check your email and password.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Email sent successfully');
    } on FirebaseException catch (e) {
      return Left(e.message);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
