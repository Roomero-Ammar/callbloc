import 'package:callbloc/constants/my_colors.dart';
import 'package:flutter/material.dart';

class AppBarActions extends StatefulWidget {
  @override
  AppBarActionsState createState() => AppBarActionsState();
}

class AppBarActionsState extends State<AppBarActions> {
  bool isSearching = false;
  final TextEditingController searchTextController = TextEditingController();

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buildAppBarActions(),
    );
  }

  List<Widget> buildAppBarActions() {
    // todo : If I search show the icon to be able to back
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch(); // Clear the search text
            Navigator.pop(context); // Optionally close the search
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } 
    else {
          // todo : If I not search show the icon to be able to search

      return [
        IconButton(
          onPressed: startSearch, // Start the search
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey
          ),
        ),
      ];
    }


  }
}