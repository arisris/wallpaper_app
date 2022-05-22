import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/phoneky.dart';
import '../services/settings.dart';
import '../widgets/set_wallpaper_bottom_sheet.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final settings = Get.find<AppSettings>();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as WallpaperItemModel?;
    final isFavorite = false.obs;

    return Scaffold(
      body: args == null
          ? const Center(child: Text('No Data Result'))
          : Stack(
              children: [
                InkWell(
                  onTap: () => {
                    Get.bottomSheet(
                      SetWallPaperBottomSheet(item: args),
                    ),
                  },
                  child: Container(
                    color: Colors.black,
                    child: CachedNetworkImage(
                      imageUrl: args.thumb,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Text(
                          args.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                            onTap: () => {
                                  isFavorite.value = !isFavorite.value,
                                },
                            child: Obx(
                              () => Icon(
                                  isFavorite.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
