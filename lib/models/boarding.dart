import 'dart:convert';

BoardModel boardModelFromJson(String str) =>
    BoardModel.fromJson(json.decode(str));

String boardModelToJson(BoardModel data) => json.encode(data.toJson());

class BoardModel {
  BoardModel({
    required this.userId,
    required this.boardingId,
    required this.boardingName,
    required this.boardingPrice,
    required this.boardingType,
    required this.boardingUserId,
    required this.city,
    required this.description,
    required this.images,
    required this.mobile,
    required this.province,
  });

  String userId;
  String boardingId;
  String boardingName;
  String boardingPrice;
  String boardingType;
  String boardingUserId;
  String city;
  String description;
  List<dynamic> images;
  String mobile;
  String province;

  factory BoardModel.fromJson(Map<String, dynamic> json) => BoardModel(
        userId: json["userId"],
        boardingId: json["boardingId"],
        boardingName: json["boardingName"],
        boardingPrice: json["boardingPrice"],
        boardingType: json["boardingType"],
        boardingUserId: json["boardingUserId"],
        city: json["city"],
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        mobile: json["mobile"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "boardingId": boardingId,
        "boardingName": boardingName,
        "boardingPrice": boardingPrice,
        "boardingType": boardingType,
        "boardingUserId": boardingUserId,
        "city": city,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "mobile": mobile,
        "province": province,
      };
}
