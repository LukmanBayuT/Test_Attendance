// To parse this JSON data, do
//
//     final userEdit = userEditFromJson(jsonString);

import 'dart:convert';

UserEdit userEditFromJson(String str) => UserEdit.fromJson(json.decode(str));

String userEditToJson(UserEdit data) => json.encode(data.toJson());

class UserEdit {
  UserEdit({
    this.groupCd,
    this.password,
    this.requestData,
    this.token,
    this.userId,
  });

  final String? groupCd;
  final String? password;
  final RequestData? requestData;
  final String? token;
  final String? userId;

  factory UserEdit.fromJson(Map<String, dynamic> json) => UserEdit(
        groupCd: json["GroupCD"],
        password: json["Password"],
        requestData: RequestData.fromJson(json["RequestData"]),
        token: json["Token"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "GroupCD": groupCd,
        "Password": password,
        "RequestData": requestData!.toJson(),
        "Token": token,
        "UserID": userId,
      };
}

class RequestData {
  RequestData({
    this.seq,
    this.nik,
    this.kdDept,
  });

  final String? seq;
  final String? nik;
  final String? kdDept;

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        seq: json["Seq"],
        nik: json["NIK"],
        kdDept: json["KdDept"],
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "NIK": nik,
        "KdDept": kdDept,
      };
}
