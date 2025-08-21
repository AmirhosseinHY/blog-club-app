import 'package:blogclub/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';

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
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: primaryColor,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: primaryTextColor,
          ),
          titleMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w200,
            fontSize: 18,
            color: secondaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 12,
            color: secondaryTextColor,
          ),
          bodyLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: primaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xff376AED),
          ),
          titleSmall: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: primaryTextColor,
          ),
          bodySmall: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7B8BB2),
          ),
        ),
      ),
      home: Stack(
        children: [
          HomeScreen(),
          Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    final categories = AppDatabase.categories;
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      height: 32,
                      width: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.titleLarge,
                ),
              ),
              _StoryList(stories: stories, themeData: themeData),
              SizedBox(height: 16),
              _CategoryList(categories: categories, themeData: themeData),
              SizedBox(height: 8),
              _PostList(posts: posts, themeData: themeData),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    //super.key,
    required this.categories,
    required this.themeData,
  });

  final List<Category> categories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        final category = categories[realIndex];
        return _CategoryItem(category: category, themeData: themeData);
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        aspectRatio: 1.2,
        scrollPhysics: BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    //super.key,
    required this.category,
    required this.themeData,
  });

  final Category category;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 65,
          right: 65,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xff0D253C), blurRadius: 20)],
            ),
          ),
        ),
        Container(
          //margin: EdgeInsets.all(8),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              colors: [Color(0xff0D253C), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'assets/img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 42,
          bottom: 48,
          child: Text(category.title, style: themeData.textTheme.bodyLarge),
        ),
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    //super.key,
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        physics: BouncingScrollPhysics(),
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    //super.key,
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(story.name, style: themeData.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(24),
          strokeWidth: 2,
          color: Color(0xff7B8BB2),
          dashPattern: [8, 3],
          padding: EdgeInsets.all(7),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    //super.key,
    required this.posts,
    required this.themeData,
  });

  final List<PostData> posts;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Latest News', style: themeData.textTheme.headlineMedium),
              TextButton(onPressed: () {}, child: Text('More')),
            ],
          ),
        ),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: posts.length,
          itemExtent: 140,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = posts[index];
            return _Post(post: post, themeData: themeData);
          },
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    //super.key,
    required this.post,
    required this.themeData,
  });

  final PostData post;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x1a5282FF))],
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/img/posts/small/${post.imageFileName}'),
          ),
          //SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.caption, style: themeData.textTheme.headlineSmall),
                  SizedBox(height: 8),
                  Text(post.title, style: themeData.textTheme.titleSmall),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: themeData.textTheme.bodyMedium!.color,
                      ),
                      SizedBox(width: 4),
                      Text(post.likes, style: themeData.textTheme.bodyMedium),
                      SizedBox(width: 16),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: themeData.textTheme.bodyMedium!.color,
                      ),
                      SizedBox(width: 4),
                      Text(post.time, style: themeData.textTheme.bodyMedium),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                            color: themeData.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              child: Image.asset('assets/img/icons/plus.png'),
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
