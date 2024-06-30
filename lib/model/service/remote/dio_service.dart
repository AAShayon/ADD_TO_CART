import 'package:add_to_cart/model/core/api_urls.dart';
import 'package:add_to_cart/model/service/remote/api_error_handler.dart';
import 'package:add_to_cart/model/service/remote/api_response.dart';
import 'package:dio/dio.dart';

abstract class FoodListService{
  Future<ApiResponse> getAllFood();
}
class ApiService extends FoodListService {
  static final ApiService _singleton = ApiService._internal();
  final Dio _dio = Dio();
  factory ApiService(){
    return _singleton;
  }
  ApiService._internal();

  @override
  Future<ApiResponse> getAllFood() async{
   try{
     Response response= await _dio.get(ApiUrl.api);
     return ApiResponse.withSuccess(response);
   }catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }
}
