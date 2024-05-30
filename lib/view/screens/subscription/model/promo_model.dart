

import 'dart:convert';

PromoModel promoModelFromJson(String str) => PromoModel.fromJson(json.decode(str));

String promoModelToJson(PromoModel data) => json.encode(data.toJson());

class PromoModel {
  int? statusCode;
  bool? success;
  String? message;
  List<PromoData>? data;

  PromoModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PromoData>.from(json["data"]!.map((x) => PromoData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PromoData {
  String? id;
  String? title;
  List<Item>? items;
  bool? status;
  String? promoCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;

  PromoData({
    this.id,
    this.title,
    this.items,
    this.status,
    this.promoCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory PromoData.fromJson(Map<String, dynamic> json) => PromoData(
    id: json["_id"],
    title: json["title"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    status: json["status"],
    promoCode: json["promo_code"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    datumId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "status": status,
    "promo_code": promoCode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": datumId,
  };
}

class Item {
  String? title;
  String? id;
  String? itemId;

  Item({
    this.title,
    this.id,
    this.itemId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    id: json["_id"],
    itemId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "_id": id,
    "id": itemId,
  };
}
