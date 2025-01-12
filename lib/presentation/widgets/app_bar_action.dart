import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  final bool isSearching;
  final VoidCallback startSearch;
  final VoidCallback stopSearching;

  AppBarActions({
    required this.isSearching,
    required this.startSearch,
    required this.stopSearching,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isSearching
          ? [
              // IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //     stopSearching();
              //   },
              //   icon: Icon(Icons.arrow_back, color: Colors.grey),
              // ),
              IconButton(
                onPressed: stopSearching,
                icon: Icon(Icons.clear, color: Colors.grey),
              ),
            ]
          : [
              IconButton(
                onPressed: startSearch,
                icon: Icon(Icons.search, color: Colors.grey),
              ),
            ],
    );
  }
}
