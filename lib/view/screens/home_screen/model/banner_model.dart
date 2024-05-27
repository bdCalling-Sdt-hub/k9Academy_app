// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  int? statusCode;
  bool? success;
  String? message;
  List<BannerDatum>? data;

  BannerModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BannerDatum>.from(
                json["data"]!.map((x) => BannerDatum.fromJson(x))),
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

class BannerDatum {
  String? id;
  String? title;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;

  BannerDatum({
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": datumId,
      };
}
