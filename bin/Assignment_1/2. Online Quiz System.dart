import 'dart:async';
import 'dart:io';

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final int points;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.points,
  });

  bool isCorrect(int userAnswer) {
    return userAnswer == correctOptionIndex;
  }
}

class Quiz {
  final List<Question> _questions = [];
  int _totalScore = 0;
  final int passingScore;

  Quiz({required this.passingScore});

  // Simulates fetching questions from a database
  Future<void> fetchQuestions() async {
    print('Fetching questions from database...');
    await Future.delayed(Duration(seconds: 2)); // Simulate delay

    _questions.addAll([
      Question(
        questionText: 'What is the capital of Bangladesh?',
        options: ['Barishal', 'Dhaka', 'Khulna', 'Rajshahi'],
        correctOptionIndex: 1,
        points: 10,
      ),
      Question(
        questionText: 'What is 2 + 2?',
        options: ['3', '4', '5', '6'],
        correctOptionIndex: 1,
        points: 5,
      ),
      Question(
        questionText: 'Which planet is known as the Red Planet?',
        options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
        correctOptionIndex: 1,
        points: 10,
      ),
    ]);
    print('Questions loaded.');
  }

  // Starts the quiz
  void start() {
    _totalScore = 0;
    print('\nStarting the quiz!');

    for (var question in _questions) {
      print('\n${question.questionText}');
      for (var i = 0; i < question.options.length; i++) {
        print('${i + 1}. ${question.options[i]}');
      }

      int? userAnswer;
      while (userAnswer == null || userAnswer < 1 || userAnswer > question.options.length) {
        stdout.write('Enter your answer (1-${question.options.length}): ');
        try {
          userAnswer = int.parse(stdin.readLineSync()!);
        } catch (e) {
          print('Invalid input. Please enter a number.');
        }
      }

      if (question.isCorrect(userAnswer - 1)) {
        print('Correct! +${question.points} points');
        _totalScore += question.points;
      } else {
        print('Wrong! The correct answer was ${question.options[question.correctOptionIndex]}');
      }
    }

    print('\nQuiz completed! Your total score: $_totalScore');
  }

  // Checks if the user passed
  bool hasPassed() {
    return _totalScore >= passingScore;
  }
}

void main() async {
  final quiz = Quiz(passingScore: 20);

  await quiz.fetchQuestions();

  bool passed = false;
  while (!passed) {
    quiz.start();
    if (quiz.hasPassed()) {
      print('Congratulations! You passed the quiz.');
      passed = true;
    } else {
      print('You did not pass. Try again!');
    }
  }
}