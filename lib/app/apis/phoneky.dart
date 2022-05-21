import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class PhonekyApi extends GetConnect {
  Future<Document?> _getDocument(String url) async {
    final response = await get(url);
    if (response.statusCode == 200) {
      return parse(response.body);
    }
    return null;
  }

  Future<List<WallpaperItemModel>> getWallpaper(int page) async {
    final document = await _getDocument("wallpapers?page=$page");
    if (document == null) return [];
    final List<WallpaperItemModel> wallpapers = [];
    final elements = document.querySelectorAll('ul.prd-details > li');
    for (final element in elements) {
      final id = element.querySelector('input[name=cid]')?.attributes['value'];
      final title =
          element.querySelector('input[name=ct]')?.attributes['value'];
      final thumb =
          element.querySelector('input[name=ci]')?.attributes['value'];
      final isNew = element
              .querySelector('span > i.m-r-xs.fadown2')
              ?.parent
              ?.text
              .trim() ==
          'NEW';
      wallpapers.add(WallpaperItemModel(id!, title!, thumb!, isNew));
    }
    //Get.log(wallpapers.toString());
    return wallpapers;
  }

  @override
  void onInit() {
    baseUrl = 'https://phoneky.com/';
    userAgent = 'Phoneky/1.0.0';
  }
}

class WallpaperItemModel {
  final String id;
  final String title;
  final String thumb;
  final bool isNew;

  WallpaperItemModel(this.id, this.title, this.thumb, this.isNew);
}
