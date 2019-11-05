// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['name', 'language'],
      disallowNullValues: const ['name', 'language']);
  return Repository(
    name: json['name'] as String,
    language: json['language'] as String,
    description: json['description'] as String,
    licence: json['licence'] == null
        ? null
        : Licence.fromJson(json['licence'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('language', instance.language);
  val['licence'] = instance.licence;
  val['description'] = instance.description;
  return val;
}

Licence _$LicenceFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['name'], disallowNullValues: const ['name']);
  return Licence(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LicenceToJson(Licence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}
