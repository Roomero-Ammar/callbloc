import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchTextController;
  final Function(String) onChanged;

  const SearchField({
    Key? key,
    required this.searchTextController,
    required this.onChanged,
  }) : super(key: key);

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
      onChanged: onChanged,
    );
  }
}
