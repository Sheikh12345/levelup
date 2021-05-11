// To parse this JSON data, do
//
//     final allSkill = allSkillFromJson(jsonString);

import 'dart:convert';

AllSkill allSkillFromJson(String str) => AllSkill.fromJson(json.decode(str));

String allSkillToJson(AllSkill data) => json.encode(data.toJson());

class AllSkill {
  AllSkill({
    this.skill1,
    this.skill2,
    this.skill3,
    this.skill4,
    this.skill5,
  });

  Skill skill1;
  Skill skill2;
  Skill skill3;
  Skill4 skill4;
  Skill skill5;

  factory AllSkill.fromJson(Map<String, dynamic> json) => AllSkill(
    skill1: Skill.fromJson(json["skill1"]),
    skill2: Skill.fromJson(json["skill2"]),
    skill3: Skill.fromJson(json["skill3"]),
    skill4: Skill4.fromJson(json["skill4"]),
    skill5: Skill.fromJson(json["skill5"]),
  );

  Map<String, dynamic> toJson() => {
    "skill1": skill1.toJson(),
    "skill2": skill2.toJson(),
    "skill3": skill3.toJson(),
    "skill4": skill4.toJson(),
    "skill5": skill5.toJson(),
  };
}

class Skill {
  Skill({
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

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
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
    this.duration,
    this.description,
    this.thumbnail,
    this.v,
  });

  String id;
  String name;
  String category;
  String subCategory;
  String duration;
  String description;
  String thumbnail;
  int v;

  factory VideoDetail.fromJson(Map<String, dynamic> json) => VideoDetail(
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    subCategory: json["subCategory"],
    duration: json["duration"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "category": category,
    "subCategory": subCategory,
    "duration": duration,
    "description": description,
    "thumbnail": thumbnail,
    "__v": v,
  };
}

class Skill4 {
  Skill4({
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
  List<BonusDuration> bonusDuration;
  List<VideoDetail> videoDetail;
  String title;
  String description;
  int price;

  factory Skill4.fromJson(Map<String, dynamic> json) => Skill4(
    success: json["success"],
    data: List<String>.from(json["data"].map((x) => x)),
    bonus: List<String>.from(json["bonus"].map((x) => x)),
    thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
    trailer: List<String>.from(json["trailer"].map((x) => x)),
    dataDurations: List<Duration>.from(json["dataDurations"].map((x) => Duration.fromJson(x))),
    bonusDuration: List<BonusDuration>.from(json["bonusDuration"].map((x) => BonusDuration.fromJson(x))),
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

class BonusDuration {
  BonusDuration({
    this.fileName,
    this.videoType,
  });

  String fileName;
  String videoType;

  factory BonusDuration.fromJson(Map<String, dynamic> json) => BonusDuration(
    fileName: json["file_name"],
    videoType: json["videoType"],
  );

  Map<String, dynamic> toJson() => {
    "file_name": fileName,
    "videoType": videoType,
  };
}
