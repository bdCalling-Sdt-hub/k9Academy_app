class SubscriptionData {
  String? id;
  String? packageName;
  String? packagePrice;
  String? packageDuration;
  List<String>? packageDetails;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SubscriptionData({
    this.id,
    this.packageName,
    this.packagePrice,
    this.packageDuration,
    this.packageDetails,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      SubscriptionData(
        id: json["_id"],
        packageName: json["packageName"],
        packagePrice: json["packagePrice"],
        packageDuration: json["packageDuration"],
        packageDetails: json["packageDetails"] == null
            ? []
            : List<String>.from(json["packageDetails"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "packageName": packageName,
        "packagePrice": packagePrice,
        "packageDuration": packageDuration,
        "packageDetails": packageDetails == null
            ? []
            : List<dynamic>.from(packageDetails!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
