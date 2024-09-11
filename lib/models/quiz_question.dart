class QuizQuestion {


  QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers(){
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList; 
  }

  final String text;
  final List<String> answers;


}