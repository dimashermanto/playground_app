import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'Education.dart';

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

  Widget renderHeaderLayout() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      child: Column(
        children: [renderProfileImage(), renderHeaderInformation()],
      ),
    );
  }

  Widget renderEducationInformation(String education, String range) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(range)
      ],
    );
  }

  Iterable<Widget> renderIndividualEducation() {
    final List educationList = [
      Education("educationName1", "2010 - 2014"),
      Education("educationName2", "2014 - 2017"),
      Education("educationName3", "2017 - 2021")
    ];

    Iterable<Widget> educationWidgetList = educationList.toList().map((e) {
      if (educationList.indexOf(e) == 0) {
        return TimelineTile(
            beforeLineStyle: LineStyle(color: baseColor, thickness: 2.0),
            isFirst: true,
            indicatorStyle: IndicatorStyle(
                color: baseColor,
                width: 24,
                height: 24,
                iconStyle: IconStyle(
                    iconData: Icons.done_all_rounded, color: Colors.white)),
            alignment: TimelineAlign.start,
            endChild: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
              child: renderEducationInformation(
                  e.educationName, e.educationTimeRange),
            ));
      } else if (educationList.indexOf(e) == educationList.length - 1) {
        return TimelineTile(
            beforeLineStyle: LineStyle(color: baseColor, thickness: 2.0),
            isLast: true,
            indicatorStyle:
                IndicatorStyle(color: baseColor, width: 24, height: 24),
            alignment: TimelineAlign.start,
            endChild: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
              child: renderEducationInformation(
                  e.educationName, e.educationTimeRange),
            ));
      } else {
        return TimelineTile(
            beforeLineStyle: LineStyle(color: baseColor, thickness: 2.0),
            indicatorStyle: IndicatorStyle(
                color: baseColor,
                width: 24,
                height: 24,
                iconStyle: IconStyle(
                    iconData: Icons.done_all_rounded, color: Colors.white)),
            alignment: TimelineAlign.start,
            endChild: Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12.0),
              child: renderEducationInformation(
                  e.educationName, e.educationTimeRange),
            ));
      }
    }).toList();

    return educationWidgetList;
  }

  Widget renderEducationTimeline() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(children: renderIndividualEducation()),
    );
  }

  Widget renderEducationLayout() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
            style: subLayoutTitleStyle,
          ),
          renderEducationTimeline()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppbar(),
      body: Column(
        children: [renderHeaderLayout(), renderEducationLayout()],
      ),
    );
  }
}


