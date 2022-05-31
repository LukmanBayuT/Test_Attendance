// To parse this JSON data, do
//
//     final activityHistory = activityHistoryFromJson(jsonString);

import 'dart:convert';

ActivityHistory activityHistoryFromJson(String str) =>
    ActivityHistory.fromJson(json.decode(str));

String activityHistoryToJson(ActivityHistory data) =>
    json.encode(data.toJson());

class ActivityHistory {
  final String? userId;
  final String? password;
  final String? token;
  final String? groupCd;
  final RequestData? requestData;
  ActivityHistory({
    this.userId,
    this.password,
    this.token,
    this.groupCd,
    this.requestData,
  });

  factory ActivityHistory.fromJson(Map<String, dynamic> json) =>
      ActivityHistory(
        userId: json["UserID"],
        password: json["Password"],
        token: json["Token"],
        groupCd: json["GroupCD"],
        requestData: RequestData.fromJson(json["RequestData"]),
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "Password": password,
        "Token": token,
        "GroupCD": groupCd,
        "RequestData": requestData!.toJson(),
      };
}

class RequestData {
  final String? nik;
  final String? fromDate;
  final String? toDate;
  final String? status;

  RequestData({
    this.nik,
    this.fromDate,
    this.toDate,
    this.status,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        nik: json["NIK"],
        fromDate: json["FromDate"],
        toDate: json["ToDate"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "FromDate": fromDate,
        "ToDate": toDate,
        "Status": status,
      };
}
