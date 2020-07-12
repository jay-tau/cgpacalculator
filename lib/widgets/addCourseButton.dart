import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCourseButton extends StatefulWidget {
  final String semesterCode;
  final String userID;
  final String userName;
  AddCourseButton({this.semesterCode, this.userID, this.userName});
  @override
  _AddCourseButtonState createState() => _AddCourseButtonState();
}

class _AddCourseButtonState extends State<AddCourseButton> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
            _firestore.collection('users').document(widget.userID).snapshots());

        _firestore
            .collection('users')
            .document(widget.userID)
            .collection(widget.semesterCode)
            .add({
          'courseCode': 'BITS',
          'courseID': 'F112',
          'courseCredits': 3,
          'gradeAchieved': 10,
          'courseTitle': '${widget.userName}',
        }).then((_) => print('Success'));
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 130.0, top: 28.0),
          child: Text(
            'Add Course',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}