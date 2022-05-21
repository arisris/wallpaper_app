import 'package:flutter/material.dart';

import 'app/app.dart';

main() async {
  await initializeAppServices();
  runApp(App());
}
