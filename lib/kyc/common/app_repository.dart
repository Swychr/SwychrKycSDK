import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_provider.dart';
import 'models.dart';
import 'package:mime/mime.dart';


class AppRepository {

  static String BASE_KYC_URL= "https://api.accountpe.com/api/kyc/business";


  static ApiProvider _provider = ApiProvider();





  // For Landing Page

  static Future<CurrentKycStatus>? getCurrentKYCStatus(String? email, String? api_key) async {
    var jsob_obj = {
      "email": email!,
    };
    final response = await _provider.postKyc(jsob_obj, "get_current_kyc_status", api_key!);
    if (response != null) {
      var ordered_accounts = CurrentKycStatus.fromJson(response) ;
      return ordered_accounts;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static Future<Map<String, dynamic>> addKYCBasicInfo(body_, String api_key) async {
    String body = json.encode(body_);
    var callUri = Uri.parse(BASE_KYC_URL+ "/add_basic_info");
    var res = await http.post(
      callUri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept':'application/vnd.accounts-backend.v1',
        'Api-Key': api_key
      },
      body: body,
    );
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> addKYCDocumentInfo(body_) async {
    String body = json.encode(body_);
    var callUri = Uri.parse(BASE_KYC_URL+ "/add_document_info");
    var res = await http.post(
      callUri,
      headers: {'Content-Type': 'application/json; charset=UTF-8',
        'Accept':'application/vnd.accounts-backend.v1',},
      body: body,
    );
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> addKYCLivilynessInfo(body_, String email, String api_key) async {
    String body = json.encode(body_);
    var callUri = Uri.parse(BASE_KYC_URL+ "/add_livilyness_info");
    var res = await http.post(
      callUri,
      headers: {'Content-Type': 'application/json; charset=UTF-8',
        'Accept':'application/vnd.accounts-backend.v1',},
      body: body,
    );
    return json.decode(res.body);
  }


  static Future<Map<String, dynamic>> uploadFiles(
      List<String> imgList, String apiKey, String email) async {
    final uri = Uri.parse("$BASE_KYC_URL/add_document_info");

    var request = http.MultipartRequest("POST", uri);

    // Add headers
    request.headers.addAll({
      'Accept': 'application/vnd.accounts-backend.v1',
      'Api-Key': apiKey,
    });

    // Add each file from the file paths list
    for (int i = 0; i < imgList.length; i++) {
      final filePath = imgList[i];
      final file = File(filePath);

      if (!file.existsSync()) {
        throw Exception("File not found: $filePath");
      }

      // Detect mime type
      final mimeType = lookupMimeType(filePath) ?? "image/png";
      final mimeSplit = mimeType.split('/');
      request.fields["email"] = email;
      request.files.add(
        await http.MultipartFile.fromPath(
          'files[]',               // ⚠️ change if backend expects 'file' or 'image[]'
          filePath,
          contentType: http.MediaType(mimeSplit[0], mimeSplit[1]),
        ),
      );
    }

    // Send request
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Upload failed: ${response.statusCode} → ${response.body}");
    }
  }

  static Future<Map<String, dynamic>> uploadLivileyFiles(
      String imgPath,  String email, String apiKey) async {
    final uri = Uri.parse("$BASE_KYC_URL/add_livilyness_info");

    var request = http.MultipartRequest("POST", uri);

    // Add headers
    request.headers.addAll({
      'Accept': 'application/vnd.accounts-backend.v1',
      'Api-Key': apiKey,
    });

    // Add each file from the file paths list

      final filePath = imgPath;
      final file = File(filePath);

      if (!file.existsSync()) {
        throw Exception("File not found: $filePath");
      }

      // Detect mime type
      final mimeType = lookupMimeType(filePath) ?? "image/png";
      final mimeSplit = mimeType.split('/');
      request.fields["email"] = email;
      request.files.add(
        await http.MultipartFile.fromPath(
          '_file',               // ⚠️ change if backend expects 'file' or 'image[]'
          filePath,
          contentType: http.MediaType(mimeSplit[0], mimeSplit[1]),
        ),
      );


    // Send request
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Upload failed: ${response.statusCode} → ${response.body}");
    }
  }
}































