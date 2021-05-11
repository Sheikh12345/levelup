// To parse this JSON data, do
//
//     final allDgfs = allDgfsFromJson(jsonString);

import 'dart:convert';

AllDgfs allDgfsFromJson(String str) => AllDgfs.fromJson(json.decode(str));

String allDgfsToJson(AllDgfs data) => json.encode(data.toJson());

class AllDgfs {
  AllDgfs({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory AllDgfs.fromJson(Map<String, dynamic> json) => AllDgfs(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.lessonName,
    this.data,
  });

  String lessonName;
  Data data;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    lessonName: json["lesson_name"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "lesson_name": lessonName,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    this.thumbnail,
  });

  String id;
  String thumbnail;
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
    thumbnail: json["thumbnail"],
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
    "thumbnail": thumbnail,
  };
}
