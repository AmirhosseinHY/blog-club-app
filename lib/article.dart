import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary.withAlpha(128),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => showSnackBar(context, 'the article is liked.'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              SizedBox(width: 8),
              Text(
                '2.1k',
                style: themeData.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text('Article'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                  SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      'Four Things Every Woman Needs To Know',
                      style: themeData.textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 8, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9.image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4),
                              Text('2m ago'),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              showSnackBar(context, 'the article is shared.'),
                          icon: Icon(Icons.send_outlined),
                          color: themeData.colorScheme.primary,
                        ),
                        IconButton(
                          onPressed: () => showSnackBar(
                            context,
                            'the article is bookmarked.',
                          ),
                          icon: Icon(CupertinoIcons.bookmark),
                          color: themeData.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    child: Assets.img.background.singlePost.image(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      'A man’s sexuality is never your mind responsibility.',
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                      'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                      style: themeData.textTheme.titleSmall,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withAlpha(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: Duration(milliseconds: 450)),
  );
}
