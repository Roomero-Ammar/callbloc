import 'package:callbloc/constants/app_strings.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/data/repo/characters_repo.dart';
import 'package:callbloc/data/web_service/characters_web_service.dart';
import 'package:callbloc/manager/cubit/characters_cubit.dart';
import 'package:callbloc/presentation/screens/character_details_screen.dart';
import 'package:callbloc/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit,
                  child: CharactersScreen(),
                ));

      case characterDetailsScreen:
      final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
