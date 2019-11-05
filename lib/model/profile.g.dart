// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['avatar_url', 'name', 'login'],
      disallowNullValues: const ['avatar_url', 'name', 'login']);
  return Profile(
    json['avatar_url'] as String,
    json['name'] as String,
    json['login'] as String,
    bio: json2MaybeString(json['bio'] as String),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('name', instance.name);
  writeNotNull('login', instance.username);
  val['bio'] = maybe2Json(instance.bio);
  return val;
}
