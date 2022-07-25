import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';

class CommonServices {


  RequestHandler reqHandler = RequestHandler();

  Future<List<Category>> getCategories() async {
    String response =
    await reqHandler.getData(reqHandler.createUrlParams(fullUrl: reqHandler.baseURL+ "Category", queryParams: ["Subcategories"]));
    //print(response);
    Iterable categoriesJson = jsonDecode(response);
    List<Category> categories = categoriesJson
        .map((category) => Category.fromJson(category))
        .toList();
    return categories;
  }

  Future<List<City>> getCities() async{
    String response = await reqHandler.getData(reqHandler.createUrlParams(fullUrl:reqHandler.baseURL+ "City", queryParams: ["Areas"]));
    Iterable jsonData = jsonDecode(response);
    List<City> cities = jsonData.map((city) => City.fromJson(city)).toList();
    return cities;
  }

  Future<String> addProduct(Product product)async{
    try{
      var request = http.MultipartRequest('POST', Uri.parse("http://10.0.2.2:5228/api/Product"));
      request.fields.addAll({
        'Title': product.title!,
        'Descrioption': product.descrioption!,
        'Price':product.price.toString(),
        'CityId':product.cityId.toString(),
        'AreaId':product.areaId.toString(),
        'SubcategoryId':product.subcategoryId.toString(),
        'UserId':product.userId.toString(),
        'postDateTime':DateTime.now().toString(),
        "statusId": "1",
      });
      request.files.add(await http.MultipartFile.fromPath("image", product.productImages![0],));
      http.StreamedResponse response = await request.send().timeout(const Duration(seconds: 10));
      print(response.statusCode);
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      if(response.statusCode == 201 || response.statusCode == 200){

        return responseString;
      }
      else{
        throw Error.safeToString(responseString);
      }
    } catch(error){
      print(error);
      throw Error.safeToString(error.toString());
    }
  }

}