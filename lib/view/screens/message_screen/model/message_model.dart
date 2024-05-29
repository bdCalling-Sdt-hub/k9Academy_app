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
  Data? data;

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
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<MessageDatum>? messages;
  Meta? meta;

  Data({
    this.messages,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        messages: json["messages"] == null
            ? []
            : List<MessageDatum>.from(
                json["messages"]!.map((x) => MessageDatum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "messages": messages == null
            ? []
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class MessageDatum {
  String? id;
  String? senderId;
  String? conversationId;
  String? image;
  String? message;
  String? messageType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? messageId;

  MessageDatum({
    this.id,
    this.senderId,
    this.conversationId,
    this.image,
    this.message,
    this.messageType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.messageId,
  });

  factory MessageDatum.fromJson(Map<String, dynamic> json) => MessageDatum(
        id: json["_id"],
        senderId: json["senderId"],
        conversationId: json["conversationId"],
        image: json["image"],
        message: json["message"],
        messageType: json["messageType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        messageId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "senderId": senderId,
        "conversationId": conversationId,
        "image": image,
        "message": message,
        "messageType": messageType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": messageId,
      };
}

class Meta {
  int? page;
  int? limit;
  int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json["page"],
        limit: json["limit"],
        totalPage: json["totalPage"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "totalPage": totalPage,
      };
}
