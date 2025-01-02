// Define the Question class
import 'dart:io';
class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });

  bool checkAnswer(String answer) => answer == correctAnswer;
}

// Define the QuizGame class
class QuizGame {
  final List<Question> _questions = [];
  int _score = 0;

  Future<void> loadQuestions() async {
    print('Loading questions...');
    await Future.delayed(Duration(seconds: 2)); // Simulate API delay

    _questions.addAll([
      Question(
        id: 1,
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin', 'Madrid'],
        correctAnswer: 'Paris',
      ),
      Question(
        id: 2,
        questionText: 'What is 5 * 2?',
        options: ['8', '10', '15', '20'],
        correctAnswer: '10',
      ),
      Question(
        id: 3,
        questionText: 'Which planet is known as the Red Planet?',
        options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
        correctAnswer: 'Mars',
      ),
    ]);

    print('Questions loaded successfully.');
  }

  void startQuiz() {
    if (_questions.isEmpty) {
      print('No questions available. Please load questions first.');
      return;
    }

    for (var question in _questions) {
      print('Question ${question.id}: ${question.questionText}');
      for (var i = 0; i < question.options.length; i++) {
        print('${i + 1}. ${question.options[i]}');
      }

      final userAnswer = _getUserAnswer(question.options);
      if (question.checkAnswer(userAnswer)) {
        print('Correct!');
        _score++;
      } else {
        print('Wrong! The correct answer was: ${question.correctAnswer}');
      }
      print('');
    }

    print('Quiz completed! Your final score is $_score/${_questions.length}.');
  }

  String _getUserAnswer(List<String> options) {
    while (true) {
      print('Enter your answer (1-${options.length}):');
      final input = int.tryParse(stdin.readLineSync() ?? '');
      if (input != null && input > 0 && input <= options.length) {
        return options[input - 1];
      }
      print('Invalid input. Please try again.');
    }
  }
}



void main() async {
  final quizGame = QuizGame();

  // Load questions asynchronously
  await quizGame.loadQuestions();

  // Start the quiz
  quizGame.startQuiz();
}
