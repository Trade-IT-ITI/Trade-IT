import 'package:http/http.dart' as http;

class RequestHandler {
  Future<String> getData(String _url, Map<String, String> headers) async {
    try {
      var url = Uri.parse(_url);
      http.Response response = await http.get(url, headers: headers);
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
