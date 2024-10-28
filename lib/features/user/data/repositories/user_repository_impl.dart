import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkly/core/exceptions/user_exception.dart';
import 'package:talkly/features/user/domain/entities/user_entity.dart';
import 'package:talkly/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  static const String _userKey = 'cached_user';

  @override
  Future<bool> cachedUserData(UserEntity user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userJson = jsonEncode(user);
      return prefs.setString(_userKey, userJson);
    } catch (e) {
      throw UserException('Failed to cache user data. $e');
    }
  }

  @override
  Future<bool> clearCachedUserData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.remove(_userKey);
    } catch (e) {
      throw UserException('Failed to clear user data cache. $e');
    }
  }

  @override
  Future<UserEntity?> getCachedUserData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userJson = prefs.getString(_userKey);

      if (userJson != null) {
        return UserEntity.fromJson(jsonDecode(userJson));
      }

      return null;
    } catch (e) {
      throw UserException('Failed to get user data cache. $e');
    }
  }
}
