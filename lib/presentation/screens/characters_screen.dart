import 'package:callbloc/constants/my_colors.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/manager/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/build_loaded_list_widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

   List<Character> allCharacters = [] ;  // empty list

  @override
  void initState() {
    super.initState();

    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget()
  {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
       if(state is CharactersLoaded)
       {
        allCharacters = (state).characters ; // state list
       
       return buildLoadedListWidgets(allCharacters: allCharacters,);
       }
        else {
         return CircularProgressIndicator(color: MyColors.myYellow,);
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: MyColors.myYellow , title: Text('Characters',style: TextStyle(color: MyColors.myGrey),),),
      body: buildBlocWidget(),
    );
  }
}