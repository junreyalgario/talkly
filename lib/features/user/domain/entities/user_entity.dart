// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/user_entity.freezed.dart';
part 'g/user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    @Default(null) String? id,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) String? email,
    @Default(false) bool emailVerified,
    @Default(null) String? phone,
    @Default(null) String? photoUrl,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
