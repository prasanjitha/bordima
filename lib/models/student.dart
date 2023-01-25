import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.documentId,
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.province,
    required this.town,
  });

  String documentId;
  String studentId;
  String firstName;
  String lastName;
  String email;
  String province;
  String town;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        documentId: json["documentId"],
        studentId: json["studentId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        province: json["province"],
        town: json["town"],
      );

  Map<String, dynamic> toJson() => {
        "documentId": documentId,
        "studentId": studentId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "province": province,
        "town": town,
      };
}
