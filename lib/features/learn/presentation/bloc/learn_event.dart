part of 'learn_bloc.dart';

@immutable
sealed class LearnEvent {
  const LearnEvent();
}

final class LearnSummarizeFromImage extends LearnEvent {
  final File image;
  const LearnSummarizeFromImage({
    required this.image,
  });
}
