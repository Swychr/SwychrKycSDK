import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'custom_exception.dart';



class ApiProvider {

  static const String _baseKycUrl = "https://api.accountpe.com/api/kyc/business/";

  Future<dynamic> postKyc(var params, String? url, String api_key) async {
    var responseJson;
    try {
      var uri = Uri.parse(_baseKycUrl + url!);
      final http.Response response = await http.post(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept':'application/vnd.accounts-backend.v1',
            'Api-Key': api_key
          },

          body: jsonEncode(params),
          encoding: Encoding.getByName("utf-8"));
      responseJson = _response(response);
    } catch (e) {

      throw Exception(e.toString());
    }
    return responseJson;
  }





  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      //Navigator is used here to go to login only with 401 status code
        return null;

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }

  dynamic _mobile_response(http.Response response, BuildContext context) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

        //Navigator is used here to go to login only with 401 status code
        return null;

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }
}
