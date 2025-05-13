 
    import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poem_app/src/features/poem/data/models/models.dart';

class  PoemRemoteDataSource {
        // Make API call to fetch data and return object.
        // ...
    // 5th Step here we make the final api call using http package, and model is used and actual data is fetched
    final http.Client client;

    PoemRemoteDataSource({required this.client});

  Future<List<String>> getAuthors() async {
  final url = Uri.parse('https://poetrydb.org/author');
  final response = await client.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final authors = List<String>.from(data['authors']);
    return authors;
  } else {
    throw Exception('Failed to load authors');
  }
}


    Future<List<PoemModel>> getPoemsByAuthor(String author) async{
        final url = Uri.parse("https://poetrydb.org/author/$author");
        final response = await client.get(url);

        if(response.statusCode == 200){
            final List<dynamic> decodedJson = json.decode(response.body);
            return decodedJson.map((e) => PoemModel.fromJson(e)).toList();
        }
        else {
            throw Exception("Failed to load peoms");
        }
    }
    }