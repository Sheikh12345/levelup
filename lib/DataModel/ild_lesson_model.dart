// To parse this JSON data, do
//
//     final lesson = lessonFromJson(jsonString);

import 'dart:convert';

Lesson lessonFromJson(String str) => Lesson.fromJson(json.decode(str));

String lessonToJson(Lesson data) => json.encode(data.toJson());

class Lesson {
  Lesson({
    this.success,
    this.data,
    this.bonus,
    this.thumbnail,
    this.trailer,
    this.durations,
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
  List<Duration> durations;
  List<VideoDetail> videoDetail;
  String title;
  String description;
  int price;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    success: json["success"],
    data: List<String>.from(json["data"].map((x) => x)),
    bonus: List<String>.from(json["bonus"].map((x) => x)),
    thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
    trailer: List<String>.from(json["trailer"].map((x) => x)),
    durations: List<Duration>.from(json["durations"].map((x) => Duration.fromJson(x))),
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
    "durations": List<dynamic>.from(durations.map((x) => x.toJson())),
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
  });

  String fileName;
  double duration;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    fileName: json["file_name"],
    duration: json["duration"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "file_name": fileName,
    "duration": duration,
  };
}

class VideoDetail {
  VideoDetail({
    this.id,
    this.name,
    this.category,
    this.subCategory,
    this.description,
    this.v,
  });

  String id;
  String name;
  String category;
  String subCategory;
  String description;
  int v;

  factory VideoDetail.fromJson(Map<String, dynamic> json) => VideoDetail(
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    subCategory: json["subCategory"],
    description: json["description"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "category": category,
    "subCategory": subCategory,
    "description": description,
    "__v": v,
  };
}
