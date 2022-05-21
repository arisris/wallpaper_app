import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionAddToFavorite extends StatelessWidget {
  const ActionAddToFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = false.obs;
    return IconButton(
      icon: Obx(() =>
          Icon(isFavorite.value ? Icons.favorite : Icons.favorite_border)),
      onPressed: () {
        isFavorite.value = !isFavorite.value;
      },
    );
  }
}
