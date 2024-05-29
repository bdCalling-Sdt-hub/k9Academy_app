

import 'dart:convert';

SubscriptionPlan subscriptionPlanFromJson(String str) => SubscriptionPlan.fromJson(json.decode(str));

String subscriptionPlanToJson(SubscriptionPlan data) => json.encode(data.toJson());

class SubscriptionPlan {
  int? statusCode;
  bool? success;
  String? message;
  List<SubscriptionData>? data;

  SubscriptionPlan({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) => SubscriptionPlan(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SubscriptionData>.from(json["data"]!.map((x) => SubscriptionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubscriptionData {
  String? id;
  String? title;
  List<Item>? items;
  int? price;
  bool? status;
  int? duration;
  String? planType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;

  SubscriptionData({
    this.id,
    this.title,
    this.items,
    this.price,
    this.status,
    this.duration,
    this.planType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) => SubscriptionData(
    id: json["_id"],
    title: json["title"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    price: json["price"],
    status: json["status"],
    duration: json["duration"],
    planType: json["plan_type"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    datumId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "price": price,
    "status": status,
    "duration": duration,
    "plan_type": planType,
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
