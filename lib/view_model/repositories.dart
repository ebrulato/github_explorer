import 'package:flutter/widgets.dart';

import '../util/error.dart';
import '../util/view_model_status.dart';

import '../model/repository.dart';
import '../service/get_repositories.dart';


class RepositoriesViewModel extends ValueNotifier<ViewModelStatus<List<Repository>>> {
  RepositoriesViewModel() : super(Empty());

  void reset() {
    value = Empty();
  }

  void fetch(String user) async {
    value = Loading();
    try {
      value = (await fetchRepositories(user)).join(
          (error) => Issue(error),
          (repositories) => Loaded(repositories)
      );
    } catch (err) {
      value = Issue(ErrorService(ErrorServiceType.Fatal, "RepositoriesViewModel fatal error : $err"));
    }
  }
}


