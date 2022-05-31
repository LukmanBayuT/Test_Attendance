// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) =>
    CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
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

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
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
    this.type,
    this.txtSearch,
    this.kdDept,
  });

  final String? type;
  final String? txtSearch;
  final String? kdDept;

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        type: json["Type"],
        txtSearch: json["TxtSearch"],
        kdDept: json["KdDept"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "TxtSearch": txtSearch,
        "KdDept": kdDept,
      };
}
