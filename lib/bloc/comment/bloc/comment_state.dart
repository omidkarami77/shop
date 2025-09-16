part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoadingState extends CommentState {}

final class CommentRequestSuccessState extends CommentState {
  final Either<String, List<CommentClass>> response;

  CommentRequestSuccessState(this.response);
}

class CommentPostLoading extends CommentState {
  final bool isLoading;
  CommentPostLoading([this.isLoading = false]);
}

class CommentPostResponse extends CommentState {
  final Either<String, void> response;
  CommentPostResponse(this.response);
}
