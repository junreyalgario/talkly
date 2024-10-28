import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkly/core/constant/sign_in_method.dart';
import 'package:talkly/core/utils/async_result.dart';
import 'package:talkly/features/user/domain/states/auth_state.dart';
import 'package:talkly/features/user/domain/usecases/sign_in_usecase.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._signInUseCase) : super(const AuthState());

  final SignInUseCase _signInUseCase;

  Future<void> signIn({
    required SignInMethod method,
    String? email,
    String? password,
  }) async {
    try {
      state = state.copyWith(
          signInStatus: method == SignInMethod.email
              ? TaskStatus.loading
              : state.signInStatus);

      await _signInUseCase.call(
          method: method, email: email, password: password);
      state = state.copyWith(signInStatus: TaskStatus.success);
    } catch (e) {
      state = state.copyWith(signInStatus: TaskStatus.error);
    }
  }
}

final signInUseCaseProvider = Provider((ref) => SignInUseCase());

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final signInUseCase = ref.watch(signInUseCaseProvider);
  return AuthNotifier(signInUseCase);
});
