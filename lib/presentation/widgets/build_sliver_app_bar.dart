import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:flutter/material.dart';

class BuildSliverAppBar extends StatelessWidget {
  final Character character;
  const BuildSliverAppBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: MyColors.myGrey,
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id ?? '',
          child: Image.network(
            character.image ?? '', // Ensure image is not null
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          character.name ?? '', // Ensure name is not null
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 24, // Increase font size
            fontWeight: FontWeight.bold, // Make font bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}