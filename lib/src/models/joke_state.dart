import 'package:joke_app/src/models/joke.dart';

abstract class JokeState {}

class InitialJokeState extends JokeState {}

class SucessJokeState extends JokeState {
  final List<Joke>? jokes;
  SucessJokeState({this.jokes});
}

class ErrorJokeState extends JokeState {
  final String? message;
  ErrorJokeState({this.message});
}

class LoadingJokeState extends JokeState {}
