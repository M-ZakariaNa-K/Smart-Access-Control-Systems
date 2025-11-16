import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:example/alert.dart';


class $ {
  static String? _token="";
  static final String _URL = "http://89.116.236.10:8000/api";

  static Future<dynamic> get(String url) async {
    try {
      var response = await Dio().get(resolveUrl(url),
          options: Options(
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer $_token',
              },
              validateStatus: (v) {
                return v != null && v >= 200 && v <= 420;
              }));
      return responseHandler(response);
    } catch (e) {
      Alert.toast("Error connecting server! try again later.");
      print(e);
      return null;
    }
  }

  static Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    try {
      var form = FormData.fromMap(body ?? {}, ListFormat.multiCompatible);

      var response = await Dio().post(resolveUrl(url),
          data: form,
          options: Options(
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer $_token',
              },
              validateStatus: (v) {
                return v != null && v >= 200 && v <= 420;
              }));
      return responseHandler(response);
    } catch (e) {
      log("Error ${e.toString()}");
      Alert.toast("Error connecting server! try again later.");
      print(e);
      return null;
    }
  }


  static Future<dynamic> delete(String url) async {
    try {
      var response = await Dio().delete(resolveUrl(url),
          options: Options(
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'Accept': 'application/json',
                'Authorization': 'Bearer $_token',
              },
              validateStatus: (v) {
                return v != null && v >= 200 && v <= 420;
              }));
      return responseHandler(response);
    } catch (e) {

      Alert.toast("Error connecting server! try again later.");
      print(e);
      return null;
    }
  }

  static dynamic responseHandler(Response<dynamic> response) {
    final int? statusCode = response.statusCode;
    if (statusCode == 400) {
      dynamic body = response.data;
      Alert.infoDialog(message: body['message']);
    } else if (statusCode != null && statusCode >= 200 && statusCode < 300) {
      return response.data;
    } else {
      log(response.data.toString());
      Alert.infoDialog(
          message: 'Unknown error occurred! please try again later.');
    }
    return null;
  }


  static String resolveUrl(String url) {
    url = url[0] == '/' ? url.substring(1) : url;
    return url.contains('https') ? url : (_URL + '/' + url);
  }
}
