import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/service/get_repositories.dart';
import 'package:github_explorer/model/repository.dart';
import 'package:github_explorer/util/result.dart';
import 'package:github_explorer/util/error.dart';

void main() {

  test("200 : check nominal case", () async {
    Result<ErrorService, List<Repository>> result = await fetchRepositories("ebrulato");

    expect(result.isOk(), true);
    expect(result.join((error) => null, (repositories) => repositories.length),14);
  });

  test("404", () async {
    Result<ErrorService, List<Repository>> result = await fetchRepositories("ebrulato2");
    expect(result.isError(), true);
    expect(result.join((error) => error.type, (ok) => null), ErrorServiceType.NotFound);
  });


}
