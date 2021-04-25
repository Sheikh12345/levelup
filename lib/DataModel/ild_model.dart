// To parse this JSON data, do
//
//     final ildModel = ildModelFromJson(jsonString);

import 'dart:convert';

IldModel ildModelFromJson(String str) => IldModel.fromJson(json.decode(str));

String ildModelToJson(IldModel data) => json.encode(data.toJson());

class IldModel {
  IldModel({
    this.success,
    this.data,
    this.bonus,
    this.thumbnail,
    this.trailer,
    this.dataDurations,
    this.bonusDuration,
    this.videoDetail,
    this.title,
    this.description,
    this.price,
  });

  bool success;
  List<String> data;
  List<String> bonus;
  List<String> thumbnail;
  List<String> trailer;
  List<Duration> dataDurations;
  List<Duration> bonusDuration;
  List<VideoDetail> videoDetail;
  String title;
  String description;
  int price;

  factory IldModel.fromJson(Map<String, dynamic> json) => IldModel(
    success: json["success"],
    data: List<String>.from(json["data"].map((x) => x)),
    bonus: List<String>.from(json["bonus"].map((x) => x)),
    thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
    trailer: List<String>.from(json["trailer"].map((x) => x)),
    dataDurations: List<Duration>.from(json["dataDurations"].map((x) => Duration.fromJson(x))),
    bonusDuration: List<Duration>.from(json["bonusDuration"].map((x) => Duration.fromJson(x))),
    videoDetail: List<VideoDetail>.from(json["videoDetail"].map((x) => VideoDetail.fromJson(x))),
    title: json["title"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x)),
    "bonus": List<dynamic>.from(bonus.map((x) => x)),
    "thumbnail": List<dynamic>.from(thumbnail.map((x) => x)),
    "trailer": List<dynamic>.from(trailer.map((x) => x)),
    "dataDurations": List<dynamic>.from(dataDurations.map((x) => x.toJson())),
    "bonusDuration": List<dynamic>.from(bonusDuration.map((x) => x.toJson())),
    "videoDetail": List<dynamic>.from(videoDetail.map((x) => x.toJson())),
    "title": title,
    "description": description,
    "price": price,
  };
}

class Duration {
  Duration({
    this.fileName,
    this.duration,
    this.videoType,
  });

  String fileName;
  String duration;
  String videoType;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    fileName: json["file_name"],
    duration: json["duration"],
    videoType: json["videoType"],
  );

  Map<String, dynamic> toJson() => {
    "file_name": fileName,
    "duration": duration,
    "videoType": videoType,
  };
}

class VideoDetail {
  VideoDetail({
    this.id,
    this.name,
    this.category,
    this.subCategory,
    this.lessonName,
    this.duration,
    this.description,
    this.v,
  });

  String id;
  String name;
  String category;
  String subCategory;
  String lessonName;
  String duration;
  String description;
  int v;

  factory VideoDetail.fromJson(Map<String, dynamic> json) => VideoDetail(
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    subCategory: json["subCategory"],
    lessonName: json["lessonName"],
    duration: json["duration"],
    description: json["description"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "category": category,
    "subCategory": subCategory,
    "lessonName": lessonName,
    "duration": duration,
    "description": description,
    "__v": v,
  };
}
