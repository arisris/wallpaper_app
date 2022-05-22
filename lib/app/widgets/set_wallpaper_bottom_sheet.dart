import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/phoneky.dart';
import '../services/settings.dart';
import 'button_full_width.dart';

class SetWallPaperBottomSheet extends StatelessWidget {
  final WallpaperItemModel item;

  SetWallPaperBottomSheet({Key? key, required this.item}) : super(key: key);
  final settings = Get.find<AppSettings>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: settings.isDarkMode.value ? Colors.black : Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Do you want to save this wallpaper?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonFullWidth(
                    child: const Text('Set as Home Wallpaper'),
                    onPressed: () => {Get.back()},
                  ),
                  ButtonFullWidth(
                    child: const Text('Set as Lock Screen Wallpaper'),
                    onPressed: () => {Get.back()},
                  ),
                  ButtonFullWidth(
                    child: const Text('Set Both'),
                    onPressed: () => {Get.back()},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
