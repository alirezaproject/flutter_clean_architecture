import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CurrentWeatherStatus {}

class CurrentWeatherLoading extends CurrentWeatherStatus {}

class CurrentWeatherCompleted extends CurrentWeatherStatus {
  final CurrentCityEntity currentCityEntity;

  CurrentWeatherCompleted(this.currentCityEntity);
}

class CurrentWeatherError extends CurrentWeatherStatus {
  final String errorMessage;

  CurrentWeatherError(this.errorMessage);
}
