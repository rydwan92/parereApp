class QuestionModel {
  final String question;
  final String id;

  QuestionModel({required this.question, required this.id});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      id: json['_id'],
    );
  }
}