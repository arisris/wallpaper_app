import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './services/settings.dart';
import './routes.dart';

initializeAppServices() async {
  await GetStorage.init();
  Get.lazyPut<AppSettings>(() => AppSettings());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final settings = Get.find<AppSettings>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      themeMode: settings.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoute.HOME,
      getPages: AppRoute.getPages,
    );
  }
}
