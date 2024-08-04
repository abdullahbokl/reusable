import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/service_locator/service_locator.dart';
import 'core/utils/app_navigator.dart';
import 'core/utils/size_config.dart';
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
      child: ScreenUtilInit(
        designSize: const Size(
          SizeConfig.designWidth,
          SizeConfig.designHeight,
        ),
        minTextAdapt: true,
        builder: (context, child) {
          SizeConfig.init(context);
          return child!;
        },
        child: SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
