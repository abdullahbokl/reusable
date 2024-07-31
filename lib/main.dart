import 'package:flutter/material.dart';
import 'package:reusable/core/services/service_locator/service_locator.dart';

import 'reusable_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ReusableApp());
}

Future<void> _initApp() async {
  await configureDependencies();

  await getIt.allReady();
}
