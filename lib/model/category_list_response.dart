// To parse this JSON data, do
//
//     final categoryListResponse = categoryListResponseFromJson(jsonString);

import 'dart:convert';

CategoryListResponse categoryListResponseFromJson(String str) =>
    CategoryListResponse.fromJson(json.decode(str));

String categoryListResponseToJson(CategoryListResponse data) =>
    json.encode(data.toJson());

class CategoryListResponse {
  CategoryListResponse({
    this.result,
    this.data,
    this.message,
  });

  final int? result;
  final List<Datum>? data;
  final String? message;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      CategoryListResponse(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.seq,
    this.kdDept,
    this.category,
  });

  final String? seq;
  final String? kdDept;
  final String? category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        seq: json["Seq"],
        kdDept: json["KdDept"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "KdDept": kdDept,
        "Category": category,
      };
}
