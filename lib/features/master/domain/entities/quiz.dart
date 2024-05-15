import 'package:edhub_flutter_app/features/master/domain/entities/qna.dart';

class Quiz {
  final String? title;
  final List<QnA>? qnaList;

  Quiz({
    required this.title,
    required this.qnaList,
  });
}
