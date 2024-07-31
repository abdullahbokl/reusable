import 'package:flutter/material.dart';

import 'core/common/widgets/app_paginated_list.dart';
import 'core/utils/app_navigator.dart';

class ReusableApp extends StatelessWidget {
  const ReusableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      home: Scaffold(
        appBar: AppBar(),
        body: AppPaginatedList(
          items: strings,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(strings[index]),
            );
          },
        ),
      ),
    );
  }
}

List<String> strings = List.generate(100, (index) => 'Item $index');
