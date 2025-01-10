import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/presentation/widgets/build_characters_list.dart';
import 'package:flutter/material.dart';

class buildLoadedListWidgets extends StatelessWidget {
  const buildLoadedListWidgets({super.key,required this.allCharacters});
final List<Character> allCharacters;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            BuildCharactersList(allCharacters: allCharacters),
          ],
        ),
      ),
    );
  }
}