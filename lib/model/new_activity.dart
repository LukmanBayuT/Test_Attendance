// To parse this JSON data, do
//
//     final newActivity = newActivityFromJson(jsonString);

import 'dart:convert';

NewActivity newActivityFromJson(String str) =>
    NewActivity.fromJson(json.decode(str));

String newActivityToJson(NewActivity data) => json.encode(data.toJson());

class NewActivity {
  NewActivity({
    this.userId,
    this.password,
    this.token,
    this.groupCd,
    this.requestData,
  });

  final String? userId;
  final String? password;
  final String? token;
  final String? groupCd;
  final RequestData? requestData;

  factory NewActivity.fromJson(Map<String, dynamic> json) => NewActivity(
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
  RequestData({
    this.nik,
    this.kdDept,
    this.actDate,
    this.timeIn,
    this.timeOut,
    this.categorySeq,
    this.activity,
    this.deadline,
    this.remark,
    this.savedBy,
  });

  final String? nik;
  final String? kdDept;
  final DateTime? actDate;
  final String? timeIn;
  final String? timeOut;
  final String? categorySeq;
  final String? activity;
  final DateTime? deadline;
  final String? remark;
  final String? savedBy;

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        nik: json["NIK"],
        kdDept: json["KdDept"],
        actDate: DateTime.parse(json["ActDate"]),
        timeIn: json["TimeIn"],
        timeOut: json["TimeOut"],
        categorySeq: json["CategorySeq"],
        activity: json["Activity"],
        deadline: DateTime.parse(json["Deadline"]),
        remark: json["Remark"],
        savedBy: json["SavedBy"],
      );

  Map<String, dynamic> toJson() => {
        "NIK": nik,
        "KdDept": kdDept,
        "ActDate":
            "${actDate!.year.toString().padLeft(4, '0')}-${actDate!.month.toString().padLeft(2, '0')}-${actDate!.day.toString().padLeft(2, '0')}",
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "CategorySeq": categorySeq,
        "Activity": activity,
        "Deadline":
            "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "Remark": remark,
        "SavedBy": savedBy,
      };
}
