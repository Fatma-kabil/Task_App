// lib/features/auth/data/repos/auth_repo_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:task_app/features/auth_feature/domain/entities/sign_up_enitity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> signUp(SignUpEnitity user) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    await _firestore.collection('Users').doc(credential.user!.uid).set({
      'name': user.name,
      'email': user.email,
    
    });
  }

  @override
  Future<void> signIn(SigninEntity user) async {
     await _auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }
}
