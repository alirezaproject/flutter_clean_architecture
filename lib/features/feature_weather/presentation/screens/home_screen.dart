import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/widgets/app_background.dart';
import 'package:flutter_clean_architecture/core/widgets/dot_loading_widget.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/status/current_weather_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'Tehran';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCurrentWeatherEvent(cityName: cityName));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.currentWeatherStatus is CurrentWeatherLoading) {
                return Expanded(
                  child: DotLoadingWidget(),
                );
              }

              if (state.currentWeatherStatus is CurrentWeatherCompleted) {
                final completed = state.currentWeatherStatus as CurrentWeatherCompleted;
                final currentCityEntity = completed.currentCityEntity;
                return Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              currentCityEntity.name!,
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              currentCityEntity.weather![0].description!,
                              style: TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: AppBackground.setIconForMain(currentCityEntity.weather![0].description!),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }

              if (state.currentWeatherStatus is CurrentWeatherError) {
                return Center(
                  child: Text('Error '),
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
