import 'package:http/http.dart' as http;

class RequestHandler {
  String baseURL = "http://10.0.2.2:5228/api/";
  //String baseURL = "http://localhost:5228/api/";
  Future<String> getData(String url, {Map<String, String>? headers}) async {
    try {
      Uri requestURL = Uri.parse(url);
      print("URL : ${url}");
      http.Response response = await http.get(requestURL, headers: headers);
      if (response.statusCode == 200) {
        //print("Response is : ${response.body}");
        return response.body;
      } else {
        throw Error.safeToString("Error With Request Not 200 ");
      }
    } catch (error) {
      print(error);
      throw Error.safeToString("Error With Request Handler");
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
}
