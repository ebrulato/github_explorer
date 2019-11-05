import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../util/result.dart';
import '../util/error.dart';
import '../model/profile.dart';

Future<Result<ErrorService, Profile>> fetchProfile(String username) async {
  try {
    final response = await http.get("https://api.github.com/users/$username");
    switch (response.statusCode) {
      case 200: return Ok(Profile.fromJson(json.decode(response.body)));
      case 403: return Error(ErrorService(ErrorServiceType.RateLimit, "Too many requests, please wait and try again later"));
      case 404: return Error(ErrorService(ErrorServiceType.NotFound, "Can't find a user called '$username'"));
    }

    return Error(ErrorService(ErrorServiceType.Server, "Something wrong with the server ? (code=${response.statusCode})"));
  } on BadKeyException catch (error) {
    return Error(ErrorService(ErrorServiceType.JsonDecode, error.message));
  } catch (error) {
    return Error(ErrorService(ErrorServiceType.Fatal, error.toString()));
  }
}
