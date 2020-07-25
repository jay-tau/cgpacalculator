import 'dart:convert';

List<String> courseCodeList = [
  'BIO',
  'BIOT',
  'BITS',
  'CE',
  'CHE',
  'CHEM',
  'CS',
  'DE',
  'E',
  'ECE',
  'ECON',
  'EEE',
  'GS',
  'HSS',
  'INSTR',
  'IS',
  'MATH',
  'ME',
  'MF',
  'MST',
  'PHA',
  'PHY',
];

final courses = '''{
  {
    'courseCode':'CS',
    'courseID':'F111',
    'courseTitle':'Computer Programming'
  },
  {
    'courseCode':'BIO',
    'courseID':'F111',
    'courseTitle':'General Biology'
  }
}''';

class CourseInfo {
  String courseCode;
  String courseID;
  String courseTitle;
  CourseInfo({
    this.courseCode,
    this.courseID,
    this.courseTitle,
  });
  factory CourseInfo.fromJson(Map<String, dynamic> json) {
    return CourseInfo(
      courseCode: json['courseCode'],
      courseID: json['courseID'],
      courseTitle: json['courseTitle'],
    );
  }
}

var data = json.decode(courses);
var rest = data as List;
List<CourseInfo> list =
    rest.map<CourseInfo>((json) => CourseInfo.fromJson(json)).toList();

final grades = '''{
  {
    'gradeCode': 'A',
    'grade': 10,
  },
  {
    'gradeCode': 'A-',
    'grade': 9,
  },
  {
    'gradeCode': 'B',
    'grade': 8,
  },
  {
    'gradeCode': 'B-',
    'grade': 7,
  },
  {
    'gradeCode': 'C',
    'grade': 6,
  },
  {
    'gradeCode': 'C-',
    'grade': 5,
  },
  {
    'gradeCode': 'D',
    'grade': 4,
  },
  {
    'gradeCode': 'E',
    'grade': 3,
  },
}''';

List<String> semesterList = [
  '1 - 1',
  '1 - 2',
  '2 - 1',
  '2 - 2',
  '3 - 1',
  '3 - 2',
  '4 - 1',
  '4 - 2'
];

List<String> courseIDList = [
  'F110',
  'F111',
  'F112',
  'F113',
  'F211',
  'F212',
  'F213',
  'F214',
  'F215',
  'F241',
  'F242',
  'F243',
  'F244',
  'F245',
  'F311',
  'F312',
  'F313',
  'F314',
  'F315',
  'F341',
  'F342',
  'F343',
  'F344',
  'F345',
  'F411',
  'F412',
  'F413',
  'F414',
  'F415',
  'F441',
  'F442',
  'F443',
  'F444',
  'F445',
];
