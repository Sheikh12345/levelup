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
    this.camp,
    this.price,
    this.date,
    this.available,
    this.level,
    this.campsLoc,
    this.month,
    this.v,
  });

  String id;
  String camp;
  int price;
  String date;
  int available;
  String level;
  String campsLoc;
  String month;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    camp: json["camp"],
    price: json["price"],
    date: json["date"],
    available: json["available"],
    level: json["level"],
    campsLoc: json["campsLoc"],
    month: json["month"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "camp": camp,
    "price": price,
    "date": date,
    "available": available,
    "level": level,
    "campsLoc": campsLoc,
    "month": month,
    "__v": v,
  };
}
