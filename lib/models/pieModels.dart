import 'dart:convert';

List<PieModel> pieModelFromJson(String str) => List<PieModel>.from(
    json.decode(str).map((x) => PieModel.fromJson(x)));

String pieModelToJson(List<PieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PieModel {
  PieModel({
    required this.abiertos,
    required this.cerrados,
  });

  String abiertos;
  int cerrados;

  factory PieModel.fromJson(Map<String, dynamic> json) => PieModel(
    abiertos: json["abiertos"],
    cerrados: json["cerrados"],
  );

  Map<String, dynamic> toJson() => {
    "abiertos": abiertos,
    "cerrados": cerrados,
  };
}