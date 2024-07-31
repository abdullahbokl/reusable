import 'package:flutter/material.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({
    super.key,
    required this.searchController,
    this.hint,
    this.onChanged,
  });

  final TextEditingController searchController;
  final String? hint;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: searchController,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint ?? "Search",
          hintStyle: const TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
