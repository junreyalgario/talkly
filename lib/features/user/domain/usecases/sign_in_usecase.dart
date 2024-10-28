import 'dart:developer';

import 'package:talkly/core/constant/sign_in_method.dart';
import 'package:talkly/features/user/data/repositories/auth_repository_impl.dart';
import 'package:talkly/features/user/data/repositories/user_repository_impl.dart';
import 'package:talkly/features/user/domain/entities/user_entity.dart';
import 'package:talkly/features/user/domain/repositories/auth_repository.dart';
import 'package:talkly/features/user/domain/repositories/user_repository.dart';

/// Note:
///
/// Use cases should be implemented for operations that require business logic
/// or are likely to grow in complexity.
/// For simpler operations, you can call the repository directly from the UI provider.

class SignInUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  SignInUseCase()
      : _authRepository = AuthRepositoryImpl(),
        _userRepository = UserRepositoryImpl();

  Future<bool> call({
    required SignInMethod method,
    String? email,
    String? password,
  }) async {
    try {
      UserEntity? userEntity;
      switch (method) {
        case SignInMethod.google:
          userEntity = await _authRepository.googleSignIn();
          break;
        case SignInMethod.facebook:
          // Facebook sign in
          break;
        case SignInMethod.email:
          // Email sign in
          log('Email sign in');
          break;
      }

      if (userEntity != null) {
        _userRepository.cachedUserData(userEntity);
        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }
}
