import 'package:callbloc/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CharacterInfoWidget extends StatelessWidget {
  const CharacterInfoWidget({super.key, required this.title, required this.value});
  final String title ;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: MyColors.myWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),

    );
  }
}
