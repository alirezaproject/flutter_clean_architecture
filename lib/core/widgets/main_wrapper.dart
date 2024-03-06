import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/app_background.dart';
import 'package:flutter_clean_architecture/core/widgets/bottom_nav.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/screens/bookmark_screen.dart';
import 'package:flutter_clean_architecture/features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWiget = [
      HomeScreen(),
      BookMarkScreen(),
    ];
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNav(controller: pageController),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AppBackground.getBackGroundImage(), fit: BoxFit.cover),
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWiget,
        ),
      ),
    );
  }
}

// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});

//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }

// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCurrentWeatherEvent(cityName: 'Tehran'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//       ),
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state.currentWeatherStatus is CurrentWeatherLoading) {
//             return Center(
//               child: Text('Loading ...'),
//             );
//           }

//           if (state.currentWeatherStatus is CurrentWeatherCompleted) {
//             final completed = state.currentWeatherStatus as CurrentWeatherCompleted;
//             final currentCityEntity = completed.currentCityEntity;
//             return Center(
//               child: Text('Completed'),
//             );
//           }

//           if (state.currentWeatherStatus is CurrentWeatherError) {
//             return Center(
//               child: Text('Error '),
//             );
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }
