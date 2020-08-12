import 'package:CgpaCalculator/data/moor_database.dart';
import 'package:CgpaCalculator/providerStates/courseInfo.dart';
import 'package:CgpaCalculator/services/creditsCalculator.dart';
import 'package:CgpaCalculator/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditRow extends StatefulWidget {
  final String fuid;
  final BuildContext homeScreenContext;
  CreditRow({this.fuid, this.homeScreenContext});

  @override
  _CreditRowState createState() => _CreditRowState();
}

class _CreditRowState extends State<CreditRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('Credits', style: ThemeStyles.gpaTextStyle),
              ),
              StreamBuilder(
                stream: Provider.of<AppDatabase>(widget.homeScreenContext)
                    .watchCoursesBySemesterCode(
                        Provider.of<CourseInfoState>(widget.homeScreenContext)
                            .selectedSemester,
                        widget.fuid),
                builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child:
                          Text('0.00', style: ThemeStyles.gpaNumberTextStyle),
                    );
                  String totalCredits = countSemCredits(snapshot);
                  return Text(totalCredits, style: ThemeStyles.creditTextStyle);
                },
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('Credits', style: ThemeStyles.gpaTextStyle),
              ),
              StreamBuilder(
                stream: Provider.of<AppDatabase>(widget.homeScreenContext)
                    .watchAllCourses(widget.fuid),
                builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child:
                          Text('0.00', style: ThemeStyles.gpaNumberTextStyle),
                    );
                  return FutureBuilder(
                    future: countCredits(snapshot),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = [
                          Text(snapshot.data,
                              style: ThemeStyles.creditTextStyle)
                        ];
                      } else if (snapshot.data == null) {
                        children = [
                          Text('0', style: ThemeStyles.creditTextStyle)
                        ];
                      } else {
                        children = [Text('Loading')];
                      }
                      return Column(children: children);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}