import 'package:flutter/widgets.dart';

import '../util/error.dart';
import '../util/view_model_status.dart';

import '../model/profile.dart';
import '../service/get_profile.dart';
import 'repositories.dart';


class ProfileViewModel extends ValueNotifier<ViewModelStatus<Profile>> {
  ProfileViewModel() : super(Empty());

  ViewModelStatus<Profile> _onFoundedProfileFetchesRepositories(Profile p, RepositoriesViewModel repositoriesViewModel) {
    repositoriesViewModel?.fetch(p.username);
    return Loaded(p);
  }

  void fetch(String user, {RepositoriesViewModel repositoriesViewModel}) async {
    value = Loading();
    repositoriesViewModel?.reset();
    try {
      value = (await fetchProfile(user)).join(
        (error) => Issue(error),
        (profile) => _onFoundedProfileFetchesRepositories(profile, repositoriesViewModel),
      );
    } catch (err) {
      value = Issue(ErrorService(ErrorServiceType.Fatal, "ProfileViewModel fatal error : $err"));
    }
  }
}


