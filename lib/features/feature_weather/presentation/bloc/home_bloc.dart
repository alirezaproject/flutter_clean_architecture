import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/resources/date_state.dart';

import 'package:flutter_clean_architecture/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/status/current_weather_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase) : super(HomeState(currentWeatherStatus: CurrentWeatherLoading())) {
    on<LoadCurrentWeatherEvent>((event, emit) async {
      emit(state.copyWith(CurrentWeatherLoading()));

      DataState data = await getCurrentWeatherUseCase(event.cityName);

      if (data is DataSuccess) {
        emit(state.copyWith(CurrentWeatherCompleted(data.data)));
      }

      if (DataState is DataFailed) {
        emit(state.copyWith(CurrentWeatherError(data.error!)));
      }
    });
  }
}
