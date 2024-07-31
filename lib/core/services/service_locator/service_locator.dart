import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/dio/dio_init.dart';
import 'service_locator.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @singleton
  Future<SharedPreferences> get sharedPreferences {
    return SharedPreferences.getInstance();
  }

  @singleton
  FlutterSecureStorage get secureStorage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @singleton
  Logger get logger => Logger(printer: PrettyPrinter(methodCount: 0));

  @lazySingleton
  Dio get dio => dioInit();
}
