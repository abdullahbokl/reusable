import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/service_locator/service_locator.dart';
import 'core/utils/app_navigator.dart';
import 'features/home/presentation/manager/home_cubit.dart';
import 'features/home/presentation/pages/home_page.dart';

class ReusableApp extends StatelessWidget {
  const ReusableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigator.navigatorKey,
        home: const SafeArea(child: HomePage()),
      ),
    );
  }
}

List<String> strings = List.generate(100, (index) => 'Item $index');
