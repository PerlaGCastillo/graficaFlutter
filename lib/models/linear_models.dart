import 'dart:convert';

List<LinearModel> linearModelFromJson(String str) => List<LinearModel>.from(
    json.decode(str).map((x) => LinearModel.fromJson(x)));

String linearModelToJson(List<LinearModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinearModel {
  LinearModel({
    required this.nombrE_PROMOTOR,
    required this.abiertos,
    required this.cerrados,
    required this.nO_INTERESADOS,
    required this.foto,
    required this.url,
  });

  String nombrE_PROMOTOR;
  int abiertos;
  int cerrados;
  int nO_INTERESADOS;
  String foto;
  String url;

  factory LinearModel.fromJson(Map<String, dynamic> json) => LinearModel(
    nombrE_PROMOTOR: json["nombrE_PROMOTOR"],
    abiertos: json["abiertos"],
    cerrados: json["cerrados"],
    nO_INTERESADOS: json["nO_INTERESADOS"],
    foto: json["foto"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "nombrE_PROMOTOR": nombrE_PROMOTOR,
    "abiertos": abiertos,
    "cerrados": cerrados,
    "nO_INTERESADOS": nO_INTERESADOS,
    "foto": foto,
    "url": url,
  };
}