class QnA {
  final String? question;
  final Map<String, dynamic>? options;
  final int? answer;
  final String? explanation;
  int? userMarkedAnswer;

  QnA({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
    required this.userMarkedAnswer,
  });
}
