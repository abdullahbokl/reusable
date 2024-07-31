import 'package:flutter/material.dart';

class HomeFilterEntity {
  HomeFilterEntity();

  ValueNotifier<bool?> exampleNotifier = ValueNotifier<bool?>(null);

  void clearFilters() {
    exampleNotifier.value = null;
  }

  HomeFilterEntity? _previousState;

  void savePreviousState() {
    _previousState = HomeFilterEntity()
      ..exampleNotifier.value = exampleNotifier.value;
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
      exampleNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return exampleNotifier.value != null;
  }
}
