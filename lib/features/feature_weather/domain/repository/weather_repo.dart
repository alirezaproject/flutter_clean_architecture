import 'package:flutter_clean_architecture/core/resources/date_state.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/entities/current_city_entity.dart';

abstract class WeatherRepo {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
}
