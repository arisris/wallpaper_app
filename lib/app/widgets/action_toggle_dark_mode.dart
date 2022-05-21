import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/settings.dart';

class ActionToggleDarkMode extends StatelessWidget {
  ActionToggleDarkMode({Key? key}) : super(key: key);
  final controller = Get.find<AppSettings>();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          controller.toggleDarkMode();
        },
        icon: Obx(() => Icon(
            controller.isDarkMode.value ? Icons.sunny : Icons.nightlight)));
  }
}
