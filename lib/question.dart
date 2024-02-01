class Question {
  String id;
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question({
    required this.id,
    required this.question,
    required this.response,
    required this.explanation,
    required this.imagePath
  });

  String getImage() => 'images/$imagePath';
}


