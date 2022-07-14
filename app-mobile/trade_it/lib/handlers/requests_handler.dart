import 'package:http/http.dart' as http;

class RequestHandler {
  String baseURL = "https://reqres.in/api/users";
  Future<String> getData(String url, {Map<String, String>? headers}) async {
    try {
      Uri requestURL = Uri.parse(baseURL);
      http.Response response = await http.get(requestURL, headers: headers);
      if (response.statusCode == 200) {
        print("Response is : ${response.body}");
        return response.body;
      } else {
        throw Error.safeToString("Error With Request Not 200 ");
      }
    } catch (error) {
      print(error);
      throw Error.safeToString("Error With Request");
    }
  }
}
