import 'package:callbloc/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:callbloc/data/models/characters/characters.dart';

class BuildCharactersList extends StatelessWidget {
  final List<Character> allCharacters; // Accept the list of characters

  const BuildCharactersList({super.key, required this.allCharacters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
         itemBuilder: (context , index)
         {
          return CharacterItem(character: allCharacters[index]);
         }
         );
  }
}
