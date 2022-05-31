// To parse this JSON data, do
//
//     final userEditResponse = userEditResponseFromJson(jsonString);

import 'dart:convert';

UserEditResponse userEditResponseFromJson(String str) =>
    UserEditResponse.fromJson(json.decode(str));

String userEditResponseToJson(UserEditResponse data) =>
    json.encode(data.toJson());

class UserEditResponse {
  UserEditResponse({
    this.result,
    this.data,
    this.message,
  });

  final int? result;
  final List<Datum>? data;
  final String? message;

  factory UserEditResponse.fromJson(Map<String, dynamic> json) =>
      UserEditResponse(
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
    this.kdDept,
    this.seq,
    this.nik,
    this.actDate,
    this.categorySeq,
    this.deadline,
    this.timeIn,
    this.timeOut,
    this.status,
    this.level,
    this.activity,
    this.remark,
  });

  final String? kdDept;
  final String? seq;
  final String? nik;
  final DateTime? actDate;
  final String? categorySeq;
  final DateTime? deadline;
  final String? timeIn;
  final String? timeOut;
  final String? status;
  final dynamic level;
  final String? activity;
  final String? remark;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kdDept: json["KdDept"],
        seq: json["Seq"],
        nik: json["NIK"],
        actDate: DateTime.parse(json["ActDate"]),
        categorySeq: json["CategorySeq"],
        deadline: DateTime.parse(json["Deadline"]),
        timeIn: json["TimeIn"],
        timeOut: json["TimeOut"],
        status: json["Status"],
        level: json["Level"],
        activity: json["Activity"],
        remark: json["Remark"],
      );

  Map<String, dynamic> toJson() => {
        "KdDept": kdDept,
        "Seq": seq,
        "NIK": nik,
        "ActDate":
            "${actDate!.year.toString().padLeft(4, '0')}-${actDate!.month.toString().padLeft(2, '0')}-${actDate!.day.toString().padLeft(2, '0')}",
        "CategorySeq": categorySeq,
        "Deadline":
            "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "Status": status,
        "Level": level,
        "Activity": activity,
        "Remark": remark,
      };
}
