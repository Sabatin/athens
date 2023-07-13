import 'package:athens/model/trivia/trivia.dart';
import 'package:athens/model/trivia/trivia_solution.dart';
import 'package:athens/service/skeleton/backend.dart';

class TriviaProxy {
  static Future<Trivia> getDailyTrivia() async {
    return Trivia(await Backend.get('getDailyTrivia'));
  }

  static Future<TriviaSolution> submitAnswer(
      Trivia trivia, int answerIndex) async {
    return TriviaSolution(
      await Backend.post(
        'submitTriviaAnswer',
        {
          'triviaId': trivia.id,
          'answerIndex': answerIndex,
        },
      ),
    );
  }
}
