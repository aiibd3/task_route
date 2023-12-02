import 'package:dio/dio.dart';
import '../utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? data}) {
    return dio.get(Constants.baseURl + endPoint, queryParameters: data);
  }
}
