import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                controller.animateToPage(0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                controller.animateToPage(1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              icon: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
