import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:talkly/core/exceptions/auth_exception.dart';
import 'package:talkly/features/user/data/sources/google_auth_service.dart';
import 'package:talkly/features/user/domain/entities/user_entity.dart';
import 'package:talkly/features/user/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final GoogleAuthService _googleAuth;

  AuthRepositoryImpl() : _googleAuth = GoogleAuthService();

  @override
  Future<void> facebookSignIn() async {}

  @override
  Future<UserEntity?> googleSignIn() async {
    try {
      UserCredential? userCredential = await _googleAuth.signIn();
      if (userCredential == null) {
        throw AuthException('Google sign-in was canceled.');
      }

      return UserEntity(
        id: userCredential.user?.uid,
        firstName: userCredential.additionalUserInfo!.profile?["family_name"],
        lastName: userCredential.additionalUserInfo!.profile?["last_name"],
        email: userCredential.user?.email,
        photoUrl: userCredential.user?.photoURL,
        emailVerified: userCredential.user!.emailVerified,
        phone: userCredential.user?.phoneNumber,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signIn() async {}
}
