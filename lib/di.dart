import 'package:flutter_clean_architecture/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/repository/weather_repo_impl.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/repository/weather_repo.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

configureDependencies() {
  di.registerSingleton<ApiProvider>(ApiProvider());

  /// repositories
  di.registerSingleton<WeatherRepo>(WeatherRepoImpl(di()));

  /// use case
  di.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(di()));

  /// bloc
  di.registerSingleton<HomeBloc>(HomeBloc(di()));
}
