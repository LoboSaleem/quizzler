import 'quations.dart';

class Quizebrain {
  int rackUm = 0;
  List<Quations> _quationBank = [
    Quations('Some cats are actually allergic to humans', true),
    Quations('You can lead a cow down stairs but not up stairs.', false),
    Quations('Approximately one quarter of human bones are in the feet.', true),
    Quations('A slug\'s blood is green.', true),
    Quations('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Quations('It is illegal to pee in the Ocean in Portugal.', true),
    Quations(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Quations(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Quations(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Quations(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Quations('Google was originally called \"Backrub\".', true),
    Quations(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Quations(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ];

  void nextQuation() {
    if (rackUm < _quationBank.length - 1) {
      rackUm++;
      print(rackUm);
    }
  }

  String getAnswerText() {
    return _quationBank[rackUm].questionText;
  }

  bool getAnswerType() {
    return _quationBank[rackUm].questionAnswer;
  }

  bool tryAgain() {
    bool checkIt = true;
    if (rackUm == _quationBank.length - 1) {
      rackUm = 0;

      checkIt = false;
    }

    return checkIt;
  }
}
