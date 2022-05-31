// To parse this JSON data, do
//
//     final newActivityResponse = newActivityResponseFromJson(jsonString);

import 'dart:convert';

NewActivityResponse newActivityResponseFromJson(String str) =>
    NewActivityResponse.fromJson(json.decode(str));

String newActivityResponseToJson(NewActivityResponse data) =>
    json.encode(data.toJson());

class NewActivityResponse {
  NewActivityResponse({
    this.result,
    this.message,
  });

  final int? result;
  final String? message;

  factory NewActivityResponse.fromJson(Map<String, dynamic> json) =>
      NewActivityResponse(
        result: json["result"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
      };
}
