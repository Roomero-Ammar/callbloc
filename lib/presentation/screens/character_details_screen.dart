import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/presentation/widgets/build_divider_widget.dart';
import 'package:callbloc/presentation/widgets/build_sliver_app_bar.dart';
import 'package:callbloc/presentation/widgets/character_info_widget.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(
            character: character,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfoWidget(
                          title: 'name : ', value: character.name ?? ''),
                      BuildDividerWidget(endIndent: 200),
                      CharacterInfoWidget(
                          title: 'species : ', value: character.species ?? ''),
                      BuildDividerWidget(endIndent: 120),
                      
                      CharacterInfoWidget(
                          title: 'status : ', value: character.status ?? ''),
                      BuildDividerWidget(endIndent: 70),
                      CharacterInfoWidget(
                          title: 'gender : ', value: character.gender ?? ''),
                      BuildDividerWidget(endIndent: 100),
                     SizedBox(height: 600,), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
