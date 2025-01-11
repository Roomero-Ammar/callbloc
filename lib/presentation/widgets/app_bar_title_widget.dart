import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Characters',
    style: TextStyle(color: MyColors.myGrey),);
  }
}