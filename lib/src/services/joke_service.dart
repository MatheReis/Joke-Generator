import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:joke_app/src/models/joke.dart';

class JokeService {
  final http.Client httpClient;

  JokeService(this.httpClient);

  Future<Joke> getJoke() async {
    final response = await httpClient.get(
      Uri.parse('https://api.chucknorris.io/jokes/random'),
    );
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error generating the jokes');
    }
  }
}
