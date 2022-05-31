// To parse this JSON data, do
//
//     final updateActivity = updateActivityFromJson(jsonString);

import 'dart:convert';

UpdateActivity updateActivityFromJson(String str) =>
    UpdateActivity.fromJson(json.decode(str));

String updateActivityToJson(UpdateActivity data) => json.encode(data.toJson());

class UpdateActivity {
  UpdateActivity({
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

  factory UpdateActivity.fromJson(Map<String, dynamic> json) => UpdateActivity(
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
    this.seq,
    this.nik,
    this.kdDept,
    this.actDate,
    this.timeIn,
    this.timeOut,
    this.categorySeq,
    this.activity,
    this.deadline,
    this.remark,
    this.status,
    this.savedBy,
  });

  final String? seq;
  final String? nik;
  final String? kdDept;
  final String? actDate;
  final String? timeIn;
  final String? timeOut;
  final String? categorySeq;
  final String? activity;
  final DateTime? deadline;
  final String? remark;
  final String? status;
  final String? savedBy;

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        seq: json["Seq"],
        nik: json["NIK"],
        kdDept: json["KdDept"],
        actDate: json["ActDate"],
        timeIn: json["TimeIn"],
        timeOut: json["TimeOut"],
        categorySeq: json["CategorySeq"],
        activity: json["Activity"],
        deadline: DateTime.parse(json["Deadline"]),
        remark: json["Remark"],
        status: json["Status"],
        savedBy: json["SavedBy"],
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "NIK": nik,
        "KdDept": kdDept,
        "ActDate": actDate,
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "CategorySeq": categorySeq,
        "Activity": activity,
        "Deadline":
            "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "Remark": remark,
        "Status": status,
        "SavedBy": savedBy,
      };
}
