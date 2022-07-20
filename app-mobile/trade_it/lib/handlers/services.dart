import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';
import 'package:http_parser/http_parser.dart';

class CommonServices {


  RequestHandler reqHandler = RequestHandler();

  get l => null;

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
    print(product.productImages![0].split('/').last);
    try{
     /* var formData = FormData.fromMap({
        'Title': product.title,
        'Descrioption': product.descrioption,
        'Price':product.price,
        'CityId':product.cityId,
        'AreaId':product.areaId,
        'SubcategoryId':product.subcategoryId,
        'UserId':product.userId,
        'image': await MultipartFile.fromFile(product.productImages![0],filename: product.productImages![0].split('/').last,contentType: MediaType("image", "jpg"),)
      });*/
      //var response = await Dio().post("http://10.0.2.2:5228/api/Product", data: formData);
      var request = http.MultipartRequest('POST', Uri.parse("http://10.0.2.2:5228/api/Product"));
      request.fields.addAll({
        'Title': product.title!,
        'Descrioption': product.descrioption!,
        'Price':product.price.toString(),
        'CityId':product.cityId.toString(),
        'AreaId':product.areaId.toString(),
        'SubcategoryId':product.subcategoryId.toString(),
        'UserId':product.userId.toString(),
      });
      request.files.add(await http.MultipartFile.fromPath("image", product.productImages![0],));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      var responseBytes = await response.stream.toBytes();
      var responseString = utf8.decode(responseBytes);
      if(response.statusCode == 200){

        return jsonDecode(responseString);
      }
      else if(response.statusCode == 400){
        print(responseString);
        throw Error.safeToString("Error With Request  400 ");
      }
      else{

        throw Error.safeToString("Error With Request Not 200 ");
      }
    } catch(error){
      print(error);
      throw Error.safeToString(error.toString());
    }
  }

}