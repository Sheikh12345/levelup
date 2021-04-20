// To parse this JSON data, do
//
//     final allSkill = allSkillFromJson(jsonString);

import 'dart:convert';

AllSkill allSkillFromJson(String str) => AllSkill.fromJson(json.decode(str));

String allSkillToJson(AllSkill data) => json.encode(data.toJson());

class AllSkill{
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
  Skill skill4;
  Skill skill5;

  factory AllSkill.fromJson(Map<String, dynamic> json) => AllSkill(
        skill1: Skill.fromJson(json["skill1"]),
        skill2: Skill.fromJson(json["skill2"]),
        skill3: Skill.fromJson(json["skill3"]),
        skill4: Skill.fromJson(json["skill4"]),
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

class Skill{
  Skill({
    this.success,
    this.data,
    this.bonus,
    this.thumbnail,
    this.trailer,
    this.durations,
    this.title,
    this.description,
    this.price,
  });

  bool success;
  List<String> data;
  List<Bonus> bonus;
  List<String> thumbnail;
  List<String> trailer;
  List<Duration> durations;
  String title;
  String description;
  int price;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        success: json["success"],
        data: List<String>.from(json["data"].map((x) => x)),
        bonus: List<Bonus>.from(json["bonus"].map((x) => bonusValues.map[x])),
        thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
        trailer: List<String>.from(json["trailer"].map((x) => x)),
        durations: List<Duration>.from(
            json["durations"].map((x) => Duration.fromJson(x))),
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x)),
        "bonus": List<dynamic>.from(bonus.map((x) => bonusValues.reverse[x])),
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x)),
        "trailer": List<dynamic>.from(trailer.map((x) => x)),
        "durations": List<dynamic>.from(durations.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "price": price,
      };
}

enum Bonus { THE_1_MP4, THE_3_MP4, THE_2_MP4 }

final bonusValues = EnumValues({
  "1.mp4": Bonus.THE_1_MP4,
  "2.mp4": Bonus.THE_2_MP4,
  "3.mp4": Bonus.THE_3_MP4
});

class Duration {
  Duration({
    this.fileName,
    this.duration,
  });

  Bonus fileName;
  double duration;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        fileName: bonusValues.map[json["file_name"]],
        duration: json["duration"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "file_name": bonusValues.reverse[fileName],
        "duration": duration,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
