// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:projectkb/const/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:projectkb/model/activity_history_response.dart';
import 'package:projectkb/model/category_list_response.dart';
import 'package:projectkb/model/new_activity_response.dart';
import 'package:projectkb/model/update_activity_response.dart';
import 'package:projectkb/model/user_edit_response.dart';

class ServicesAPI {
  Future<ActivityHistoryResponse> getActivityHistory(String status) async {
    var ahResponse = await http.post(
      Uri.parse(Endpoint.baseApi + Endpoint.activityHistory),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "UserID": "intranet",
          "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
          "Token":
              "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
          "GroupCD": "adm",
          "RequestData": {
            "NIK": "87654321",
            "FromDate": "",
            "ToDate": "",
            "Status": status,
          }
        },
      ),
    );
    print(ahResponse.body);
    return activityHistoryResponseFromJson(ahResponse.body);
  }

  Future<CategoryListResponse> getCategoryList() async {
    var clResponse = await http.post(
      Uri.parse(Endpoint.baseApi + Endpoint.categoryList),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "UserID": "intranet",
          "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
          "Token":
              "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
          "GroupCD": "ADM",
          "RequestData": {
            "Type": "Dropdown",
            "TxtSearch": "Category",
            "KdDept": "04"
          }
        },
      ),
    );
    print(clResponse.body);
    return categoryListResponseFromJson(clResponse.body);
  }

  Future<NewActivityResponse> postNewActivity(
      String tanggalAwal, tanggalAkhir, waktuAwal, waktuAkhir, remarks) async {
    var naResponse = await http.post(
      Uri.parse(Endpoint.baseApi + Endpoint.newActivity),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "UserID": "intranet",
          "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
          "Token":
              "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
          "GroupCD": "adm",
          "RequestData": {
            "NIK": "87654321",
            "KdDept": "04",
            "ActDate": tanggalAwal,
            "TimeIn": waktuAwal,
            "TimeOut": waktuAkhir,
            "CategorySeq": "1",
            "Activity": "Project Test",
            "Deadline": tanggalAkhir,
            "Remark": remarks,
            "SavedBy": "123456"
          }
        },
      ),
    );
    print(naResponse.body);
    Future.delayed(const Duration(seconds: 2)).then((value) => Get.back());
    return newActivityResponseFromJson(naResponse.body);
  }

  Future<UserEditResponse> postUserEdit() async {
    var ueResponse = await http.post(
      Uri.parse(Endpoint.baseApi + Endpoint.editActivity),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "GroupCD": "adm",
          "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
          "RequestData": {"Seq": "1", "NIK": "11111111", "KdDept": "04"},
          "Token":
              "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
          "UserID": "intranet"
        },
      ),
    );
    print(ueResponse.body);
    return userEditResponseFromJson(ueResponse.body);
  }

  Future<UpdateActivityResponse> postUpdateActivity(String seq, actDate, timeIn,
      timeOut, deadline, activity, remark, status) async {
    var uaResponse = await http.post(
      Uri.parse(Endpoint.baseApi + Endpoint.updateActivity),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "UserID": "intranet",
          "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
          "Token":
              "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
          "GroupCD": "adm",
          "RequestData": {
            "Seq": seq,
            "NIK": "87654321",
            "KdDept": "04",
            "ActDate": actDate,
            "TimeIn": timeIn,
            "TimeOut": timeOut,
            "CategorySeq": "04",
            "Activity": activity,
            "Deadline": deadline,
            "Remark": remark,
            "Status": status,
            "SavedBy": "87654321",
          }
        },
      ),
    );
    print(uaResponse.body);
    Get.back();
    return updateActivityResponseFromJson(uaResponse.body);
  }
}
