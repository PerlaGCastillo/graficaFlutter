import 'dart:convert';

List<BarModel> barModelFromJson(String str) => List<BarModel>.from(
    json.decode(str).map((x) => BarModel.fromJson(x)));

String barModelToJson(List<BarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarModel {
  BarModel({
    required this.origen,
    required this.total,
  });

  String origen;
  int total;

  factory BarModel.fromJson(Map<String, dynamic> json) => BarModel(
    origen: json["origen"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "origen": origen,
    "total": total,
  };
}