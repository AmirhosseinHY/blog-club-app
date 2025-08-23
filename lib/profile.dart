import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Text('Profile'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                SizedBox(width: 16),
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(32),
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.colorScheme.onSurface.withAlpha(25),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: Assets.img.stories.story8.image(
                              width: 84,
                              height: 84,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@joviedan',
                                  style: themeData.textTheme.bodyMedium!
                                      .copyWith(fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Jovi Daniel',
                                  style: themeData.textTheme.headlineMedium!
                                      .copyWith(fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'UX Designer',
                                  style: themeData.textTheme.headlineSmall!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        'About Me',
                        style: themeData.textTheme.headlineMedium!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 96,
                  right: 96,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: themeData.colorScheme.onSecondary.withAlpha(
                            200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: themeData.textTheme.headlineMedium!
                                      .copyWith(
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.titleMedium!
                                      .copyWith(
                                        color: themeData.colorScheme.onPrimary,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: themeData.textTheme.headlineMedium!
                                    .copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.titleMedium!
                                    .copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                      fontSize: 14,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: themeData.textTheme.headlineMedium!
                                    .copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.titleMedium!
                                    .copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                      fontSize: 14,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.onSurface.withAlpha(25),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'My Posts',
                            style: themeData.textTheme.headlineMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < posts.length; i++)
                    Post(post: posts[i], themeData: themeData),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
