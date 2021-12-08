import 'package:app_module/app/modules/app/views/app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/utils/auth_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(AppView());
}

Future initApp() async {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await AuthPreference.init();
}
