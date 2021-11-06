// @dart=2.9
import 'dart:async';
import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/utils/message_handler.dart';

class NetworkUtil {
  static NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  Future<http.Response> get(
      BuildContext context, String url, Map<String, String> headers) async {
    try {
      return http
          .get(Uri.parse(url), headers: headers)
          .then((http.Response response) async {
        return handleResponse(context, response, url);
      }).catchError((onError) {
        MessageHandler.showError(context, "Tip", "Check Internet Connection");
        return null;
      });
    } catch (ex) {
      MessageHandler.showError(context, "Tip", "Check Internet Connection");
      return null;
    }
  }

  Future<http.Response> handleResponse(
      BuildContext context, http.Response response, String url) async {
    final int statusCode = response.statusCode;

    // if (response.statusCode == 403 || response.statusCode == 417) {
    //   var value = await DatabaseHelper.getData(DataKeyValue.forceUpdateExist);
    //   if (value == null || value == "") {
    //     var accStatus = await DatabaseHelper.getData(DataKeyValue.accountExist);
    //     if (accStatus == null || accStatus == "") {
    //       await DatabaseHelper.setData("exists", DataKeyValue.accountExist);
    //       await MessageHandler.comfirmDialgRelogin(
    //           context, Tran.of(context).text("youNeedLogin"));
    //       return response;
    //     } else {
    //       Navigator.of(context).pop();
    //       return response;
    //     }
    //   }
    //   return response;
    // }
    // if (response.statusCode == 423) {
    //   var value = await DatabaseHelper.getData(DataKeyValue.forceUpdateExist);
    //   if (value == null || value == "") {
    //     var accStatus = await DatabaseHelper.getData(DataKeyValue.accountExist);
    //     if (accStatus == null || accStatus == "") {
    //       await DatabaseHelper.setData("exists", DataKeyValue.accountExist);
    //       await MessageHandler.comfirmDialgRelogin(
    //           context, Tran.of(context).text("youwaspushLogout"));
    //       return response;
    //     } else {
    //       Navigator.of(context).pop();
    //       return response;
    //     }
    //   }
    //   return response;
    // }

    if (response.statusCode == 505) {
      // var body = json.decode(response.body);
      // if(body!=null&&body["message"]!=null){
      //   var accStatus = await DatabaseHelper.getData(DataKeyValue.forceUpdateExist);
      //   if(accStatus ==null || accStatus=="") {
      //     await DatabaseHelper.setData("exists", DataKeyValue.forceUpdateExist);
      //     if (Platform.isAndroid) {
      //       await MessageHandler.foceUpdateVersion(
      //           context, body["message"], body["androidLink"]);
      //       return response;
      //     }
      //     if (Platform.isIOS) {
      //       await MessageHandler.foceUpdateVersion(
      //           context, body["message"], body["iosAppLink"]);
      //       return response;
      //     }
      //   }
      // }
      //await DatabaseHelper.setData("", DataKeyValue.forceUpdateExist);
      return response;
    }
    if (response.statusCode == 410) {
      var body = json.decode(response.body);
      if (body != null && body["Message"] != null)
        MessageHandler.showError(context, "Tip", body["Message"]);
      return response;
    }
    if (statusCode == 401 || statusCode == 304 || statusCode == 416) {
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 403) {
      MessageHandler.showError(context, "Tip", "You may need to Log in");
      return response;
    }
    if (statusCode == 404) {
      MessageHandler.showError(context, "Tip", "Not found");
      //showError(context,"Not found");
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 405) {
      MessageHandler.showError(context, "Tip", "Access right limited");
      //showError(context,"Access right limited");
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 406) {
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 415) {
      MessageHandler.showError(context, "Tip", "Access right limited");
      //showError(context,"Access right limited");
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 500) {
      MessageHandler.showError(context, "Tip", "Internal server error");
      //print(url);
      return response;
      //throw  Exception("Unauthorized or Logout then login again");
    }
    if (statusCode == 400) {
      return response;
    }
    if (statusCode != 200) {
      var body = json.decode(response.body);
      String msg = body["error_description"];
      msg = msg == null || msg == "" ? body["Message"] : msg;
      if (msg != null && msg.isNotEmpty) {
        MessageHandler.showError(context, "Tip", msg);
        return null;
      }
      MessageHandler.showError(context, "Tip",
          "System Data Error"); //Tran.of(context).text("sys_errorFeachData")
      return response;
    }
    return response;
  }
}
