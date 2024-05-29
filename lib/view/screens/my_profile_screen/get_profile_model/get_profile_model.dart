//
//
// import 'dart:convert';
//
// ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
//
// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());
//
// class ProfileModel {
//   int? statusCode;
//   bool? success;
//   String? message;
//   Data? data;
//
//   ProfileModel({
//     this.statusCode,
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
//     statusCode: json["statusCode"],
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   UserInfo? userInfo;
//   List<Post>? posts;
//   List<Schedule>? schedule;
//
//   Data({
//     this.userInfo,
//     this.posts,
//     this.schedule,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
//     posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
//     schedule: json["schedule"] == null ? [] : List<Schedule>.from(json["schedule"]!.map((x) => Schedule.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userInfo": userInfo?.toJson(),
//     "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
//     "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x.toJson())),
//   };
// }
//
// class Post {
//   String? id;
//   String? user;
//   String? description;
//   String? image;
//   List<dynamic>? comments;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? postId;
//
//   Post({
//     this.id,
//     this.user,
//     this.description,
//     this.image,
//     this.comments,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.postId,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//     id: json["_id"],
//     user: json["user"],
//     description: json["description"],
//     image: json["image"],
//     comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     postId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "user": user,
//     "description": description,
//     "image": image,
//     "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "id": postId,
//   };
// }
//
// class Schedule {
//   String? id;
//   List<String>? users;
//   String? meetLink;
//   DateTime? date;
//   String? password;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? scheduleId;
//
//   Schedule({
//     this.id,
//     this.users,
//     this.meetLink,
//     this.date,
//     this.password,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.scheduleId,
//   });
//
//   factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
//     id: json["_id"],
//     users: json["users"] == null ? [] : List<String>.from(json["users"]!.map((x) => x)),
//     meetLink: json["meet_link"],
//     date: json["date"] == null ? null : DateTime.parse(json["date"]),
//     password: json["password"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     scheduleId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
//     "meet_link": meetLink,
//     "date": date?.toIso8601String(),
//     "password": password,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "id": scheduleId,
//   };
// }
//
// class UserInfo {
//   String? profileImage;
//   String? id;
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? role;
//   // dynamic activationCode;
//   bool? isBlock;
//   bool? isActive;
//   String? planType;
//   DateTime? expirationTime;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? userInfoId;
//
//   UserInfo({
//     this.profileImage,
//     this.id,
//     this.name,
//     this.email,
//     this.phoneNumber,
//     this.role,
//     // this.activationCode,
//     this.isBlock,
//     this.isActive,
//     this.planType,
//     this.expirationTime,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.userInfoId,
//   });
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//     profileImage: json["profile_image"],
//     id: json["_id"],
//     name: json["name"],
//     email: json["email"],
//     phoneNumber: json["phone_number"],
//     role: json["role"],
//     // activationCode: json["activationCode"],
//     isBlock: json["is_block"],
//     isActive: json["isActive"],
//     planType: json["plan_type"],
//     expirationTime: json["expirationTime"] == null ? null : DateTime.parse(json["expirationTime"]),
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     userInfoId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "profile_image": profileImage,
//     "_id": id,
//     "name": name,
//     "email": email,
//     "phone_number": phoneNumber,
//     "role": role,
//     // "activationCode": activationCode,
//     "is_block": isBlock,
//     "isActive": isActive,
//     "plan_type": planType,
//     "expirationTime": expirationTime?.toIso8601String(),
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "id": userInfoId,
//   };
// }

class ProfileModel {
  int? statusCode;
  bool? success;
  String? message;
  DataModel? data;

  ProfileModel({this.statusCode, this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataModel {
  UserInfo? userInfo;
  List<dynamic>? posts;
  List<dynamic>? schedule;

  DataModel({this.userInfo, this.posts, this.schedule});

  DataModel.fromJson(Map<String, dynamic> json) {
    userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    posts = json['posts'] != null ? List<dynamic>.from(json['posts']) : [];
    schedule = json['schedule'] != null ? List<dynamic>.from(json['schedule']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    if (posts != null) {
      data['posts'] = posts;
    }
    if (schedule != null) {
      data['schedule'] = schedule;
    }
    return data;
  }
}

class UserInfo {
  String? sId;
  String? name;
  String? email;
  String? age;
  String? date_of_birth;
  String? gender;
  String? phoneNumber;
  String? role;
  String? profileImage;
  String? activationCode;
  bool? isBlock;
  bool? isActive;
  String? planType;
  String? expirationTime;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  UserInfo({
    this.sId,
    this.name,
    this.email,
    this.age,
    this.date_of_birth,
    this.gender,
    this.phoneNumber,
    this.role,
    this.profileImage,
    this.activationCode,
    this.isBlock,
    this.isActive,
    this.planType,
    this.expirationTime,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.id,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    date_of_birth = json['date_of_birth'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    profileImage = json['profile_image'];
    activationCode = json['activationCode'];
    isBlock = json['is_block'];
    isActive = json['isActive'];
    planType = json['plan_type'];
    expirationTime = json['expirationTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['date_of_birth'] = date_of_birth;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['role'] = role;
    data['profile_image'] = profileImage;
    data['activationCode'] = activationCode;
    data['is_block'] = isBlock;
    data['isActive'] = isActive;
    data['plan_type'] = planType;
    data['expirationTime'] = expirationTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
