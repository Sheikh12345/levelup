// To parse this JSON data, do
//
//     final skill = skillFromJson(jsonString);

import 'dart:convert';

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));

String skillToJson(Skill data) => json.encode(data.toJson());

class Skill {
  Skill({
    this.success,
    this.data,
    this.bonus,
    this.thumbnail,
    this.trailer,
    this.title,
    this.description,
    this.price,
  });

  bool success;
  List<String> data;
  List<String> bonus;
  List<String> thumbnail;
  List<String> trailer;
  String title;
  String description;
  int price;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    success: json["success"],
    data: List<String>.from(json["data"].map((x) => x)),
    bonus: List<String>.from(json["bonus"].map((x) => x)),
    thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
    trailer: List<String>.from(json["trailer"].map((x) => x)),
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
    "title": title,
    "description": description,
    "price": price,
  };
}
