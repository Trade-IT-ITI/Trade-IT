import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RequestHandler {
  String baseURL = "http://10.0.2.2:5228/api/";
  //String baseURL = "http://localhost:5228/api/";

  Future<String> getData(String url, {Map<String, String>? headers}) async {
    try {
      Uri requestURL = Uri.parse(url);
      print("URL : ${requestURL.toString()}");
      http.Response response = await http
          .get(requestURL, headers: headers)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        //print("Response is : ${response.body}");
        return response.body;
      } else {
        throw Error.safeToString("Error With Request Not 200 ");
      }
    } catch (error) {
      print(error);
      throw Error.safeToString("Error With Get Request Handler");
    }
  }

  Future<String> postData(String url, {Map<String, dynamic>? bodyMap}) async {
    try {
      print(url);
      Uri requestURL = Uri.parse(url);
      var response = await http.post(
        requestURL,
        body: jsonEncode(bodyMap),
        headers: {"Content-Type": "application/json"},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print("Response is : ${response.body}");
        return response.body;
      } else {
        return "error";
        //print("error");
        //throw Error.safeToString("Error With Request Not 200 ");
      }
    } catch (error) {
      print(error);
      throw Error.safeToString("Error With Post Request Handler");
    }
  }

  String createUrlParams({
    required String fullUrl,
    required List<String> queryParams,
    inFilter = false,
  }) {
    String finalURL = fullUrl;
    for (int i = 0; i < queryParams.length; i++) {
      if (inFilter) {
        finalURL += "&expand=${queryParams[i]}";
      } else {
        finalURL +=
            i == 0 ? "?expand=${queryParams[i]}" : "&expand=${queryParams[i]}";
      }
    }
    return finalURL;
  }

  Future<http.Response> post(String url, {Map<String, String>? headers, required Map<String, dynamic> body, String? bearerToken}) async {
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer bearerToken',
      }).timeout(const Duration(seconds: 10));
          print(response.statusCode);
      return response;
    } catch (error) {
      throw Error.safeToString(error);
    }
  }


  Future<int> increaseViews(int id)async{
    http.Response response= await http.put(Uri.parse(baseURL+ "/Product/increase?id=$id"));
    print(response.statusCode);
    return response.statusCode;
  }
}
