import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/phoneky.dart';
import '../widgets/action_add_to_favorite.dart';
import '../widgets/action_toggle_dark_mode.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final api = Get.put(PhonekyApi());

  @override
  Widget build(BuildContext context) {
    final page = 1.obs;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        title: const Text('Home'),
        actions: [const ActionAddToFavorite(), ActionToggleDarkMode()],
      ),
      body: FutureBuilder<List<WallpaperItemModel>>(
          future: api.getWallpaper(page.value),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(child: Text("No Data Result"));
              }
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Card(
                    child: InkWell(
                      onTap: () => Get.toNamed('/detail', arguments: data),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CachedNetworkImage(
                            imageUrl: data.thumb,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              data.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.find<AppSettings>().toggleDarkMode(),
      //   tooltip: 'toggle mode',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
