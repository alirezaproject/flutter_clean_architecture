import 'package:flutter_clean_architecture/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_clean_architecture/features/feature_weather/data/repository/weather_repo_impl.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/repository/weather_repo.dart';
import 'package:flutter_clean_architecture/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

configureDependencies() {
  getIt.registerSingleton<ApiProvider>(ApiProvider());

  /// repositories
  getIt.registerSingleton<WeatherRepo>(WeatherRepoImpl(getIt()));

  /// use case
  getIt.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(getIt()));

  /// bloc
  getIt.registerSingleton<HomeBloc>(HomeBloc(getIt()));
}
