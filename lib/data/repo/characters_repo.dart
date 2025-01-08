import 'package:callbloc/data/models/characters/characters.dart';
import 'package:callbloc/data/web_service/characters_web_service.dart';

class CharactersRepo {
  final CharactersWebService charactersWebService;
  CharactersRepo(this.charactersWebService);

Future<List<Character>> getAllCharacters() async {

final characters = await charactersWebService.getAllCharacters();
return characters.map((character) => Character.fromJson(character)).toList();
}


}


// 1 - model
// data from data base .. pass it to 
// 2 - web service .. pass it to
// 3 - repo .. pass it to
// 4 - cubit .. pass it to
// 5 - UI