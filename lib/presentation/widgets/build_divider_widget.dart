import 'package:callbloc/constants/my_colors.dart';
import 'package:flutter/material.dart';

class BuildDividerWidget extends StatelessWidget {
  const BuildDividerWidget({super.key , required this.endIndent});
  final double endIndent ;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }
}