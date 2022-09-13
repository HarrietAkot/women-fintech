import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom/dialog.dart';
import '../custom/route_transitions.dart';
import 'login_page.dart';
import 'package:package_info_plus/package_info_plus.dart';




class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';

  ///
  /// get current application version
  ///
  void _loadPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  void signout() {
    // TODO: logout from app
    Navigator.pushReplacement(
      context,
      ScaleRoute(
        page: LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                ListTile(
                  leading: Icon(
                    widget.controller.themeMode == ThemeMode.dark
                        ? Icons.dark_mode_outlined
                        : widget.controller.themeMode == ThemeMode.light
                            ? Icons.light_mode_outlined
                            : Icons.phone_android_outlined,
                    size: 20.0,
                  ),
                  title: const Text(
                    "Dark / Light Mode",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Change your theme preferences here",
                    style: TextStyle(fontSize: 13.0),
                  ),
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<ThemeMode>(
                      // Read the selected themeMode from the controller
                      value: widget.controller.themeMode,
                      // Call the updateThemeMode method any time the user selects a theme.
                      onChanged: widget.controller.updateThemeMode,
                      items: const [
                        DropdownMenuItem<ThemeMode>(
                          value: ThemeMode.system,
                          child: Text(
                            'System Default',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text(
                            'Light',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text(
                            'Dark',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        )
                      ],
                      isDense: true,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: const Text(
                    "Sign out from your account",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      // color: Colors.red,
                    ),
                  ),
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                  ),
                  // trailing: const Icon(Icons.arrow_forward_outlined),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Sign Out',
                        bodyText:
                            'Are you sure you want to sign out of your account?',
                        icon: CarbonIcons.logout,
                        color: Colors.deepOrange,
                        confirmationAction: () {
                          Navigator.pop(context);
                          signout();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 10.0,
                bottom: 10.0,
              ),
              child: Text(
                "Jeba Mobile v$version ($buildNumber)",
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new theme mode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String themeMode = (sharedPreferences.getString("themeMode") ?? "");
    // print("saved theme $themeMode");
    if (themeMode == "") {
      return ThemeMode.system;
    } else if (themeMode == "ThemeMode.dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    // print(theme.toString());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("themeMode", theme.toString());
  }
}
