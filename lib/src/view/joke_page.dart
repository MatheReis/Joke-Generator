import 'package:flutter/material.dart';
import 'package:joke_app/src/models/joke_state.dart';
import 'package:joke_app/src/controllers/joke_controller.dart';
import 'package:joke_app/src/services/joke_service.dart';
import 'package:http/http.dart' as http;

class JokePage extends StatelessWidget {
  JokePage({Key? key}) : super(key: key);
  final JokeController jokeController = JokeController(JokeService(
    http.Client(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jokes')),
      body: ValueListenableBuilder(
        valueListenable: jokeController,
        builder: (context, state, child) {
          if (state is InitialJokeState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  jokeController.getJoke();
                },
                child: const Text('Generate Joke'),
              ),
            );
          } else if (state is LoadingJokeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SucessJokeState) {
            return Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(18),
                  itemCount: state.jokes!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            state.jokes![index].value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            jokeController.getJoke();
                          },
                          child: const Text('New Joke'),
                        ),
                      ],
                    );
                  }),
            );
          } else if (state is ErrorJokeState) {
            return Center(
              child: Text(state.message!),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
