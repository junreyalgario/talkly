import 'package:talkly/features/user/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> googleSignIn();
  Future<void> facebookSignIn();
  Future<void> signIn();
}
