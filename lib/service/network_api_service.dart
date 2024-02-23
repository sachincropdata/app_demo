import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:my_cropdata_test/utility/app_prefrences.dart';
import 'package:my_cropdata_test/utility/constant.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class NetworkApiService {
  Map<String, String> defaultAuthenticationHeader(String jwt) {
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $jwt",
    };
  }

  Uri commonUriProtocol(
    String authority, [
    String? unencodedPath,
    Map<String, dynamic>? queryParameters,
  ]) {
    return Uri.https(authority, unencodedPath ?? "", queryParameters);
  }

  Future getGetApiResponse(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      //final response = await http.get(Uri.parse(url));
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
        // use jsonEncode()
      );
      responseJson = jsonDecode(response.body);
    } catch (e) {
      e.toString();
    }
    return responseJson;
  }

  Future getPostApiResponse({required String endPoint, dynamic data}) async {
    String jwt = await AppPreferences.fetchStringValuePef("") ?? "";

    dynamic responseJson;
    try {
      Map<String, String> headers = defaultAuthenticationHeader(jwt);

      var response = await http.post(
        commonUriProtocol(BASE_URL, BASE_URL_SUFFIX + endPoint),
        headers: headers,
        body: jsonEncode(data), // use jsonEncode()
      );
      responseJson = jsonDecode(response.body);
    } catch (e) {
      e.toString();
    }
    return responseJson;
  }

  Future getPatchApiResponse({required String endPoint, dynamic data}) async {
    dynamic responseJson;
    try {
      //?GET JWT FROM PREFERENCES
      String jwt = await AppPreferences.fetchStringValuePef("") ?? "";
      //? Common Method to Return HEADER WITH AUTH TOKEN
      Map<String, String> headers = defaultAuthenticationHeader(jwt);

      var response = await http.patch(
        commonUriProtocol(BASE_URL, BASE_URL_SUFFIX + endPoint),
        headers: headers,
        body: jsonEncode(data), // use jsonEncode()
      );
      responseJson = jsonDecode(response.body);

      return responseJson;
    } catch (e) {
      e.toString();
    }
  }

  // This method is used for MultipartRequest of API to send files with body to server
  Future getMultipartPostApiResponse(
      {required String endPoint,
      required List<File> imageFiles,
      required int entityId,
      required int widgetId,
      required String strDeletedIds}) async {
    dynamic responseJson;
    try {
      String jwt = await AppPreferences.fetchStringValuePef("") ?? "";
      Map<String, String> headers = defaultAuthenticationHeader(jwt);
      http.MultipartRequest request = http.MultipartRequest(
          'PATCH', commonUriProtocol(BASE_URL, BASE_URL_SUFFIX + endPoint));
      request.headers.addAll(headers);
      request.fields["Key"] = entityId.toString();
      request.fields["Key"] = widgetId.toString();
      request.fields["Key"] = strDeletedIds;

      List<MultipartFile> newList = [];
      for (int i = 0; i < imageFiles.length; i++) {
        var stream = http.ByteStream(imageFiles[i].openRead());
        stream.cast();
        var length = await imageFiles[i].length();
        var multipartFile = http.MultipartFile(
          "files",
          stream,
          length,
          filename: basename(imageFiles[i].path),
        );
        newList.add(multipartFile);
      }
      request.files.addAll(newList);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      responseJson = jsonDecode(responseString);
    } catch (e) {
      e.toString();
    }
    return responseJson;
  }
}
