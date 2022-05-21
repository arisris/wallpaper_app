// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'pages/detail.dart';
import 'pages/home.dart';

abstract class AppRoute {
  static const HOME = "/";
  static const DETAIL = "/detail";

  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoute.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoute.DETAIL,
      page: () => DetailPage(),
    ),
  ];
}
