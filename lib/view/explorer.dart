import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/profile.dart';
import '../widget/profile_info.dart';
import '../util/view_model_status.dart';

import '../view_model/profile.dart';
//import '../view_model/repositories.dart';

class Explorer extends StatefulWidget {
  Explorer();

  @override
  _Explorer createState() => _Explorer();
}

class _Explorer extends State<Explorer> {
  final nameInputController = TextEditingController();

  String _name = "";

  @override
  void initState() {
    super.initState();
    nameInputController.addListener(() => _name = nameInputController.text);
  }

  @override
  void dispose() {
    nameInputController.dispose();
    super.dispose();
  }

  void _fetchUser() {
    print("searching $_name");
    Provider.of<ProfileViewModel>(context, listen: false).fetch(_name);
//        repositoriesViewModel:
//            Provider.of<RepositoriesViewModel>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                  child: TextField(
                autocorrect: false,
                //autofocus: true,
                controller: nameInputController,
                cursorColor: Colors.deepOrangeAccent,
                decoration:
                    InputDecoration(labelText: 'Search username on Github'),
                onEditingComplete: _fetchUser,
              )),
              IconButton(
                onPressed: _fetchUser,
                icon: Icon(Icons.search),
              ),
            ]),
            Container(
                padding: const EdgeInsets.all(8),
                child: displayProfile(
                    Provider.of<ViewModelStatus<Profile>>(context))),
          ].where((t) => t != null).toList(),
        ));
  }

  Widget displayProfile(ViewModelStatus<Profile> vms) {
    return vms.join(
        () => Center(child: Icon(Icons.smartphone)),
        () => Center(child: Icon(Icons.file_download)),
        (error) => Center(child: Icon(Icons.error)),
        (value) => Center(
            child: Card(
                elevation: 8.0,
                child: InkWell(
                    splashColor: Colors.deepOrange,
                    //onTap: () => _navigateToReposList(user.name),
                    child: ProfileInfo(value)))));
  }
}
