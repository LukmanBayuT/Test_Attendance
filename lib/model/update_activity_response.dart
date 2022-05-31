// To parse this JSON data, do
//
//     final updateActivityResponse = updateActivityResponseFromJson(jsonString);

import 'dart:convert';

UpdateActivityResponse updateActivityResponseFromJson(String str) =>
    UpdateActivityResponse.fromJson(json.decode(str));

String updateActivityResponseToJson(UpdateActivityResponse data) =>
    json.encode(data.toJson());

class UpdateActivityResponse {
  UpdateActivityResponse({
    this.result,
    this.message,
  });

  final int? result;
  final String? message;

  factory UpdateActivityResponse.fromJson(Map<String, dynamic> json) =>
      UpdateActivityResponse(
        result: json["result"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
      };
}
