import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signupTab = 1;
  int selectedTab = loginTab;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontFamily: FontFamily.avenir,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
    final labelTextStyle = TextStyle(
      color: themeData.colorScheme.onSurface,
      fontFamily: FontFamily.avenir,
      fontWeight: FontWeight.w200,
      fontSize: 18,
    );
    final textFieldStyle = TextStyle(
      color: themeData.colorScheme.onSurface,
      fontFamily: FontFamily.avenir,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 48, bottom: 48),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = loginTab;
                            });
                          },
                          child: Text(
                            'LOGIN',
                            style: tabTextStyle.apply(
                              color: selectedTab == loginTab
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = signupTab;
                            });
                          },
                          child: Text(
                            'SIGN UP',
                            style: tabTextStyle.apply(
                              color: selectedTab == signupTab
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: selectedTab == loginTab
                              ? _Login(
                                  themeData: themeData,
                                  textFieldStyle: textFieldStyle,
                                  labelTextStyle: labelTextStyle,
                                  tabTextStyle: tabTextStyle,
                                )
                              : _SignUp(
                                  themeData: themeData,
                                  textFieldStyle: textFieldStyle,
                                  labelTextStyle: labelTextStyle,
                                  tabTextStyle: tabTextStyle,
                                ),
                        ),
                      ),
                    ),
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

class _Login extends StatelessWidget {
  const _Login({
    //super.key,
    required this.themeData,
    required this.textFieldStyle,
    required this.labelTextStyle,
    required this.tabTextStyle,
  });

  final ThemeData themeData;
  final TextStyle textFieldStyle;
  final TextStyle labelTextStyle;
  final TextStyle tabTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back', style: themeData.textTheme.titleLarge),
        SizedBox(height: 12),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.displaySmall!.apply(fontSizeFactor: 0.9),
        ),
        SizedBox(height: 24),
        TextField(
          style: textFieldStyle,
          enableSuggestions: false,
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: labelTextStyle,
          ),
        ),
        SizedBox(height: 16),
        PasswordTextField(
          textFieldStyle: textFieldStyle,
          labelTextStyle: labelTextStyle,
          themeData: themeData,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              themeData.colorScheme.primary,
            ),
            foregroundColor: WidgetStateProperty.all(
              themeData.colorScheme.onPrimary,
            ),
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text('LOGIN', style: tabTextStyle.apply(fontSizeFactor: 0.9)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?'),
            SizedBox(width: 8),
            TextButton(onPressed: () {}, child: Text('Reset here')),
          ],
        ),
        SizedBox(height: 24),
        Center(
          child: Text('OR SIGN IN WITH', style: TextStyle(letterSpacing: 2)),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    //super.key,
    required this.themeData,
    required this.textFieldStyle,
    required this.labelTextStyle,
    required this.tabTextStyle,
  });

  final ThemeData themeData;
  final TextStyle textFieldStyle;
  final TextStyle labelTextStyle;
  final TextStyle tabTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to Blog Club', style: themeData.textTheme.titleLarge),
        SizedBox(height: 12),
        Text(
          'Please enter your information',
          style: themeData.textTheme.displaySmall!.apply(fontSizeFactor: 0.9),
        ),
        SizedBox(height: 24),
        TextField(
          style: textFieldStyle,
          enableSuggestions: false,
          decoration: InputDecoration(
            labelText: 'Full Name',
            labelStyle: labelTextStyle,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          style: textFieldStyle,
          enableSuggestions: false,
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: labelTextStyle,
          ),
        ),
        SizedBox(height: 16),
        PasswordTextField(
          textFieldStyle: textFieldStyle,
          labelTextStyle: labelTextStyle,
          themeData: themeData,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              themeData.colorScheme.primary,
            ),
            foregroundColor: WidgetStateProperty.all(
              themeData.colorScheme.onPrimary,
            ),
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          child: Text(
            'SIGN UP',
            style: tabTextStyle.apply(fontSizeFactor: 0.9),
          ),
        ),
        SizedBox(height: 24),
        Center(
          child: Text('OR SIGN UP WITH', style: TextStyle(letterSpacing: 2)),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.textFieldStyle,
    required this.labelTextStyle,
    required this.themeData,
  });

  final TextStyle textFieldStyle;
  final TextStyle labelTextStyle;
  final ThemeData themeData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: widget.textFieldStyle,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
              color: widget.themeData.colorScheme.primary,
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
          ),
        ),
        labelText: 'Password',
        labelStyle: widget.labelTextStyle,
      ),
    );
  }
}
