import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/manager/app_bloc_observer.dart';
import 'core/services/service_locator/service_locator.dart';
import 'reusable_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const ReusableApp());
}

Future<void> _initApp() async {
  await configureDependencies();
  await getIt.allReady();
  Bloc.observer = AppBlocObserver();
}
