import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:flutter/material.dart';

class BuildSearchField extends StatefulWidget {
  BuildSearchField({super.key});

  @override
  State<BuildSearchField> createState() => _BuildSearchFieldState();
}

class _BuildSearchFieldState extends State<BuildSearchField> {
  final searchTextController = TextEditingController();

  final List<Character> allCharacters = [];

  late List<Character> searchedForCharacters;

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters.where((character) {
      // Check for null and then call toLowerCase
      return character.name?.toLowerCase().contains(searchedCharacter.toLowerCase()) ?? false;
    }).toList(); 
   setState(() {
     
   });
     }
}