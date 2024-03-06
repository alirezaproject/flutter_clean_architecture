// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/resources/date_state.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/current_city_model.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/repository/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  ApiProvider api;
  WeatherRepoImpl(this.api);
  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await api.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return DataFailed('something went wrong, try again ...');
      }
    } catch (e) {
      return DataFailed('something went wrong, try again ...');
    }
  }
}
