import 'dart:convert';
import 'dart:io';

import 'package:advans_app/Models/LoanApplicationModel.dart';
import 'package:advans_app/Models/LoginModel.dart';
import 'package:advans_app/Utils/Constants/Constanst.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = Constants.baseUrl;
    timeout = const Duration(seconds: 30);
    token = GetStorage().read('TOKEN') ?? "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> postData2(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      });
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response =
          await get(uri, headers: headers ?? _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getDataWithParms(String uri,
      {Map<String, String>? headers,
      required Map<String, String> query}) async {
    try {
      Response response =
          await get(uri, headers: headers ?? _mainHeaders, query: query)
              .then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getDataWithParams(String uri,
      {Map<String, String>? headers,
      required Map<String, dynamic> queryParameters}) async {
    try {
      Response response = await get(uri,
              headers: headers ?? _mainHeaders, query: queryParameters)
          .then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response =
          await post(uri, body, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);

        return value;
      });
      print(response);
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<http.Response> postDataWithFile(
    String uri,
    LoanApplication body,
    List<File> files,
  ) async {
    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl! + uri));
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields['productName'] = body.productName;
      // Add fields to the request
      request.fields['nationalite'] = body.nationalite;
      request.fields['age'] = body.age.toString();
      request.fields['fullName'] = body.fullName;
      request.fields['experienceDuration'] = body.experienceDuration.toString();
      request.fields['loanPurpose'] = body.loanPurpose.toString();
      request.fields['governorat'] = body.governorat.toString();
      request.fields['activityAdresse'] = body.activityAdresse.toString();
      request.fields['customer'] = body.customer.toString();
      request.fields['clientId'] = body.clientId.toString();
      request.fields['activityType'] = body.activityType.toString();
      request.fields['previousMicrofinanceInstitution'] =
          body.previousMicrofinanceInstitution.toString();
      request.fields['requestedCreditAmount'] =
          body.requestedCreditAmount.toString();

      // Add supporting documents
      for (var file in files) {
        // Read file contents as bytes
        List<int> fileBytes = await file.readAsBytes();

        // Determine mime type
        final mimeType =
            lookupMimeType(file.path) ?? 'application/octet-stream';

        // Create multipart file
        var multipartFile = http.MultipartFile.fromBytes(
          'supportingDocument',
          fileBytes,
          filename: file.path.split('/').last,
          contentType: MediaType.parse(mimeType),
        );

        // Add multipart file to request
        request.files.add(multipartFile);
      }

      // Send the request
      var streamedResponse = await request.send();

      // Convert streamedResponse to http.Response
      var response = await http.Response.fromStream(streamedResponse);

      // Check if authentication is needed
      if (response.statusCode == 401) {
        print('Unauthorized: Invalid token or authentication required.');
      }

      print(response.body);
      return response;
    } catch (e, stack) {
      // Handle errors
      print(e);
      return http.Response('Error: $e', 500);
    }
  }

  Future<Response> putData(String uri, dynamic body) async {
    try {
      Response response =
          await put(uri, body, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri, dynamic body) async {
    try {
      Response response =
          await delete(uri, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e, stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void notAuthenticated(Response<dynamic> res, String uri) {
    if (res.statusCode == 401) {
      print("User is not authenticated.");
      //TODO : test if user is not authorized
      Get.offAllNamed(routesGuide.getOnLanding());
    } else if (res.statusCode != 200 && res.statusCode != 201) {
      print("Server error: ${res.statusCode}");
      //TODO : test if there's any other type of exception
    }
  }
}
