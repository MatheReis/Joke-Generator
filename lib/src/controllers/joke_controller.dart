import 'package:flutter/widgets.dart';
import 'package:joke_app/src/models/joke_state.dart';
import 'package:joke_app/src/services/joke_service.dart';

class JokeController extends ValueNotifier<JokeState> {
  final JokeService jokeService;

  JokeController(this.jokeService) : super(InitialJokeState());

  getJoke() {
    value = LoadingJokeState();
    jokeService.getJoke().then((joke) {
      if (value is LoadingJokeState) {
        value = SucessJokeState(jokes: [joke]);
      }
    }).catchError((error) {
      if (value is LoadingJokeState) {
        value = ErrorJokeState(message: error.toString());
      }
    });
  }
}
