import 'package:dio/dio.dart';

import '../../constants/app_strings.dart';

class CharactersWebService {
  late Dio dio;

  CharactersWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 100), // Set connect timeout
      receiveTimeout: const Duration(seconds: 100), // Set receive timeout
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      // Extract the list of characters from the 'results' key
      return response.data['results'] as List<dynamic>;
    } catch (e) {
      print('Error fetching characters: $e');
      return []; // Return an empty list in case of an error
    }
  }
}
