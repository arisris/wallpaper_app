import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const darkModeKey = 'dark_mode';

class AppSettings extends GetxService {
  final _box = GetStorage();
  final isDarkMode = false.obs;
  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _box.read(darkModeKey) ?? false;
  }

  void toggleDarkMode() async {
    if (isDarkMode.value) {
      await _box.write(darkModeKey, false);
      isDarkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      await _box.write(darkModeKey, true);
      isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
