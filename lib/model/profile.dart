import 'package:json_annotation/json_annotation.dart';
import '../util/maybe.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {

  @JsonKey(name : "avatar_url", disallowNullValue: true, required: true)
  final String avatarUrl;
  @JsonKey(disallowNullValue: true, required: true)
  final String name;
  @JsonKey(name : "login", disallowNullValue: true, required: true)
  final String username;
  @JsonKey(fromJson: json2MaybeString, toJson: maybe2Json)
  final Maybe<String> bio;

  Profile(this.avatarUrl, this.name, this.username, {this.bio});

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return "$name $username $avatarUrl $bio";
  }
}

