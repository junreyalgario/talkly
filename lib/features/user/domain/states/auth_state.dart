import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talkly/core/utils/async_result.dart';

part 'freezed/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) String? email,
    @Default(null) String? password,
    @Default(null) TaskStatus? signInStatus,
  }) = AuthFormState;
}
