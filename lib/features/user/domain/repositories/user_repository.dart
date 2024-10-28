import 'package:talkly/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<bool> cachedUserData(UserEntity user);
  Future<UserEntity?> getCachedUserData();
  Future<bool> clearCachedUserData();
}
