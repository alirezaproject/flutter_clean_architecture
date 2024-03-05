import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/clouds.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/coord.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/main.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/rain.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/sys.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/weather.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/models/current_city_model/wind.dart';

@immutable
class CurrentCityEntity extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const CurrentCityEntity(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.rain,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  @override
  List<Object?> get props => [];
}
