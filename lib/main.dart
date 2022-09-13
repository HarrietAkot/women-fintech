import 'package:flutter/material.dart';
import 'package:jebajeba_beta/screens/cart_page.dart';
import 'package:jebajeba_beta/screens/create_account.dart';
import 'package:jebajeba_beta/screens/forgot_password.dart';
import 'package:jebajeba_beta/screens/home_page1.dart';
import 'package:jebajeba_beta/screens/login_page.dart';
import 'package:jebajeba_beta/screens/notifications_page.dart';
import 'package:jebajeba_beta/screens/order_history.dart';
import 'package:jebajeba_beta/screens/profile_page.dart';
import 'package:jebajeba_beta/screens/settings.dart';
import 'package:jebajeba_beta/screens/splash_screen.dart';
import 'package:jebajeba_beta/theme/theme.dart';
import 'package:provider/provider.dart';

import 'providers/search_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => SearchProvider()),
      ],
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: kLightTheme,
            darkTheme: kDarkTheme,
            themeMode: settingsController.themeMode,
            title: 'JebaApp',
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage1(),
              '/splash': (context) => SplashScreen(),
              // '/signup': (context) => SignUpPage(),
              '/login': (context) => LoginPage(),
              '/create_account': (context) => CreateAccount(),
              '/forgot_password': (context) => ForgotPassword(),
              '/home_page': (context) => HomePage1(),
              '/cart': (context) => CartPage(),
              '/profile': (context) => ProfilePage(),
              '/notifications': (context) => NotificationPage(),
              '/order_history': (context) => OrderHistoryPage(),
              SettingsPage.routeName: (context) =>
                  SettingsPage(controller: settingsController),
            },
          );
        },
      ),
    );
  }
}
