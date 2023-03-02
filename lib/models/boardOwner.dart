import 'dart:convert';

BoardOwner boardOwnerFromJson(String str) =>
    BoardOwner.fromJson(json.decode(str));

String boardOwnerToJson(BoardOwner data) => json.encode(data.toJson());

class BoardOwner {
  BoardOwner({
    required this.documentId,
    required this.boardOwnerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.province,
    required this.town,
  });

  String documentId;
  String boardOwnerId;
  String firstName;
  String lastName;
  String email;
  String province;
  String town;

  factory BoardOwner.fromJson(Map<String, dynamic> json) => BoardOwner(
        documentId: json["documentId"],
        boardOwnerId: json["boardOwnerId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        province: json["province"],
        town: json["town"],
      );

  Map<String, dynamic> toJson() => {
        "documentId": documentId,
        "boardOwnerId": boardOwnerId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "province": province,
        "town": town,
      };
}
