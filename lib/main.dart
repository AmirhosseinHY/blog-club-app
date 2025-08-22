import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    final primaryColor = Color(0xff376AED);
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: primaryColor,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: primaryTextColor,
          ),
          titleMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w200,
            fontSize: 18,
            color: secondaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 12,
            color: secondaryTextColor,
          ),
          bodyLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: primaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: primaryColor,
          ),
          titleSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: primaryTextColor,
          ),
          bodySmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7B8BB2),
          ),
        ),
      ),
      // home: Stack(
      //   children: [
      //     HomeScreen(),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      //   ],
      // ),
      home: SplashScreen(),
    );
  }
}



class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff9B8487).withAlpha(76),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    title: 'Home',
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    title: 'Articles',
                  ),
                  SizedBox(width: 8),
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    title: 'Search',
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    title: 'Menu',
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xff376AED),
                borderRadius: BorderRadius.circular(32.5),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Assets.img.icons.plus.image(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  const _BottomNavigationItem({
    //super.key,
    required this.iconFileName,
    required this.title,
  });

  final String iconFileName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        SizedBox(height: 4),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
