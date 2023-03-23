import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    required this.userId,
    required this.commnetId,
    required this.boardingId,
    required this.comment,
  });

  String userId;
  String commnetId;
  String boardingId;
  String comment;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        userId: json["userID"],
        commnetId: json["commnetID"],
        boardingId: json["boardingID"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "commnetID": commnetId,
        "boardingID": boardingId,
        "comment": comment,
      };
}
