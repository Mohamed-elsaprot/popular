import 'package:dio/dio.dart';

class ApiService{
  static const Map<String,dynamic> header= {'Content-Type':'application/json'};
  static const baseUrl = 'https://api.themoviedb.org/3/person/';
  static const key = '2dfe23358236069710a379edd4c65a6b';
  static const imagesBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  static Dio dio = Dio(BaseOptions(headers: header));
  static Future<Map<String,dynamic>> getPopularList()async{
    Response res = await dio.get('${baseUrl}popular?api_key=$key');
    return res.data;
  }

  static Future<Map<String,dynamic>> getPopularPersonInfo({required num id})async{
    Response res = await dio.get('$baseUrl$id?api_key=$key');
    return res.data;
  }
}