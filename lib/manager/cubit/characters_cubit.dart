import 'package:bloc/bloc.dart';
import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/data/repo/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
final CharactersRepo charactersRepo;
List<Character> characters = []; //

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List <Character> getAllCharacters(){
    charactersRepo.getAllCharacters().then((characters){  //-
      emit(CharactersLoaded(characters));  //-
      this.characters;  //
    });
    return characters;  //
  }
}
