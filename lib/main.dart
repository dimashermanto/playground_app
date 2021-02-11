import 'package:flutter/material.dart';
import 'layout/ProfileHeaderLayout.dart';
import 'layout/EducationTimelineLayout.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}


class Profile extends StatelessWidget {
  final Color baseColor = Colors.greenAccent[200];

  final TextStyle subLayoutTitleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  Widget renderAppbar() {
    return AppBar(
      title: Text("My Profile"),
      centerTitle: true,
      backgroundColor: baseColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppbar(),
      body: Column(
        children: [ProfileHeaderLayout(), EducationTimelineLayout(baseColor: baseColor,)],
      ),
    );
  }
}




