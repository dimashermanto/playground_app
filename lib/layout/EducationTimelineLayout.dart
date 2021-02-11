import 'package:flutter/material.dart';
import 'package:playground_app/model/Education.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EducationTimelineLayout extends StatelessWidget {

  final Color baseColor;

  EducationTimelineLayout({this.baseColor});

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


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
          ),
          renderEducationTimeline()
        ],
      ),
    );
  }
}