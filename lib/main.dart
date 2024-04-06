import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  setup();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en")],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('en'),
      child: const Application(),
    ),
  );
}
