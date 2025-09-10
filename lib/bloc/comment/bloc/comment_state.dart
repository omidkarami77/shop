part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoadingState extends CommentState {}

final class CommentRequestSuccessState extends CommentState {
  final Either<String, List<CommentClass>> response;

  CommentRequestSuccessState(this.response);
}
