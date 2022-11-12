import 'package:dio/dio.dart';
// https://newsapi.org/
// v2/top-headlines
// country=us
// category=business
// apiKey=6560270b4cd043d09f9e200f82e64afe

//Link for Search
// https://newsapi.org
// /v2/everything?
// q='searchValue'
// apiKey=65f7f556ec76449fa7dc7c0069f040ca
class DioHelper {
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future <Response> getData({
  required String url,
    required Map<String,dynamic> query,
})async{
    return await dio.get(url,queryParameters: query);
}
}