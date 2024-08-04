import 'package:flutter/material.dart';

class HomeFilterEntity {
  HomeFilterEntity();

  ValueNotifier<String?> categoryNotifier = ValueNotifier<String?>(null);

  void clearFilters() {
    categoryNotifier.value = null;
  }

  HomeFilterEntity? _previousState;

  void savePreviousState() {
    _previousState = HomeFilterEntity()
      ..categoryNotifier.value = categoryNotifier.value;
  }

  HomeFilterEntity get returnToPreviousState {
    if (_previousState == null) {
      clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      categoryNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return categoryNotifier.value != null;
  }
}
