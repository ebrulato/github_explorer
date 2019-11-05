import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {

  @JsonKey(disallowNullValue: true, required: true)
  final String name;
  @JsonKey(disallowNullValue: true, required: true)
  final String language;

  final Licence licence;
  final String description;

  Repository({this.name, this.language, this.description, this.licence});

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);

  @override
  String toString() {
    return "$name $language $licence $description";
  }
}

@JsonSerializable()
class Licence {

  @JsonKey(disallowNullValue: true, required: true)
  final String name;

  Licence({this.name});

  factory Licence.fromJson(Map<String, dynamic> json) => _$LicenceFromJson(json);

  Map<String, dynamic> toJson() => _$LicenceToJson(this);

  @override
  String toString() {
    return "$name";
  }
}
