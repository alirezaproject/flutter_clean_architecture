import 'package:flutter_clean_architecture/core/resources/date_state.dart';
import 'package:flutter_clean_architecture/core/usecase/use_case.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/repository/weather_repo.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>, String> {
  final WeatherRepo weatherRepo;

  GetCurrentWeatherUseCase(this.weatherRepo);

  Future<DataState<CurrentCityEntity>> call(String params) {
    return weatherRepo.fetchCurrentWeatherData(params);
  }
}
