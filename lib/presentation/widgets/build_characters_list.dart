// BuildCharactersList.dart
import 'package:flutter/material.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/presentation/widgets/character_item.dart';

class BuildCharactersList extends StatefulWidget {
  final List<Character> allCharacters;

  BuildCharactersList({Key? key, required this.allCharacters}) : super(key: key);

  @override
  State<BuildCharactersList> createState() => _BuildCharactersListState();
}

class _BuildCharactersListState extends State<BuildCharactersList> {
  late List<Character> searchedForCharacters;
  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchedForCharacters = widget.allCharacters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: searchTextController,
        //     decoration: const InputDecoration(
        //       hintText: 'Find a character...',
        //       border: OutlineInputBorder(),
        //     ),
        //     onChanged: (searchedCharacter) {
        //       addSearchedForItemsToSearchedList(searchedCharacter);
        //     },
        //   ),
        // ),
        GridView.builder(
          shrinkWrap: true, // This ensures the GridView takes up only as much space as needed
          physics: NeverScrollableScrollPhysics(), // Disables scrolling since the parent (Column) handles scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: searchTextController.text.isEmpty
              ? widget.allCharacters.length
              : searchedForCharacters.length,
          itemBuilder: (context, index) {
            return CharacterItem(
              character: searchTextController.text.isEmpty
                  ? widget.allCharacters[index]
                  : searchedForCharacters[index],
            );
          },
        ),
      ],
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    setState(() {
      searchedForCharacters = widget.allCharacters.where((character) {
        return character.name?.toLowerCase().contains(searchedCharacter.toLowerCase()) ?? false;
      }).toList();
    });
  }
}
