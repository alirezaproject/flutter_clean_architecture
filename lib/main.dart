import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/widgets/main_wrapper.dart';
import 'package:flutter_clean_architecture/di.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/bloc/home_bloc.dart';

void main() async {
  await configureDependencies();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<HomeBloc>(),
        ),
      ],
      child: MainWrapper(),
    ),
  ));
}
