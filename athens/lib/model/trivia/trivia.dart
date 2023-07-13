import 'package:athens/model/trivia/trivia_solution.dart';

class Trivia {
  late final String id;
  late final String question;
  late final List<String> answers;
  late final String topicId;

  int chosenAnswer = 0;

  Trivia(Map<String, dynamic> triviaMap) {
    id = triviaMap['id'];
    question = triviaMap['question'];
    answers = (triviaMap['answers'] as List)
        .map((answer) => answer.toString())
        .toList();
    topicId = triviaMap['topicID'].toString();
  }

  void selectAnswer(int answer) {
    this.chosenAnswer = answer;
  }

  bool isAnswerCorrect(TriviaSolution solution) {
    return solution.correctAnswerIndex == chosenAnswer;
  }
}
