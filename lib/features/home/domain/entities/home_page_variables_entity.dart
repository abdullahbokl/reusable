import 'package:flutter/cupertino.dart';

class HomePageVariablesEntity {
  List<dynamic> allList = [];
  List<dynamic> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedMax = false;
}
