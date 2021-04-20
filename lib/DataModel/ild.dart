// To parse this JSON data, do
//
//     final ild = ildFromJson(jsonString);

import 'dart:convert';

Ild ildFromJson(String str) => Ild.fromJson(json.decode(str));

String ildToJson(Ild data) => json.encode(data.toJson());

class Ild{
  Ild({
    this.success,
    this.data,
  });

  bool success;
  List<String> data;

  factory Ild.fromJson(Map<String, dynamic> json) => Ild(
    success: json["success"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
