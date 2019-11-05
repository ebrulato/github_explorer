import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../util/result.dart';
import '../util/error.dart';
import '../model/repository.dart';

Future<Result<ErrorService, List<Repository>>> fetchRepositories(String username) async {
  try {
    final response = await http.get("https://api.github.com/users/$username/repos");
    switch (response.statusCode) {
      case 200:
        Iterable l = json.decode(response.body);
        return Ok((l.map((m) => Repository.fromJson(m))).toList());
      case 403: return Error(ErrorService(ErrorServiceType.RateLimit, "Too many requests, please wait and try again later"));
      case 404: return Error(ErrorService(ErrorServiceType.NotFound, "Can't find the repositories of the user called '$username'"));
    }

    return Error(ErrorService(ErrorServiceType.Server, "Something wrong with the server ?"));
  } on BadKeyException catch (error) {
    return Error(ErrorService(ErrorServiceType.JsonDecode, error.message));
  } catch (error) {
    return Error(ErrorService(ErrorServiceType.Fatal, error.toString()));
  }
}
