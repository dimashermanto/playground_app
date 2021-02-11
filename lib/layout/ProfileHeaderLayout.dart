import 'package:flutter/material.dart';

class ProfileHeaderLayout extends StatelessWidget {

  Widget renderProfileImage() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 100),
        ],
      ),
    );
  }

  Widget renderHeaderInformation() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Column(
        children: [
          Text("Dimas Putra Hermanto",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text("Android Developer"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      child: Column(
        children: [renderProfileImage(), renderHeaderInformation()],
      ),
    );
  }
}


