import 'package:callbloc/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(backgroundColor: MyColors.myYellow , title: Text('Details',style: TextStyle(color: MyColors.myGrey),),),

    );
  }
}