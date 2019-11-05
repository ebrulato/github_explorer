import 'package:flutter/material.dart';
import '../styles.dart';
import '../model/profile.dart';

class ProfileInfo extends StatelessWidget {
  final Profile _profile;

  ProfileInfo(
    this._profile
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: const Alignment(0, 0.5),
          children: [
            Container (padding: const EdgeInsets.all(8),
          child :
            Center( child: CircleAvatar(
              backgroundImage: NetworkImage(this._profile.avatarUrl),
              radius: 100,
            ))),
            Center( child : Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                this._profile.username,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            //this._profile.bio.toString(),
            this._profile.bio.join(() => "", (v) => v),
            style: Styles.textDefault,
          ),
        ),
      ],
    );
  }
}

