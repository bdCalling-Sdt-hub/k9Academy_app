// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  int? statusCode;
  bool? success;
  String? message;
  List<MessageDatum>? data;

  MessageModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MessageDatum>.from(json["data"]!.map((x) => MessageDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MessageDatum {
  String? id;
  String? senderId;
  String? conversationId;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;
  String? messageType;
  String? image;

  MessageDatum({
    this.id,
    this.senderId,
    this.conversationId,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
    this.messageType,
    this.image,
  });

  factory MessageDatum.fromJson(Map<String, dynamic> json) => MessageDatum(
        id: json["_id"],
        senderId: json["senderId"],
        conversationId: json["conversationId"],
        message: json["message"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        datumId: json["id"],
        messageType: json["messageType"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "senderId": senderId,
        "conversationId": conversationId,
        "message": message,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": datumId,
        "messageType": messageType,
        "image": image,
      };
}
