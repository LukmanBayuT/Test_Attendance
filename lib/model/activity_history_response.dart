// To parse this JSON data, do
//
//     final activityHistoryResponse = activityHistoryResponseFromJson(jsonString);

import 'dart:convert';

ActivityHistoryResponse activityHistoryResponseFromJson(String str) =>
    ActivityHistoryResponse.fromJson(json.decode(str));

String activityHistoryResponseToJson(ActivityHistoryResponse data) =>
    json.encode(data.toJson());

class ActivityHistoryResponse {
  final int? result;
  final List<Datum>? data;
  final String? message;

  ActivityHistoryResponse({
    this.result,
    this.data,
    this.message,
  });

  factory ActivityHistoryResponse.fromJson(Map<String, dynamic> json) =>
      ActivityHistoryResponse(
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
  final String? seq;
  final String? nik;
  final String? namaKaryawan;
  final String? namaHead;
  final String? kdDept;
  final String? department;
  final DateTime? actDate;
  final DateTime? deadline;
  final String? timeIn;
  final String? timeOut;
  final String? status;
  final String? category;
  final DateTime? createdDate;
  final String? activity;
  final String? remark;

  Datum({
    this.seq,
    this.nik,
    this.namaKaryawan,
    this.namaHead,
    this.kdDept,
    this.department,
    this.actDate,
    this.deadline,
    this.timeIn,
    this.timeOut,
    this.status,
    this.category,
    this.createdDate,
    this.activity,
    this.remark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        seq: json["Seq"],
        nik: json["NIK"],
        namaKaryawan: json["NamaKaryawan"],
        namaHead: json["NamaHead"],
        kdDept: json["KdDept"],
        department: json["Department"],
        actDate: DateTime.parse(json["ActDate"]),
        deadline: DateTime.parse(json["Deadline"]),
        timeIn: json["TimeIn"],
        timeOut: json["TimeOut"],
        status: json["Status"],
        category: json["Category"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        activity: json["Activity"],
        remark: json["Remark"],
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "NIK": nik,
        "NamaKaryawan": namaKaryawan,
        "NamaHead": namaHead,
        "KdDept": kdDept,
        "Department": department,
        "ActDate":
            "${actDate!.year.toString().padLeft(4, '0')}-${actDate!.month.toString().padLeft(2, '0')}-${actDate!.day.toString().padLeft(2, '0')}",
        "Deadline":
            "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "Status": status,
        "Category": category,
        "CreatedDate": createdDate!.toIso8601String(),
        "Activity": activity,
        "Remark": remark,
      };
}
