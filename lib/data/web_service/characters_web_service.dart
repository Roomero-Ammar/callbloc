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
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print('Error fetching characters: $e');
      return []; // Return an empty list in case of an error
    }
  }
}