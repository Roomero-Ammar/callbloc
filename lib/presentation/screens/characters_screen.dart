import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/manager/cubit/characters_cubit.dart';
import 'package:callbloc/presentation/widgets/app_bar_action.dart';
import 'package:callbloc/presentation/widgets/app_bar_title_widget.dart';
import 'package:callbloc/presentation/widgets/build_search_field.dart';
import 'package:callbloc/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/build_loaded_list_widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];
   List<Character> searchedForCharacters = [];
  final searchTextController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    setState(() {
      searchedForCharacters = allCharacters.where((character) {
        return character.name?.toLowerCase().contains(searchedCharacter.toLowerCase()) ?? false;
      }).toList();
    });
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    searchTextController.clear();
    setState(() {
      searchedForCharacters = [];
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidgets(allCharacters: isSearching ? searchedForCharacters : allCharacters);
        } else {
          return CircularProgressIndicator(
            color: MyColors.myYellow,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: isSearching
            ? BuildSearchField(
                searchTextController: searchTextController,
                onChanged: addSearchedForItemsToSearchedList,
              )
            : AppBarTitle(),
        actions: [
          AppBarActions(
            isSearching: isSearching,
            startSearch: _startSearch,
            stopSearching: _stopSearching,
          ),
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
