import 'package:flutter/cupertino.dart';

import 'product_entity.dart';

class HomePageVariablesEntity {
  List<ProductEntity> allList = [];
  List<ProductEntity> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedMax = false;
}
