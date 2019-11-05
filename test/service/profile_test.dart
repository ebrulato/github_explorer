// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/service/get_profile.dart';
import 'package:github_explorer/model/profile.dart';
import 'package:github_explorer/util/result.dart';
import 'package:github_explorer/util/error.dart';

void main() {

  test("200 : check nominal case", () async {
    Result<ErrorService, Profile> result = await fetchProfile("ebrulato");
    print(result);
    expect(result.isOk(), true);
    expect(result.join((error) => null, (profile) => profile.username),"ebrulato");
  });

  test("404", () async {
    Result<ErrorService, Profile> result = await fetchProfile("ebrulato2");
    expect(result.isError(), true);
    expect(result.join((error) => error.type, (ok) => null), ErrorServiceType.NotFound);
  });


}
