import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  var apikey = Constants.apiKey;

  // current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
      '/data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apikey, 'units': 'metric'},
    );
    //print(response.data);
    return response;
  }
}
