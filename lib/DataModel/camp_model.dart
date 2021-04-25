// To parse this JSON data, do
//
//     final campModel = campModelFromJson(jsonString);

import 'dart:convert';

CampModel campModelFromJson(String str) => CampModel.fromJson(json.decode(str));

String campModelToJson(CampModel data) => json.encode(data.toJson());

class CampModel {
  CampModel({
    this.success,
    this.count,
    this.data,
  });

  bool success;
  int count;
  List<Datum> data;

  factory CampModel.fromJson(Map<String, dynamic> json) => CampModel(
    success: json["success"],
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.campsIcon,
    this.price,
    this.month,
    this.level,
    this.available,
    this.camp,
    this.date,
    this.url,
    this.v,
  });

  String id;
  String campsIcon;
  int price;
  String month;
  String level;
  int available;
  String camp;
  String date;
  String url;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    campsIcon: json["campsicon"],
    price: json["price"],
    month: json["month"],
    level: json["level"],
    available: json["available"],
    camp: json["camp"],
    date: json["date"],
    url: json["url"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "campsicon": campsIcon,
    "price": price,
    "month": month,
    "level": level,
    "available": available,
    "camp": camp,
    "date": date,
    "url": url,
    "__v": v,
  };
}
