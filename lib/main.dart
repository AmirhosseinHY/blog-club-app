import 'package:blogclub/article.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
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
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
          contentTextStyle: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
          onSecondary: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          titleTextStyle: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: primaryTextColor,
          ),
        ),
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
          displaySmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w200,
            fontSize: 16,
            color: secondaryTextColor,
          ),
        ),
      ),
      // home: Stack(
      //   children: [
      //     HomeScreen(),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      //   ],
      // ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const homeIndex = 0;
const articleIndex = 1;
const searchIndex = 2;
const menuIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 65,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                HomeScreen(),
                ArticleScreen(),
                SearchScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
              onTapp: (int index) {
                setState(() {
                  selectedScreenIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    //super.key,
    required this.onTapp,
  });

  final Function(int index) onTapp;

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
                  BottomNavigationItem(
                    iconFileName: 'Home.png',
                    title: 'Home',
                    onTap: () => onTapp(homeIndex),
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    title: 'Articles',
                    onTap: () => onTapp(articleIndex),
                  ),
                  Expanded(child: SizedBox()),
                  BottomNavigationItem(
                    iconFileName: 'Search.png',
                    title: 'Search',
                    onTap: () => onTapp(searchIndex),
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    title: 'Menu',
                    onTap: () => onTapp(menuIndex),
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

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.title,
    required this.onTap,
  });

  final String iconFileName;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            SizedBox(height: 4),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
